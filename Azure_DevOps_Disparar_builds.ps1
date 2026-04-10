cls

$Env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECT                 = "Desenvolvimento" 

$baseUrl        = "$($Env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI)$($Env:System_TeamProject)"

$branchName     = "refs/heads/develop"

$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ 
    Authorization = "Basic $base64AuthInfo" 
    'Content-Type' = "application/json"
}

Write-Host "Procurando Pipelines com prefixo: GlobusWeb.*End"

$uri       = "$baseUrl/_apis/build/definitions?api-version=7.1"
$response  = Invoke-RestMethod -Uri $uri -Headers $headers -Method GET
$pipelines = @($response.value |
    Where-Object { $_.name -match 'GlobusWeb.*End' } |
    Select-Object id, name, url |
    Sort-Object name)

Write-Host "$($pipelines.Count): Pipelines declaradas, Branch: $($branchName)`n"

foreach ($item in $pipelines) {
  Write-Host "Disparando build: $($item.name)"

  try {
    $body = @{
      resources = @{
        repositories = @{
          self = @{
            refName = "$branchName"
          }
        }
      }
    } | ConvertTo-Json -Depth 10

    
    #$url = "$baseUrl/_apis/pipelines/$($item.id)/runs?api-version=7.1"
    #$response = Invoke-RestMethod -Uri $url -Headers $headers  -Method Post -Body $body
    Write-Host " └── Build: $($response.name)"

  } catch {
      Write-Host " └── Erro: $($_.Exception.Message)"
  }
}

