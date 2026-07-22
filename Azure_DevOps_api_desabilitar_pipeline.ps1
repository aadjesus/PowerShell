cls

$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ 
    Authorization = "Basic $base64AuthInfo" 
    'Content-Type' = "application/json"
}

$Env:SYSTEM_COLLECTIONURI = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECT   = "Desenvolvimento" 

$baseUrl = "$($Env:SYSTEM_COLLECTIONURI)/$($Env:SYSTEM_TEAMPROJECT)/_apis/build/definitions"


$uri       = "$($baseUrl)?api-version=7.1"
$response  = Invoke-RestMethod -Uri $uri -Headers $headers -Method GET
$pipelines = @($response.value |
    Where-Object { $_.name -match 'GlobusWeb.Pneus.*End' } |
    Select-Object id, name, queueStatus)

$novoStatus = 'enabled' 
#enabled (Enabled)
#paused (Paused)
#disabled (Disabled)


foreach ($item in $pipelines) {
    Write-Host "`nProcessando: $($item.name), status: $($item.queueStatus)"
    if ($item.queueStatus -eq $novoStatus) {
        continue
    }
    
    Write-Host "Consultando pipeline"
    $uri      = "$($baseUrl)/$($item.id)?api-version=7.1"
    $response = Invoke-RestMethod -Uri $uri -Headers $headers -Method GET
    
    Write-Host "Alterando o status"
    $response.queueStatus = $novoStatus
    
    $jsonBody = $response | ConvertTo-Json -Depth 100
    $bodyBytes = [System.Text.Encoding]::UTF8.GetBytes($jsonBody)
        
    $response = Invoke-RestMethod -Uri $uri -Method PUT -Headers $headers -Body $bodyBytes -ContentType "application/json"
    Write-Host "Pipeline atualizada para status: $($response.queueStatus)" -ForegroundColor Green
}