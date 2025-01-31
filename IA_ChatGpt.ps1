clear 
$apiKey = ""  # pegar a chave aqui https://platform.openai.com/api-keys
$endpoint = "https://api.openai.com/v1/chat/completions"

$headers = @{
    "Authorization" = "Bearer $apiKey"
    "Content-Type"  = "application/json"
}

$body = @{
    "model" = "gpt-3.5-turbo"
    "messages" = @(@{ "role" = "system"; "content" = "Você é um assistente útil." },
                   @{ "role" = "user"; "content" = "Qual é a capital do Brasil?" })
    "temperature" = 0.7
} | ConvertTo-Json -Depth 3

$response = Invoke-RestMethod -Uri $endpoint -Method Post -Headers $headers -Body $body
#$response.choices[0].message.content
$response