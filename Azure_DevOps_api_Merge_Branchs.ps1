cls

$baseUrl        = "https://dev.azure.com/Praxio/Fusea/_apis/git/repositories"
$idRepositorio  = "e6683df9-6ed5-45a7-bd1c-60cac94f421d"
$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers = @{ 
    Authorization = "Basic $base64AuthInfo"
    'Content-Type' = "application/json" 
    'Accept' = "application/json; api-version=7.1"
}

#POST https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryNameOrId}/merges?api-version=7.1


try {
    Write-Host "Criando Pull Request"
    $body = @{
        sourceRefName = "refs/heads/release/Sprint-Desconhecida"
        targetRefName = "refs/heads/master"
        title         = "Release 8.0.1"
        description   = "Release 8.0.1"
        completionOptions = @{
          deleteSourceBranch = $false
        }
      } | ConvertTo-Json -Depth 10
    $url = "https://dev.azure.com/Praxio/Fusea/_apis/git/repositories/$idRepositorio/pullrequests?api-version=7.1"
    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Post -Body $body
    
    #$idPullRequest = $response.pullRequestId
    $idPullRequest = 32035

    Write-Host "Consultando barnch release"
    $url      = "$baseUrl/$idRepositorio/refs?filter=heads/release%2FSprint-Desconhecida&api-version=7.1"
    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
    $idCommit = $response.value[0].objectId
    $idCommit

    Write-Host "Finalizando Pull Request"
    $body = @{
        status = "completed"
        lastMergeSourceCommit = @{
          commitId = $idCommit
        }
        completionOptions = @{
          mergeStrategy     = "noFastForward"
          deleteSourceBranch = $false
          bypassPolicy      = $true
          bypassReason      = "Release automatizada"
        }
      } | ConvertTo-Json -Depth 10

    $url = "https://dev.azure.com/Praxio/Fusea/_apis/git/repositories/$idRepositorio/pullrequests/$idPullRequest"

    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Patch -Body $body
    $response | ConvertTo-Json -Depth 10
    #pullRequestId  : 32035


    
} catch {
    Write-Host "$_"
}


