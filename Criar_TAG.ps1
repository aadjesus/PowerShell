cls
function Get-Cancelar {
    param (        
	    [string]$valor
	)

	if ([string]::IsNullOrEmpty($valor)) {
		Write-Host "`nOperação cancelada." -ForegroundColor Red
		return $true
	}
	return $false 
}

#$RELEASE_NAME = "2026.Q2.S2"
Write-Host "`nInforme os dados ou" -NoNewline 
Write-Host " ENTER " -NoNewline -ForegroundColor Red
Write-Host "para cancelar:"

$VERSION = Read-Host -Prompt "`nNumero versão"      # 2.0.0
if ((Get-Cancelar -valor $VERSION)) {
	return
}
$RELEASE_NAME = Read-Host -Prompt "Nome da Release"
if ((Get-Cancelar -valor $RELEASE_NAME)) {
	return
}
$US = Read-Host -Prompt "Numero US"
if ((Get-Cancelar -valor $US)) {
	return
}

$MESSAGE = "$($RELEASE_NAME), US: #$($US)"

$ok = Read-Host -Prompt "`nMensagem Tag:`n$($MESSAGE)`n`nDigite algo para continuar"
if ((Get-Cancelar -valor $ok)) {
	return
}

$Env:PATH_DESTINO = [Environment]::GetEnvironmentVariable("GLOBUSWEB_DEV_PATH", "User")
if ($Env:PATH_DESTINO) {
	cd $Env:PATH_DESTINO
}

$arquivoLog  = "$Env:PATH_DESTINO\GlobusWeb_Log_Git_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
Start-Transcript -Path $arquivoLog -Append	

$diretorios = Get-ChildItem -Path . -Directory | 
	Where-Object { 
		$_.Name -match 'GlobusWeb.*' -and
        $_.FullName -notmatch '(UIKit|Tools)' } | 
	Select-Object FullName 

function Exec-Git {
    param([string]$comando)
    $output = Invoke-Expression "$comando 2>&1"
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Erro real detectado no comando: $comando" -ForegroundColor Red
        Write-Host $output -ForegroundColor Gray
        exit $LASTEXITCODE
    }
    return $output
}

foreach ($item in $diretorios) {    
    Write-Host "=========================================================================================================" -ForegroundColor Green    
    Write-Host $item.FullName

    try {
        cd $item.FullName
        if ($item.FullName -match 'GlobusWeb.DVS') {
            continue;
        }
        #Write-Host "`nBranch: maste" -ForegroundColor Yellow
        #Exec-Git "git checkout master"
        #Exec-Git "git pull origin master"
        #
        #Write-Host "`nBranch: develop" -ForegroundColor Yellow
        #Exec-Git "git checkout develop"
        #Exec-Git "git pull origin develop"
        #
        #Write-Host "`nCriando Branch Release: $RELEASE_NAME" -ForegroundColor Yellow
        #Exec-Git "git flow release start $RELEASE_NAME"
        
        #Write-Host "`nCriando TAG: $VERSION" -ForegroundColor Yellow
        #Exec-Git "git tag -a $VERSION -m '$MESSAGE'"        
        
        #Write-Host "`nFinalizando Release" -ForegroundColor Yellow
        #$env:GIT_MERGE_AUTOEDIT = "no"
        #Exec-Git "git flow release finish -n $RELEASE_NAME"
        #$env:GIT_MERGE_AUTOEDIT = $null
        		
        #Write-Host "`nEnviando: maste" -ForegroundColor Yellow
        #Exec-Git "git checkout master"
        #Exec-Git "git push origin master"
		
        #Write-Host "`nEnviando: develop" -ForegroundColor Yellow
        Exec-Git "git checkout develop"
        Exec-Git "git push origin develop"
		
        #Write-Host "`nEnviando: tags" -ForegroundColor Yellow
        #Exec-Git "git push origin --tags"
        
    } catch {
        Write-Host "Erro: $item`n$_" -ForegroundColor Red        
    }
}

cd $Env:PATH_DESTINO
Write-Host "`nProcesso concluído.`nVerifique o log em $arquivoLog para detalhes." -ForegroundColor Green
Stop-Transcript