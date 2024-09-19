Clear

$diretorio   = 'c:\Praxio\AmbienteDev\Arquivo'
$arquivo     = 'Versoes2.json'
$arquivoJson = Get-ChildItem $diretorio -Filter $arquivo

if ($arquivoJson -eq $null) {
    @("xxx1") | ConvertTo-Json -Depth 10 | Out-File ($diretorio +'\'+ $arquivo)
    return
}

$json1 = New-Object Chilkat.JsonObject
$json1

$versoes = Get-Content $arquivoJson.FullName | ConvertFrom-Json
if ($versoes -ne $null) {
   
   
   $x1 = $versoes | where { $_ -eq "xxx1" }
   $x1
}