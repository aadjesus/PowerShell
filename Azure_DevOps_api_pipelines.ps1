cls

$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$token
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ 
    Authorization = "Basic $base64AuthInfo" 
    'Content-Type' = "application/json"
}

$Env:SYSTEM_COLLECTIONURI = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECT   = "Desenvolvimento" 
$ENV:PIPELINE_ID_RELEASE  = 828

$baseUrl        = "$($ENV:SYSTEM_COLLECTIONURI)$($ENV:SYSTEM_TEAMPROJECT)"
$uri            = "$($baseUrl)/_apis/pipelines/$($ENV:PIPELINE_ID_RELEASE)/runs?api-version=7.1-preview.1&$top=1"

$uri
$response = Invoke-RestMethod -Uri $uri -Headers $headers -Method GET    

$emExecucao = $response.value | 
    Where-Object { 
        $_.state -eq 'inProgress' -and 
        $_.resources.repositories.self.refName -eq "$ENV:BUILD_SOURCEBRANCH"
    }

#$response.value | ConvertTo-Json
#($response.value | Format-Table)
$emExecucao
$response.value[0].pipeline