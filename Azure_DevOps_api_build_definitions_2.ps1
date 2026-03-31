cls

$baseUrl        = "https://dev.azure.com/praxio/Desenvolvimento/_apis/build"
$branchName     = "refs/heads/develop"
$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ Authorization = "Basic $base64AuthInfo" }

Write-Host "Procurando Pipelines com prefixo: GlobusWeb"
$uri       = "$baseUrl/definitions?api-version=7.1"          
$response  = Invoke-RestMethod -Uri $uri -Headers $headers -Method GET
$pipelines = @($response.value |
    Where-Object { $_.name -match 'GlobusWeb.*End' } |
    Select-Object id, name, url |
    Sort-Object name)

Write-Host "$($pipelines.Count): Pipelines declaradas, Branch: $($branchName)`n"
$listaPipelines = @()
foreach ($item in $pipelines) {
  Write-Host "Procurando build pipeline: $($item.name)"
  try {
    $uri      = "$baseUrl/latest/$($item.id)?branchName=$branchName&api-version=7.1-preview.1"
    $response = Invoke-RestMethod -Uri $uri -Headers $headers -Method GET

    $listaPipelines += [PSCustomObject]@{
        'Pipeline'    = $item.name
        'BuildID'     = $item.id
        'BuildNumber' = $response.BuildNumber
    }

    Write-Host " └── Build: $($response.BuildNumber)"
  } catch {
    Write-Host " └── Erro: $($_.Exception.Message)"
  }
}

#$listaPipelines

#$pathArquivo = "$(Pipeline.Workspace)/pipelines.json"
#Write-Host "`nArquivo gerado: $($pathArquivo)"
#$jsonOutput  = $listaPipelines | ConvertTo-Json -Depth 5
#$jsonOutput | Out-File $pathArquivo -Encoding utf8
