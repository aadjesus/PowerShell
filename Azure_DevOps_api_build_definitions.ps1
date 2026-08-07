cls

$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")

$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ Authorization = "Basic $base64AuthInfo" }


$definitionsUrl = "https://dev.azure.com/praxio/Desenvolvimento/_apis/build/definitions?api-version=7.1"

$response = Invoke-RestMethod -Uri $definitionsUrl -Headers $headers -Method GET

$builds = @($response.value |
    Where-Object { $_.name -match 'GlobusWeb.*'} |
    Select-Object  id, name, url |
    Sort-Object name
    )

$builds
$builds.Count
#$jsonOutput = $builds | ConvertTo-Json -Depth 5
#$file = "$(Pipeline.Workspace)/pipelines.json"
#$json | Out-File $file -Encoding utf8

$token 