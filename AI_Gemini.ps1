clear
# Instale o módulo necessário (se não estiver instalado)
Install-Module -Name Az -AllowClobber

# Conecte-se à sua assinatura do Azure
Connect-AzAccount

# Substitua pelos valores reais
$subscriptionId = "YOUR_SUBSCRIPTION_ID"
$resourceGroupName = "YOUR_RESOURCE_GROUP_NAME"
$deploymentName = "YOUR_DEPLOYMENT_NAME"
$endpoint = "YOUR_ENDPOINT" 

# Obtenha o token de acesso
$token = (Get-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -Name $deploymentName).Properties.Outputs | Where-Object {$_.type -eq "string"} | Select-Object -ExpandProperty value

# Construa a solicitação
$headers = @{
    "Authorization" = "Bearer $($token)"
    "Content-Type" = "application/json"
}
$body = @{
    "prompt" = "Sua pergunta para o Gemini"
}
$url = "$endpoint/generate_text"

# Faça a solicitação
$response = Invoke-WebRequest -Uri $url -Method Post -Headers $headers -Body (ConvertTo-Json $body)

# Verifique se a resposta foi bem-sucedida
if ($response.StatusCode -eq 200) {
    # Extraia e exiba a resposta
    $result = $response.Content | ConvertFrom-Json
    Write-Host "Resposta do Gemini:"
    Write-Host $result.text
} else {
    Write-Host "Erro ao fazer a solicitação para o Gemini. Código de status: $($response.StatusCode)"
    Write-Host "Mensagem de erro:"
    Write-Host $response.Content
}