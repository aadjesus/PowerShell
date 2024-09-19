clear
#$arqAppsettingsOrigem = 'c:\azagent\A1\GPS.appsettings.json'
$arqAppsettingsOrigem = 'c:\azagent\A1\appsettings - Copia.json'

if (-not ($arqAppsettingsOrigem | Test-Path)) {
 return
}

$arquivoJsonOrigem = Get-Content $arqAppsettingsOrigem | Out-String | ConvertFrom-Json  

$defaultConnection = $arquivoJsonOrigem.ConnectionStrings.DefaultConnection
$schemas = ConvertTo-Json -InputObject $arquivoJsonOrigem.ConnectionStrings.Schemas
$integracao = ConvertTo-Json -InputObject $arquivoJsonOrigem.ConnectionStrings.Integracao
$porta = $arquivoJsonOrigem.IIS.Porta
$hostName = $arquivoJsonOrigem.IIS.HostName

if ($defaultConnection -eq $null) {
 return
}

$defaultConnection 
$schemas

return


$arquivos = Get-ChildItem -Path 'c:\azagent\A1\_work\r1\a\_Praxio.GPSX\' -Include appsettings.json -File -Recurse
foreach ($arquivo in $arquivos) {
    Write-Host "Alterando arquivo:" $arquivo.FullName

    $textoArquivo = Get-Content -path $arquivo.FullName -Raw
    $textoArquivo = $textoArquivo -replace '"#{DefaultConnection}#"',$defaultConnection
    $textoArquivo = $textoArquivo -replace '"#{Schemas}#"', $schemas
    $textoArquivo = $textoArquivo -replace '"#{Integracao}#"', $integracao

    $textoArquivo | Set-Content -Path $arquivo.FullName
}

