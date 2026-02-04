cls


$buildId       = 201142#196385
$outputZipPath = "C:\temp\downloaded-artifact-$buildId.zip"

$PAT            = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($PAT)"))
$headers = @{
    Authorization = "Basic $base64AuthInfo"
}


$url = "https://dev.azure.com/praxio/Desenvolvimento/_apis/build/builds/$buildId/artifacts?artifactName=drop&api-version=7.1&`$format=zip"

try {
    Invoke-WebRequest -Uri $url -Headers $headers -Method GET -UseBasicParsing -OutFile $outputZipPath
    
    Write-Host "Download concluído com sucesso!"
    Write-Host "O artefato foi salvo em: $outputZipPath"
}
catch {
    Write-Host "ERRO ao tentar baixar o artefato."
    Write-Host $_.Exception.Message
}