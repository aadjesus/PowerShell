cls
$apps = Get-WebApplication -Site 'Default Web Site' | Where-Object { $_.Path -like "/$GlobusWeb*" }
foreach ($app in $apps) {

    $appName = $app.Path.TrimStart('/')
    Write-Host "Encontrado aplicativo: '$appName' no site '$($app.Name)'."
    $app
    try {
    continue
        Remove-WebApplication -Name $appName -Site $appName -Confirm:$false

        Stop-WebAppPool -Name $app.applicationPool -Confirm:$false
        Remove-WebAppPool -Name $app.applicationPool -Confirm:$false
        
        Remove-Item -Recurse -Force $app.PhysicalPath -Confirm:$false
    }
    catch {
        Write-Warning "  Erro ao excluir o aplicativo '$appName': $($_.Exception.Message)"
    }
}