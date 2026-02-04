clear 
$headers = @{
    "Content-Type" = "application/json"
}

$key  = '' # pegar chaver aqui https://aistudio.google.com/apikey

$body = '{"contents": [{"parts":[{"text": "Qual a capital do Brasil"}]}]}'

$url  = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$key"

$response = Invoke-WebRequest -Uri $url -Method Post -Headers $headers -Body $body -ContentType "application/json"

Write-Host "Resposta do Gemini:"
#Write-Host $response.candidates[0].content.parts[0].text
Write-Host $response