# Configurações iniciais
$apiKey = ""  # Substitua pela sua chave real
$apiUrl = "https://api.deepseek.com/v1/chat/completions"  # Verifique se este é o endpoint correto

# Headers para a requisição
$headers = @{
    "Authorization" = "Bearer $apiKey"
    "Content-Type" = "application/json"
}

# Corpo da requisição
$body = @{
    model = "deepseek-chat"  # Verifique o modelo correto
    messages = @(
        @{
            role = "user"
            content = "Qual é a capital da França?"
        }
    )
    temperature = 0.7
} | ConvertTo-Json -Depth 5

# Fazendo a requisição
try {
    $response = Invoke-RestMethod -Uri $apiUrl -Method Post -Headers $headers -Body $body
    $response.choices[0].message.content
} catch {
    Write-Host "Erro ao chamar a API: $_"
    $_.Exception.Response
}