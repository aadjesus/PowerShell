cls
$arquivo     = "Uteis.ps1"
$pathArquivo = "/Scripts/$($arquivo)"

$pat        = ""
$patBase64 	= [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$pat"))

$headers = @{
    "Authorization" = "Basic $patBase64"
}


$url = "https://dev.azure.com/Praxio/Desenvolvimento/_apis/git/repositories/GlobusWeb.Setup/items?path=$($pathArquivo)&versionDescriptor.version=master&api-version=7.1&download=true"

Write-Host "Iniciando o download de: $($url)"

$pathDestino = "D:\Downloads\$($arquivo)"
try {
    $response = Invoke-WebRequest -Uri $url -Method GET -Headers $headers -OutFile $pathDestino -UseBasicParsing
    Write-Host "Arquivo salvo em: $($pathDestino)"
}
catch {
    Write-Error $_.Exception.Message
}
