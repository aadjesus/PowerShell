cls

$Env:PATH_DESTINO = [Environment]::GetEnvironmentVariable("GLOBUSWEB_DEV_PATH", "User")
if ($Env:PATH_DESTINO) {
	cd $Env:PATH_DESTINO
}

$arquivoLog  = "$Env:PATH_DESTINO\GlobusWeb_Log_Git_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
Start-Transcript -Path $arquivoLog -Append	


$VERSION      = "2.0.0"
$RELEASE_NAME = "2026.Q2.S2"
$MESSAGE      = "$($RELEASE_NAME)

Task: #574220
US: #574219"

$diretorios = Get-ChildItem -Path . -Directory | 
	Where-Object { 
		$_.Name -match 'GlobusWeb.*' -and
        $_.FullName -notmatch '(UIKit|Tools|Setup)' } |
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
        
        Write-Host "`nBranch: maste" -ForegroundColor Yellow
        Exec-Git "git checkout master"
        Exec-Git "git pull origin master"
        
        Write-Host "`nBranch: develop" -ForegroundColor Yellow
        Exec-Git "git checkout develop"
        Exec-Git "git pull origin develop"
        
        Write-Host "`nCriando Branch Release: $RELEASE_NAME" -ForegroundColor Yellow
        Exec-Git "git flow release start $RELEASE_NAME"
        
        #Write-Host "`nCriando TAG: $VERSION" -ForegroundColor Yellow
        #Exec-Git "git tag -a $VERSION -m '$MESSAGE'"        
        #
        #Write-Host "`nFinalizando Release" -ForegroundColor Yellow
        #$env:GIT_MERGE_AUTOEDIT = "no"
        #Exec-Git "git flow release finish -n $RELEASE_NAME"
        #$env:GIT_MERGE_AUTOEDIT = $null
        #		
        #Write-Host "`nEnviando: maste" -ForegroundColor Yellow
        #Exec-Git "git checkout master"
        #Exec-Git "git push origin master"
		#
        #Write-Host "`nEnviando: develop" -ForegroundColor Yellow
        #Exec-Git "git checkout develop"
        #Exec-Git "git push origin develop"
		#
        #Write-Host "`nEnviando: tags" -ForegroundColor Yellow
        #Exec-Git "git push origin --tags"
        
    } catch {
        Write-Host "Erro: $item`n$_" -ForegroundColor Red        
    }
}

cd $Env:PATH_DESTINO
Write-Host "`nProcesso concluído.`nVerifique o log em $arquivoLog para detalhes." -ForegroundColor Green
Stop-Transcript