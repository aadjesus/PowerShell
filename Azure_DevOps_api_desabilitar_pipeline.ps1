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

$baseUrl = "$($Env:SYSTEM_COLLECTIONURI)/$($Env:SYSTEM_TEAMPROJECT)/_apis/build/definitions"


$uri       = "$($baseUrl)?api-version=7.1"
$response  = Invoke-RestMethod -Uri $uri -Headers $headers -Method GET
$pipelines = @($response.value |
    Where-Object { $_.name -match 'GlobusWeb\.Pneus.*End' } |
    Select-Object id, name, queueStatus)

$pipelines

#foreach ($item in $pipelines) {
#    Write-Host "Processando: $($item.name) (ID: $($item.id))..."
#
#    $detailUri = "$($baseUrl)/$($item.id)?api-version=7.1"
#    $fullPipeline = Invoke-RestMethod -Uri $detailUri -Headers $headers -Method GET
#
#    Write-Host "Alterando o status do pipeline '$($pipelineDef.name)' (ID: $defId) para: $NovoStatus"
#    $fullPipeline.queueStatus = "disabled"
#
#    $jsonBody = $fullPipeline | ConvertTo-Json -Depth 100
#    $bodyBytes = [System.Text.Encoding]::UTF8.GetBytes($jsonBody)
#        
#    $updateResponse = Invoke-RestMethod -Uri $detailUri -Method PUT -Headers $headers -Body $bodyBytes -ContentType "application/json"
#    Write-Host "Pipeline '$($updateResponse.name)' atualizado para status: $($updateResponse.queueStatus)" -ForegroundColor Green
#}