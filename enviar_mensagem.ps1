cls

$TeamsWebhookUrl = "https://default66b5ea26146d4b5d97c0b750658e48.4e.environment.api.powerplatform.com:443/powerautomate/automations/direct/cu/06/workflows/de5775781b0740e78967e1aea0deeabb/triggers/manual/paths/invoke?api-version=1&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=bASRnFjqBB4ZTBT2J-Yzag8VVF3Vt9xtUK1gMp8NE-s"
                    


$Env:SYSTEM_COLLECTIONURI = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECT   = "Desenvolvimento" 

$Env:Build_BuildId = 1
$Env:Build_DefinitionName = "1111"
$Env:Build_BuildNumber = "aaaa"
$Env:Build_SourceBranchName = "bbbb"
$Env:Build_SourceVersion = "ccccssssssssssssssssssssssssssssssss"
$Env:Build_SourceVersionMessage= "ddd"


    $nome  = "Alessandro Augusto De Jesus"
    $email = "alessandro.jesus@nstech.com.br"
    $email = "marcos.zuba@nstech.com.br"
    $buildUrl = "$($Env:SYSTEM_COLLECTIONURI)$($Env:SYSTEM_TEAMPROJECT)/_build/results?buildId=$($Env:Build_BuildId)"

    $card = @{
      type = "message"
      attachments = @(@{
        contentType = "application/vnd.microsoft.card.adaptive"
        content = @{
          '$schema' = "http://adaptivecards.io/schemas/adaptive-card.json"
          type = "AdaptiveCard"
          version = "1.4"
          body = @(
            @{ type = "TextBlock"; text = "❌ Pipeline falhou: $($Env:Build_DefinitionName)"; weight = "Bolder"; size = "Medium"; color = "Attention" }
            @{ type = "TextBlock"; text = "<at>$nome</at>, o build disparado pelo seu commit falhou."; wrap = $true }
            @{ type = "FactSet"; facts = @(
                @{ title = "Build";  value = "$($Env:Build_BuildNumber)" }
                @{ title = "Branch"; value = "$($Env:Build_SourceBranchName)" }
                @{ title = "Commit"; value = "$($Env:Build_SourceVersion)".Substring(0,8) }
                @{ title = "Mensagem"; value = "$($Env:Build_SourceVersionMessage)" }
            )}
          )
          actions = @(
            @{ type = "Action.OpenUrl"; title = "Abrir build"; url = $buildUrl }
          )
          msteams = @{
            entities = @(@{
              type = "mention"
              text = "<at>$nome</at>"
              mentioned = @{ id = $email; name = $nome }
            })
          }
        }
      })
    }

    $json = $card | ConvertTo-Json -Depth 20
    #Invoke-RestMethod -Uri $TeamsWebhookUrl -Method Post -Body $json -ContentType "application/json"
    Invoke-RestMethod -Uri $TeamsWebhookUrl -Method Post -Body ([System.Text.Encoding]::UTF8.GetBytes($json)) -ContentType "application/json; charset=utf-8"