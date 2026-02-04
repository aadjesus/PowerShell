cls
$parentWebSite = 'Default Web Site'
$apps = Get-WebApplication | Where-Object {
    $_.Path -like "/GlobusWeb/*" -and $_.ItemXPath -like "*$parentWebSite*"
}

foreach ($app in $apps) {
    Write-Host "Configurando aplicação: $($app.Path)" -ForegroundColor Cyan

    #$pool = "IIS:\AppPools\$($app.ApplicationPool)"
    #if (Test-Path $pool -PathType Any) {        
    #    try {
    #        Set-ItemProperty $pool -Name startMode -Value AlwaysRunning
    #    } catch {
    #        Write-Host "##[error]Não foi possivel alterar startMode: $($_.Exception.Message)"
    #    }
    #    try {
    #        Set-ItemProperty $pool -Name processModel.idleTimeoutAction -Value Suspend           
    #    } catch {
    #        Write-Host "##[error]Não foi possivel alterar idleTimeoutAction: $($_.Exception.Message)"
    #    }
    #}

    

    $site = "Default Web Site$($app.Path)"
    if (Test-Path "IIS:/Sites/$($site)" -PathType Any){
        try {
            & "$env:windir\system32\inetsrv\appcmd.exe" set app $site /preloadEnabled:true
        } catch {
            Write-Host "##[error]Não foi possivel alterar preloadEnabled: $($_.Exception.Message)"
        }
    }
}
