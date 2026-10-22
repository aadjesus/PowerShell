cls



$ENV:SYSTEM_COLLECTIONURI     = "https://dev.azure.com/praxio/"
$ENV:SYSTEM_TEAMPROJECT       = "Desenvolvimento"
$ENV:BUILD_SOURCEBRANCHNAME   = "refs/heads/develop"
$ENV:BUILD_DEFINITIONNAME     = "xxxxx"


          $tags           = "GlobusWeb,develop,sigla=MOT"
          $baseUrl        = "$($ENV:SYSTEM_COLLECTIONURI)$($ENV:SYSTEM_TEAMPROJECT)/_apis"
          $uri            = "$($baseUrl)/build/builds?tagFilters=$($tags)&statusFilter=completed&resultFilter=succeeded,partiallySucceeded&queryOrder=finishTimeDescending&maxBuildsPerDefinition=1&api-version=7.1"

          $token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
          $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
          $headers        = @{
              Authorization = "Basic $base64AuthInfo"
              "Content-Type" = "application/json"
          }

          Write-Host "Procurando Pipelines com as tags: $($tags)"
          $response  = Invoke-RestMethod -Uri $uri -Headers $headers -Method GET
          $pipelines = @($response.value |
              Group-Object { $_.definition.id } |
              ForEach-Object {
                  $_.Group | Sort-Object finishTime -Descending | Select-Object -First 1
              } |
              Select-Object `
                  @{Name = 'id';          Expression = { $_.definition.id }},
                  @{Name = 'name';        Expression = { $_.definition.name }},
                  buildNumber |
              Sort-Object name)

          $pipelines | Format-Table -AutoSize | Out-String -Width 200 | Out-Host
    
          Write-Host "$($pipelines.Count): Pipelines encontradas, Branch: $($ENV:BUILD_SOURCEBRANCHNAME)`n"
    
          $body = @{
              resources = @{
                  repositories = @{
                      self = @{
                          refName = $ENV:BUILD_SOURCEBRANCHNAME
                      }
                  }
              }
              # Variável de fila: não exige parâmetro nas pipelines, disponível nos templates back-end.yml e front-end.yml
              #variables = @{
              #    BUILD_DEFINITIONNAME_ORIGIN = @{
              #        value    = "$ENV:BUILD_DEFINITIONNAME"
              #        isSecret = $false
              #    }
              #}

              tags = @(
                "Teste123"
              )

          } | ConvertTo-Json -Depth 10

          $falhas = 0
          foreach ($item in $pipelines) {
            Write-Host "Executando pipeline: $($item.name)"
            try {
              $uri      = "$baseUrl/pipelines/$($item.id)/runs?api-version=7.1-preview.1"
              #$response = Invoke-RestMethod -Uri $uri -Headers $headers -Method POST -Body $body

              Write-Host " └── Build: $($response._links.web.href)"
            } catch {
              $falhas++
              Write-Host "##vso[task.logissue type=error] └── Erro: $($_.ErrorDetails.Message) $($_.Exception.Message)"
            }
          }
    
          