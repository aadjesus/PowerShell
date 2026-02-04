#$azureDevOpsOrg     = "$(System.CollectionUri)"
#$azureDevOpsProject = "$(System.TeamProject)"

$azureDevOpsOrg = "praxio"
$azureDevOpsProject = "desenvolvimento"

$pat = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")

$targetBranch = "refs/heads/develop"

$apiVersion = "7.1"

$patBytes = [System.Text.Encoding]::UTF8.GetBytes(":$pat")
$base64Pat = [System.Convert]::ToBase64String($patBytes)
$headers = @{
    "Authorization" = "Basic $base64Pat"
}
# ==============================================================================

$finalResults = @()

try {
    # 2. Obter todas as Definições de Build (Pipelines)
    $definitionsUrl = "https://dev.azure.com/$azureDevOpsOrg/$azureDevOpsProject/_apis/build/definitions?api-version=$apiVersion"
    Write-Host "Buscando todas as pipelines (definições de build)..."

    $definitionsResponse = Invoke-RestMethod -Uri $definitionsUrl -Headers $headers -Method Get
    $definitions = @($definitionsResponse.value |
        Where-Object { $_.name -like "GlobusWeb*"})

    Write-Host "✅ Encontradas $($definitions.Count) pipelines. Iniciando busca de builds por branch..."

    # 3. Iterar sobre cada definição para encontrar o último build na branch
    foreach ($definition in $definitions) {
        
        # Filtros de busca:
        # - definitions: ID da pipeline atual
        # - branchName: A branch desejada (obrigatório o formato refs/heads/...)
        # - $top=1: Retorna apenas o mais recente
        # - statusFilter=completed: Garante que o build finalizou (succeeded/failed/etc.)
        $buildsUrl = "https://dev.azure.com/$azureDevOpsOrg/$azureDevOpsProject/_apis/build/builds?definitions=$($definition.id)&branchName=$targetBranch&`$top=1&statusFilter=completed&api-version=$apiVersion"
        
        $buildResponse = Invoke-RestMethod -Uri $buildsUrl -Headers $headers -Method Get

        if ($buildResponse.value) {
            $lastBuild = $buildResponse.value[0]
            
            # Cria um objeto personalizado com os dados relevantes
            $finalResults += [PSCustomObject]@{
                'PipelineNome' = $definition.name
                'BuildID' = $lastBuild.id
                'BuildNumber' = $lastBuild.buildNumber
                'Branch' = $lastBuild.sourceBranch
                'Status' = $lastBuild.status
                'Resultado' = $lastBuild.result
                'HoraConclusao' = $lastBuild.finishTime
            }
        }
    }
}
catch {
    Write-Host "❌ Erro durante a comunicação com a API do Azure DevOps." -ForegroundColor Red
    Write-Host "Mensagem: $($_.Exception.Message)" -ForegroundColor Red
    return
}

# ==============================================================================
# 4. Apresentação dos Resultados
# ==============================================================================

Write-Host "`n--- Último Build da branch '$targetBranch' por Pipeline ---"

if ($finalResults.Count -gt 0) {
    # Usamos o Format-Table para clareza e organização.
    $finalResults | Select-Object PipelineNome, BuildNumber, Branch, Resultado, HoraConclusao | Format-Table -AutoSize
} else {
    Write-Host "⚠️ Nenhuma build finalizada encontrada na branch '$targetBranch' em nenhuma das pipelines."
}