cls

#POST https://dev.azure.com/{org}/{project}/_apis/git/repositories/{repoId}/refs?api-version=7.1

$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers = @{ 
    Authorization = "Basic $base64AuthInfo"
    'Content-Type' = "application/json" 
}

try {
    Write-Host "Buscando branch source '$sourceBranch'"       
    
    $idRepositorio  = "e6683df9-6ed5-45a7-bd1c-60cac94f421d"
    $baseUrl  = "https://dev.azure.com/Praxio/Fusea/_apis/git/repositories"    
    $url      = "$baseUrl/$idRepositorio/refs?filter=heads/develop&api-version=7.1"
    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
    $idCommit = $response.value[0].objectId
    $idCommit
    
    $body = @{
        name    = "v8.0.0"
        message = "First beta release"
        taggedObject = @{
            objectId = $idCommit
        }
    } | ConvertTo-Json -Depth 10


    #Write-Host "`nCriando TAG"
    #$url      = "$baseUrl/$idRepositorio/annotatedtags?api-version=7.1"
    #$response = Invoke-RestMethod -Uri $url -Headers $headers -Method Post -Body $body
    #$response | ConvertTo-Json

    Write-Host "TAG criada com sucesso" 
    
} catch {
    Write-Host "Status Code: $($_.Exception.Response.StatusCode.value__)"
    Write-Host "$($_.Exception.Response.StatusDescription)"
    Write-Host "$($_.ErrorDetails.Message)"
}