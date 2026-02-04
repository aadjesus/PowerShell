cls

$baseUrl        = "https://dev.azure.com/Praxio/Fusea/_apis/git/repositories"
$idRepositorio  = "e6683df9-6ed5-45a7-bd1c-60cac94f421d"
$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers = @{ 
    Authorization = "Basic $base64AuthInfo"
    'Content-Type' = "application/json" 
}


$branch     = "refs/heads/master"

$url        = "https://dev.azure.com/Praxio/desenvolvimento/_apis/build/builds?definitions=883&branchName=refs/heads/master&statusFilter=completed&api-version=7.1&queryOrder=finishTimeAscending"
$url        = "https://dev.azure.com/Praxio/desenvolvimento/_apis/build/builds?definitions=883&branchName=refs/heads/master&statusFilter=completed&queryOrder=finishTimeDescending&`$top=1&`$skip=10&api-version=7.1"
 
$response   = Invoke-RestMethod -Uri $url -Headers $headers -Method GET
$response

#$buildId    = $response.value[0].id
#
#
#$url        = "https://dev.azure.com/Praxio/desenvolvimento/_apis/build/builds/$buildId/leases?api-version=7.1"
#$response   = Invoke-RestMethod -Uri $url -Headers $headers -Method GET
#
#$leases     = $response.value[0].id
#
#if ($leases.Count -gt 0) {
#    $leaseIds = ($leases.leaseId) -join ","
#    $url      = "https://dev.azure.com/Praxio/desenvolvimento/_apis/build/retention/leases?ids=$leaseIds&api-version=7.1"
#    Invoke-RestMethod -Uri  -Method Delete -Headers $header
#}



#$response     = Invoke-RestMethod -Uri $url -Headers $headers -Method Delete


#"https://dev.azure.com/Praxio/desenvolviment/_apis/build/builds/$($build.id)/leases?api-version=7.1"
#"https://dev.azure.com/Praxio/desenvolviment/_apis/build/retention/leases?ids=$ids&api-version=7.1" -Method Delete -Headers $header