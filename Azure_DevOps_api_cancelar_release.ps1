cls

# --- CONFIGURAÇÃO ---
#$orgUrl    = "$(System.TeamFoundationCollectionUri)" # Ex: https://dev.azure.com/SuaOrg/
#$project   = "$(System.TeamProject)"
#$releaseId = "$(Release.ReleaseId)"
#$envId     = "$(Release.EnvironmentId)" # ID do estágio atual
#$token     = "$(System.AccessToken)"


    $baseUrl        = "https://dev.azure.com/Praxio/Fusea/_apis/git/repositories"
    $idRepositorio  = "e6683df9-6ed5-45a7-bd1c-60cac94f421d"
    $token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
    $headers = @{ 
        Authorization = "Basic $base64AuthInfo"
        'Content-Type' = "application/json" 
    }


    Write-Host "Buscando branch source '$sourceBranch'"       

    $url      = "$baseUrl/$idRepositorio/refs?filter=heads/develop&api-version=7.1"
    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
    $idCommit = $response.value[0].objectId
    
    $body = ConvertTo-Json -InputObject @(@{
        name        = "refs/heads/release/1.2.9"
        oldObjectId = "0000000000000000000000000000000000000000"
        newObjectId = $idCommit
    })

# Sua lógica de validação de banco aqui
$validacaoBancoOk = $false # Exemplo de falha detectada

    Write-Host "##vso[task.logissue type=error]Falha na validação do Banco de Dados. Cancelando todo o estágio..."

    $body = @{
        status = "canceled"
        comment = "Interrompido automaticamente devido a erro na validação de banco de dados na máquina $($env:COMPUTERNAME)."
    } | ConvertTo-Json

    $url = "https://dev.azure.com/praxio/Desenvolvimento/_apis/release/releases/83392/environments/112983?api-version=7.1-preview.7"

    try {
        $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
        $response
   

        Write-Host "Comando de cancelamento enviado com sucesso."
    }
    catch {
        Write-Error "Falha ao tentar cancelar o release via API: $_"
    }

    # Finaliza o script com erro para garantir que esta máquina pare
    exit 1
