cls

$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ Authorization = "Basic $base64AuthInfo" }

$Env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECT                 = "Desenvolvimento" 


$url1      = "$($env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI)$($env:SYSTEM_TEAMPROJECT)/_apis/build/retention/leases?definitionId=952&api-version=7.1"
                                
                               
$response = Invoke-RestMethod -Uri $url1 -Method Get -Headers $headers

Write-Host "$($response | ConvertTo-Json -Depth 10)"

$leaseId  = $response.value[0].leaseId


#$url2      = "$($env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI)$($env:SYSTEM_TEAMPROJECT)/_apis/build/retention/leases?ids=$($leaseId)&api-version=7.1"
#Invoke-RestMethod -Uri $url2 -Method Delete -Headers $headers

#$aaa -le <=
#$aaa -lt <

