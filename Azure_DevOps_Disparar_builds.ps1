cls

$Env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECT                 = "fusea" 

$baseUrl        = "$($Env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI)$($Env:System_TeamProject)"

$branchName     = "refs/heads/develop"

$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ 
    Authorization = "Basic $base64AuthInfo" 
    'Content-Type' = "application/json"
}

Write-Host "Procurando Pipelines com prefixo: GlobusWeb.*End"

$uri       = "$baseUrl/_apis/build/builds?statusFilter=completed&resultFilter=succeeded&queryOrder=finishTimeDescending&maxBuildsPerDefinition=1&api-version=7.1"
$response  = Invoke-RestMethod -Uri $uri -Headers $headers -Method GET


$builds   = ($response.value |  Where-Object { $_.definition.name -match 'GlobusWeb.*End' } )
$repositorios = @($builds |
    Group-Object -Property { $_.repository.id } |
    Select-Object @{Name = "id";        Expression = { $_.Name }},
                  @{Name = "name";      Expression = { ($_.Group.repository.name | Select-Object          -Unique) }},
                  @{Name = "pipelines"; Expression = { ($_.Group.definition      | Select-Object name, id -Unique) }} |
    Sort-Object name)

$qtde = $repositorios.Count

Write-Host "$($repositorios | ConvertTo-Json -Depth 10)"

$qtde