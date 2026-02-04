$jsonList = @{}
# Coleta variáveis relevantes do ambiente
$filteredVars = Get-ChildItem Env: | Where-Object {
    $_.Name -like 'RELEASE_ARTIFACTS_*_BUILDNUMBER' -or
    $_.Name -like 'RELEASE_ARTIFACTS_*_DEFINITIONNAME'
}

foreach ($var in $filteredVars) {
    if ($var.Name -match '^RELEASE_ARTIFACTS_(.+?)_(BUILDNUMBER|DEFINITIONNAME)$') {
        $artifactName = $matches[1]
        $fieldType = $matches[2]
        $value = $var.Value

       Write-Host '-------------------'
       Write-Host  $matches[1]
       Write-Host  $matches[2]
       Write-Host  $var.Value

        if ($fieldType -eq "DEFINITIONNAME") {
            # Inicializa o artefato no dicionário com a chave temporária
            if (-not $jsonList.ContainsKey($value)) {
                $jsonList[$value] = $null
            }
        }

        if ($fieldType -eq "BUILDNUMBER") {
            # Busca o DEFINITIONNAME correspondente ao BUILDNUMBER
            $definitionNameVar = Get-Item Env:RELEASE_ARTIFACTS_${artifactName}_DEFINITIONNAME -ErrorAction SilentlyContinue
            if ($definitionNameVar) {
                $definitionName = $definitionNameVar.Value
                $jsonList[$definitionName] = $value
            }
        }
    }
}

$jsonList | ConvertTo-Json -Depth 3 | Out-File "$(Agent.WorkFolder)\release_artifacts_list7.json" -Encoding utf8