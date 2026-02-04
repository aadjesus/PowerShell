cls

try {

    $baseUrl        = "https://dev.azure.com/Praxio/Fusea/_apis/git/repositories"
    $idRepositorio  = "e6683df9-6ed5-45a7-bd1c-60cac94f421d"
    $token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
    $headers = @{ 
        Authorization = "Basic $base64AuthInfo"
        'Content-Type' = "application/json" 
    }


    Write-Host "Buscando branch source '$sourceBranch'"       

    $url      = "$baseUrl/$idRepositorio/refs?filter=heads/develop&api-version=7.1"
    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
    $idCommit = $response.value[0].objectId
    
    $body = ConvertTo-Json -InputObject @(@{
        name        = "refs/heads/release/1.2.9"
        oldObjectId = "0000000000000000000000000000000000000000"
        newObjectId = $idCommit
    })

    Write-Host "`nCriando branch"
    
    $url      = "$baseUrl/$idRepositorio/refs?api-version=7.1"
    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Post -Body $body
    $response | ConvertTo-Json
    if ($response -eq $null -or -not $response.value[0].success) {
        Write-Host "Erro ao criar branch"
        exit 0
    }

    Write-Host "Branch criada com sucesso" 
    
} catch {
    Write-Host "Status Code: $($_.Exception.Response.StatusCode.value__)"
    Write-Host "$($_.Exception.Response.StatusDescription)"
    Write-Host "$($_.ErrorDetails.Message)"
}