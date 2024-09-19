Clear-Host
$sitePorta80 = (Get-Website | Where-Object { 
    (Get-WebBinding -name $_.name | Where-Object {
        $_.bindingInformation -match ':80:'
    }) 
}).name

if ($sitePorta80 -eq $null) {
    Write-Host "##vso[task.logissue type=error]--------------------------------------------------------------------------------------------------------"   
    Write-Host "##vso[task.logissue type=error]Nenhum site encontrado na porta 80."
    Write-Host "##vso[task.logissue type=error]--------------------------------------------------------------------------------------------------------"   
    Throw 
}

Write-Host "##vso[task.setvariable variable=SITE_PORTA_80;]$sitePorta80"
Write-Output ('Site porta 80: ' + $sitePorta80)