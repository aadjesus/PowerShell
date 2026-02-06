cls
$apiKey   = [Environment]::GetEnvironmentVariable("RepositoriosGithub", "User")

#$checkUrl = "https://generativelanguage.googleapis.com/v1beta/models?key=$apiKey"
#(Invoke-RestMethod -Uri $checkUrl).models | Select-Object name, displayName

$model  = "gemini-2.5-flash"
$apiUrl = "https://generativelanguage.googleapis.com/v1beta/models/$($model):generateContent?key=$apiKey"

$filePath = "d:\GitHub\PowerShell\READMD.md"

if (-not (Test-Path $filePath)) {
    Write-Host "Erro: README.md não encontrado no diretório atual." -ForegroundColor Red
    return
}

$content = Get-Content -Path $filePath -Raw -Encoding UTF8

$body = @{
    contents = @(
        @{
            parts = @(
                @{ text = "Escreva um tweet de até 280 caracteres com uma dica de PowerShell. Sem emojis. O tom deve ser de 'dica de especialista'." }
            )
        }
    )
} | ConvertTo-Json -Depth 10

try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12    
    $response = Invoke-RestMethod -Method Post -Uri $apiUrl -ContentType "application/json" -Body $body
    $aiResponse = $response.candidates[0].content.parts[0].text

    Write-Host $aiResponse -ForegroundColor Green
    
    Add-Content -Path $filePath -Value "`n`n## Dica: $(Get-Date)`n$aiResponse" -Encoding UTF8

} catch {
    $status = $_.Exception.Response.StatusCode.value__
    Write-Host "Erro detectado - $($status): $_" -ForegroundColor Red
}