cls

cd C:\Praxio\GlobusWeb\GlobusWeb.Abastecimento
#Azure_DevOps_api_build_definitions.ps1
$tags    = git tag --sort=-creatordate | Select-Object -First 2
$commits = (git log "$($tags[1])..$($tags[0])" --format="- %s") | 
    ForEach-Object { if ($_ -match '#([0-9]+)') { $Matches[1] }}

    # Select-String '#[0-9]+' | % { $_.Matches.Groups[1].Value } #Select-Object ($_ -match "#[0-9]+")

$commits

# [regex]::Matches($inputString, '#([0-9]+)') | ForEach-Object { $_.Groups[1].Value }
#    $numero  = $servico.PathName | Select-String 'A(\d+)' | % { [int]$_.Matches.Groups[1].Value } 


$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ 
    Authorization = "Basic $base64AuthInfo"
    'Content-Type' = "application/json"  
}

#$definitionsUrl = "https://dev.azure.com/praxio/Desenvolvimento/_apis/wit/workitems?ids=600176,600176,579491,578896,576903,573660,573660,545289,539200&api-version=7.1"
#$response = Invoke-RestMethod -Uri $definitionsUrl -Headers $headers -Method GET
#$response.value | Select-Object @{Name='idBuild'; Expression={$_.id}},                                
#                                @{Name='Title'; Expression={$_.fields}}


$definitionsUrl = "https://dev.azure.com/praxio/Desenvolvimento/_apis/wit/workitemsbatch?api-version=7.1"


$body = @{
    ids = @(600176,600176,579491,578896,576903,573660,573660,545289,539200)
    fields= @(
        "System.Id",
        "System.Title",
        "System.WorkItemType")
} | ConvertTo-Json -Depth 10


$response = Invoke-RestMethod -Uri $definitionsUrl -Headers $headers -Method POST -Body $body

$response.value | ConvertTo-Json -Depth 10
#$response

#POST https://dev.azure.com/fabrikam/_apis/wit/workitemsbatch?api-version=7.1
#{
#  "ids": [
#    297,
#    299,
#    300
#  ],
#  "fields": [
#    "System.Id",
#    "System.Title",
#    "System.WorkItemType",
#    "Microsoft.VSTS.Scheduling.RemainingWork"
#  ]
#}