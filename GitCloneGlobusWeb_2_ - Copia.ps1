cls

$pathDestino = Read-Host "Diretório destino"
$arquivoLog  = "$pathDestino\GlobusWeb_Log_Git_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"

if (-not (Test-Path $pathDestino)) {
    try {
        New-Item $pathDestino -Type Directory -Force | Out-Null
    } catch {
        Write-Host "Erro ao criar diretório $pathDestino : $_" -ForegroundColor Red
        exit 1
    }
}

$organization = "praxio"
$project      = "Desenvolvimento"

$secureToken  = Read-Host "Personal Access Tokens" -AsSecureString
$token        = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureToken))
$uri          = "https://dev.azure.com/$organization/$project/_apis/git/repositories?api-version=7.0"

$headers = @{
    Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
}

try {
    $response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get
	$lista    = $response.value | Where-Object { $_.name -like "GlobusWeb.*" }
	if ($response.value -eq $null -or $lista -eq $null) {
		Write-Host "Não foi possível conectar no 'https://dev.azure.com/$organization/$project/' com o token informado, ou nenhum repositório com o prefixo 'GlobusWeb.*'."
		return		
	}

	$nomesConcatenados = ($lista.name -join "`n")
	Write-Host "Repositórios encontrados com o prefixo 'GlobusWeb.*':`n$nomesConcatenados"

	
    Write-Host "`nPressione 'nN' para cancelar ou qualquer outra tecla para continuar."
	$keyInfo = [Console]::ReadKey($true)
	if ($keyInfo.Key -eq 'n') {
        Write-Host "`nOperação cancelada."
        break
    }		
	
	Start-Transcript -Path $arquivoLog -Append
	
    foreach ($item in $lista) {
		$url  = $item.remoteUrl
		$nome = $item.name

		Write-Host ('-' * $Host.UI.RawUI.WindowSize.Width)	
        Write-Host "`nNome: $nome" -ForegroundColor Green	
        Write-Host "URL: $url" -ForegroundColor Cyan
        
        cd $pathDestino
		try {

			
			if (Test-Path $nome) {
				Write-Host "`nAtualizando repositório"
				cd $nome
				
                try {
                    git status
                    if ($LASTEXITCODE -ne 0) {
                        throw 
                    }
                    
                } catch {
                	Write-Host "`nDiretório existe mas não é um repositório Git" -ForegroundColor Red
					continue
		        }                

				
				git fetch --all
				git checkout master 2>&1 | Out-Null
				git pull origin master
				
				git checkout develop 2>&1 | Out-Null
				git pull origin develop
				
				continue
			}

            Write-Host "`nClonando repositório"
            Write-Host $url
			git clone $url
			if (-not $?) {
				Write-Host "Falha ao clonar repositório" -ForegroundColor Red
                continue
			}

			Write-Host "`nInicializando GitFlow"
			cd $nome
			git flow init -f --defaults
			
		} catch {
			Write-Host "Erro ao processar $nome, erro: $_" -ForegroundColor Red
		}			
    }
} catch {
    Write-Host "Erro ao conectar ao Azure DevOps: $_" -ForegroundColor Red
}

cd $pathDestino
Write-Host "`nProcesso concluído. Verifique o log em $arquivoLog para detalhes." -ForegroundColor Green
Stop-Transcript

Start-Sleep -Milliseconds 100
[GC]::Collect()
[GC]::WaitForPendingFinalizers()