cls

$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ Authorization = "Basic $base64AuthInfo" }

$env:BUILD_REQUESTEDFOR       = "Alessandro Augusto"
$env:BUILD_REQUESTEDFOREMAIL  = "alessandro.jesus@nstech.com.br"
$env:TEAMS_WORKFLOW_URL       = "https://default66b5ea26146d4b5d97c0b750658e48.4e.environment.api.powerplatform.com:443/powerautomate/automations/direct/cu/08/workflows/222e782973e443659f18b05f63eacbe2/triggers/manual/paths/invoke?api-version=1&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=l71WLtH3M0H4PucuF4jv9lnLAef1TVQ2ASnxLpSXQOI"

$Env:SYSTEM_COLLECTIONURI     = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECT       = "Desenvolvimento" 
$env:BUILD_BUILDID            = "1010"

$ENV:BUILD_DEFINITIONNAME     = "GlobusWeb.Aba.Back"

$Env:Build_SourceVersion        = "Build_SourceVersion"
$env:BUILD_BUILDNUMBER          = "BUILD_BUILDNUMBER"
$env:BUILD_SOURCEBRANCHNAME     = "BUILD_SOURCEBRANCHNAME"
$env:BUILD_SOURCEVERSIONMESSAGE = "BUILD_SOURCEVERSIONMESSAGE"

$nome  = "$env:BUILD_REQUESTEDFOR"
$email = "$env:BUILD_REQUESTEDFOREMAIL"

if ([string]::IsNullOrWhiteSpace($env:TEAMS_WORKFLOW_URL) -or $env:TEAMS_WORKFLOW_URL -like '$(*') {
  Write-Host "##[warning]Variável TEAMS_WORKFLOW_URL não configurada, mensagem não enviada"
  exit 0
}

Write-Host "Enviando mensagem Teams para: $nome <$email>"

$body1 = @{
  email       = $email
  nome        = $nome
  attachments = @(@{
    contentType = "application/vnd.microsoft.card.adaptive"
    content     = @{
      '$schema' = "http://adaptivecards.io/schemas/adaptive-card.json"
      type      = "AdaptiveCard"
      version   = "1.4"
      body      = @(
        @{ type = "TextBlock"; text = "❌ Pipeline falhou: $($env:BUILD_DEFINITIONNAME)"; weight = "Bolder"; size = "Medium"; color = "Attention"; wrap = $true }
        @{ type = "TextBlock"; text = "$nome, o build disparado por você falhou."; wrap = $true }
        @{ type = "FactSet"; facts = @(
            @{ title = "Build";    value = "$env:BUILD_BUILDNUMBER" }
            @{ title = "Branch";   value = "$env:BUILD_SOURCEBRANCHNAME" }
            @{ title = "Commit";   value = "$env:BUILD_SOURCEVERSION" }
            @{ title = "Mensagem"; value = "$env:BUILD_SOURCEVERSIONMESSAGE" }
        )}
      )
      actions   = @(
        @{ 
            type = "Action.OpenUrl"; 
            title = "Abrir build"; 
            url = "$($env:SYSTEM_COLLECTIONURI)$($env:SYSTEM_TEAMPROJECT)/_build/results?buildId=$($env:BUILD_BUILDID)" }
      )
    }
  })
} | ConvertTo-Json -Depth 20

$body2 = @{
  attachments = @(@{
    contentType = "application/vnd.microsoft.card.adaptive"
    content     = @{
      '$schema' = "http://adaptivecards.io/schemas/adaptive-card.json"
      type      = "AdaptiveCard"
      version   = "1.4"
      body      = @(
        @{
          type = "Container"
          style = "attention" 
          bleed = $true
          items = @(
            @{ type = "TextBlock"; text = "❌ PIPELINE FALHOU"; weight = "Bolder"; size = "Large"; wrap = $true }
            @{ type = "TextBlock"; text = "**Pipeline:** $($env:BUILD_DEFINITIONNAME)"; size = "Small"; spacing = "None"; wrap = $true }
          )
        }
        @{
          type = "Container"
          items = @(
            @{ type = "TextBlock"; text = "Olá $nome, o build disparado por você falhou na execução das seguintes tasks:"; wrap = $true; spacing = "Medium" }
            @{ type = "TextBlock"; text = "⚠️ **Tasks com erro:** $tasksComErro"; color = "Attention"; wrap = $true }
            @{ 
              type = "FactSet"
              spacing = "Large"
              facts = @(
                @{ title = "Branch";   value = "$env:BUILD_SOURCEBRANCHNAME" }
                @{ title = "Commit";   value = "$env:BUILD_SOURCEVERSIONMESSAGE" }
              )
            }
          )
        }
      )
      actions   = @(
        @{ type = "Action.OpenUrl"; title = "Ver Detalhes no Azure DevOps"; url = "$($env:SYSTEM_COLLECTIONURI)$($env:SYSTEM_TEAMPROJECT)/_build/results?buildId=$($env:BUILD_BUILDID)" }
      )
    }
  })
} | ConvertTo-Json -Depth 20

$body2

$body = $body2
$body = [System.Text.Encoding]::UTF8.GetBytes($body)

try {
  Invoke-RestMethod -Uri $env:TEAMS_WORKFLOW_URL -Method Post -Body $body -ContentType "application/json; charset=utf-8" | Out-Null
  Write-Host "Mensagem enviada"
} catch {
  Write-Host "##[warning]Falha ao enviar mensagem Teams: $($_.Exception.Message)"
}