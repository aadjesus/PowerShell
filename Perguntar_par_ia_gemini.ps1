cls
$apiKey   = [Environment]::GetEnvironmentVariable("RepositoriosGithub", "User")

#$checkUrl = "https://generativelanguage.googleapis.com/v1beta/models?key=$apiKey"
#(Invoke-RestMethod -Uri $checkUrl).models | Select-Object name, displayName

$model = "gemini-2.5-flash"
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
                @{ text = "Resuma o seguinte texto em no máximo 200 palavras: $content" }
            )
        }
    )
} | ConvertTo-Json -Depth 10

try {
    # Forçamos o TLS 1.2 para evitar problemas de conexão segura
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    
    $response = Invoke-RestMethod -Method Post -Uri $apiUrl -ContentType "application/json" -Body $body
    
    Write-Host $response -ForegroundColor Green

    $aiResponse = $response.candidates[0].content.parts[0].text

    Write-Host $aiResponse -ForegroundColor Green
    
    # Gravando o resultado
    Add-Content -Path $filePath -Value "`n`n## Resumo IA`n$aiResponse" -Encoding UTF8
    Write-Host "Processado com sucesso!" -ForegroundColor Green

} catch {
    $status = $_.Exception.Response.StatusCode.value__
    Write-Host "Erro detectado: $_" -ForegroundColor Red
    
    if ($status -eq 404) {
        Write-Host "Dica: O erro 404 indica que o modelo '$model' não foi encontrado ou a URL da API está incorreta." -ForegroundColor Yellow
    }
}