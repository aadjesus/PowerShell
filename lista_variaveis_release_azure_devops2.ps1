# Inicializa lista
$jsonList = @()

# Coleta variáveis relevantes do ambiente
$filteredVars = Get-ChildItem Env: | Where-Object {
    $_.Name -like 'RELEASE_ARTIFACTS_*_BUILDNUMBER' -or
    $_.Name -like 'RELEASE_ARTIFACTS_*_DEFINITIONNAME'
}

# Agrupa por artefato (nome base entre o prefixo e o sufixo)
$artifacts = @{}

foreach ($var in $filteredVars) {
    if ($var.Name -match '^RELEASE_ARTIFACTS_([^_]+(?:_[^_]+)*)_(BUILDNUMBER|DEFINITIONNAME)$') {
        $artifact = $matches[1]
        $field = $matches[2]

        if (-not $artifacts.ContainsKey($artifact)) {
            $artifacts[$artifact] = @{}
        }

        $artifacts[$artifact][$field] = $var.Value
    }
}

# Transforma em lista de objetos
foreach ($artifact in $artifacts.Keys) {
    $entry = $artifacts[$artifact]
    if ($entry.ContainsKey('BUILDNUMBER') -and $entry.ContainsKey('DEFINITIONNAME')) {
        $jsonList += [PSCustomObject]@{
            BUILDNUMBER     = $entry['BUILDNUMBER']
            DEFINITIONNAME  = $entry['DEFINITIONNAME']
        }
    }
}

# Exporta para arquivo JSON
$jsonList | ConvertTo-Json -Depth 3 | Out-File "$(Agent.WorkFolder)\release_artifacts_list.json" -Encoding utf8