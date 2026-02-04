cls

$base        = 'Praxio\GlobusWeb'
$pathDestino = Read-Host "Informe o diretório base. (ENTER = $($base))"
if ([string]::IsNullOrEmpty($pathDestino)) {
    $pathDestino = $base
}

$pathDestino = "$($ENV:SystemDrive)\$($pathDestino)";
Write-Host "Destino: $pathDestino";

$resposta = Read-Host -Prompt "Pressione (S|ENTER) para confirmar";
if (-not ($resposta -match "^(S|s)?$")) {
    Write-Host "`nOperação cancelada."
    Exit 1
}

$arquivoLog  = "$pathDestino\GlobusWeb_Log_Git_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
Start-Transcript -Path $arquivoLog -Append	

if (-not (Test-Path $pathDestino)) {
    try {
        New-Item $pathDestino -Type Directory -Force | Out-Null
    } catch {
        Write-Host "Erro ao criar diretório $pathDestino`n$_" -ForegroundColor Red
        Exit 1
    }
}

$secureToken = Read-Host "Personal Access Tokens" -AsSecureString
$token       = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureToken))
$uri         = "https://dev.azure.com/praxio/Desenvolvimento/_apis/git/repositories?api-version=7.0"

$headers = @{
    Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
}

try {
    $response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get
	$lista    = $response.value | Where-Object { $_.name -like "GlobusWeb.*" }
	if ($response.value -eq $null -or $lista -eq $null) {
		Write-Host "Não foi possível conectar no 'https://dev.azure.com/praxio/Desenvolvimento/'." -ForegroundColor Red
        Exit 1
	}

    $totalRepositorio = $lista.Count
	Write-Host "'$totalRepositorio' Repositórios encontrados com o prefixo 'GlobusWeb.*'"

    $resposta = Read-Host -Prompt "Pressione (S|ENTER) para confirmar";
    if (-not ($resposta -match "^(S|s)?$")) {
        Write-Host "`nOperação cancelada."
        Exit 1
    }
	
    cls
    
    $contador = 0
    foreach ($item in $lista) {
        $url  = $item.remoteUrl
		$nome = $item.name

        $contador++
        $porcentagem = [int](($contador / $totalRepositorio) * 100)
        Write-Progress -Activity "Clonando repositórios:" -Status "($contador de $totalRepositorio): $($nome)" -PercentComplete $porcentagem

        if ($contador -gt 1) {
            $linhaFinal = [Console]::CursorTop    
            [Console]::SetCursorPosition(0, 7)
            for ($i = 7; $i -le $linhaFinal; $i++) {                
                Write-Host (" " * [Console]::WindowWidth)
            }
        }
        
        $linha =  7
        [Console]::SetCursorPosition(0, $linha)
		Write-Host ('-' * [Console]::WindowWidth)
        
        cd $pathDestino
		if (Test-Path $nome) {
		    continue
        }
		try {

			git clone $url
			if (-not $?) {
				Write-Host "Falha ao clonar repositório" -ForegroundColor Red
                continue
			}

			Write-Host "`nInicializando GitFlow"
			cd $nome
			git flow init -f --defaults
			
		} catch {
			Write-Host "Erro ao tentar clonar o repositório: $nome`n$_" -ForegroundColor Red
		}			
    }
} catch {
    Write-Host "`Erro ao conectar ao Azure DevOps`n$_" -ForegroundColor Red
    Exit 1
}
cls

cd $pathDestino
Write-Host "`nProcesso concluído.`nVerifique o log em $arquivoLog para detalhes." -ForegroundColor Green
Stop-Transcript

Start-Sleep -Milliseconds 100
[GC]::Collect()
[GC]::WaitForPendingFinalizers()