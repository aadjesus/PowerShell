. (Join-Path $PSScriptRoot '\Uteis.ps1')

& "$PSScriptRoot\ProcuraParentWebsite.ps1"

$porta = $Env:PARENT_WEBSITE_PORTA
$site  = Get-Website -Name $Env:PARENT_WEBSITE
Write-Host 'aaaaaaaaaaaaaaaaaa'
Write-Host $site.name

$binding = $site.Bindings.Collection | Where-Object {
    ($_.bindingInformation.Split(':')[1] -eq "$($porta)")
}

$bindingInfo = $binding.bindingInformation.Split(':')
$hostHeader  = $bindingInfo[2]
$hostName    = if ($hostHeader) { $hostHeader } else { "localhost" }
$protocol    = $binding.protocol
$baseUrl     = "$($protocol)://$($hostName):$($porta)/GlobusWeb"

$apps        = Get-WebApplication | Where-Object {
    $_.ItemXPath -like "*$($site.Name)*" -and $_.Path -like "/GlobusWeb/*"
}

foreach ($app in $apps) {
    #$appPath = $app.Path.TrimStart("/$parentAppName") # pega só o sufixo
    #$fullUrl = "$baseUrl$appPath".Replace("//", "/").Replace(":/", "://")
    #Write-Host "Aplicação: $($app.Path) => $fullUrl"
    Write-Host "Aplicação: $($app.Path) - Físico: $($app.PhysicalPath)"
}