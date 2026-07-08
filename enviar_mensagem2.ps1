
cls

$payload = @{
    type        = "message"
    attachments = @(
        @{
            contentType = "application/vnd.microsoft.card.adaptive"
            content     = @{
                type     = "AdaptiveCard"
                body     = @(
                    @{
                        type = "TextBlock"
                        text = "Message Text"
                    }
                )
                '$schema' = "http://adaptivecards.io/schemas/adaptive-card.json"
                version  = "1.2"
            }
        }
    )
}

$payload = @{ 
    type = "message" 
    attachments = @( 
        @{ 
            contentType = "application/vnd.microsoft.card.adaptive" 
            content = @{ 
                type = "AdaptiveCard" 
                body = @( 
                    @{ 
                        type = "TextBlock" 
                        text = "Seu novo texto aqui!" 
                        } ) 
                        '$schema' = "http://adaptivecards.io/schemas/adaptive-card.json" 
                        version = "1.2" 
                        } } ) }


# O parâmetro -Depth garante que o PowerShell converta todos os níveis do objeto sem truncar
$adaptiveCardJson = $payload | ConvertTo-Json -Depth 10

$payload = @{
    type        = "message"
    attachments = @(
        @{
            contentType = "application/vnd.microsoft.card.adaptive"
            content     = @{
                type     = "AdaptiveCard"
                version  = "1.4"  # Atualizado para 1.4, mais compatível com o Teams atual
                '$schema' = "http://adaptivecards.io/schemas/adaptive-card.json"
                body     = @(
                    @{
                        type = "TextBlock"
                        text = "Mensagem enviada via PowerShell com sucesso!"
                        weight = "Bolder"
                        size = "Medium"
                    }
                )
            }
        }
    )
}

$payload = @{
    mensagem = "Olá! Aqui está o arquivo que você precisa acessar: <a href='https://www.google.com'>Clique aqui para abrir</a>"
}

$adaptiveCardJson = $payload | ConvertTo-Json -Depth 10


# O envio com o Invoke-RestMethod permanece exatamente o mesmo do exemplo anterior

# URL do Webhook
$webhookUrl = "https://default66b5ea26146d4b5d97c0b750658e48.4e.environment.api.powerplatform.com:443/powerautomate/automations/direct/cu/29/workflows/297595303aff40fb8b6dd1a07bd4147e/triggers/manual/paths/invoke?api-version=1&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=UZHoJHZKMHYeg5tXBOzDifhUHlr1ArqG0WWivfTmWYE"               
$webhookUrl = "https://default66b5ea26146d4b5d97c0b750658e48.4e.environment.api.powerplatform.com:443/powerautomate/automations/direct/cu/14/workflows/4599ffb440d24ba794b2de6729457681/triggers/manual/paths/invoke?api-version=1&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=C6InhZX-ai1lqwwwl6amT0JQOQAkS-dwARwAMp8qHXk"
$webhookUrl = "https://default66b5ea26146d4b5d97c0b750658e48.4e.environment.api.powerplatform.com:443/powerautomate/automations/direct/cu/15/workflows/71cc6d5d07f1486692131e9112557551/triggers/manual/paths/invoke?api-version=1&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=-9ClBo5sax51GtgGGWY6YErJX_JliimXdKmi_PKqpU4"

# Definição dos Headers (Equivalente ao DefaultRequestHeaders do HttpClient)
$headers = @{
    "Accept" = "application/json"
}

# Envio da requisição POST
$response = Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $adaptiveCardJson -ContentType "application/json; charset=utf-8" -Headers $headers

# Exibe a resposta do servidor (se houver)
$response