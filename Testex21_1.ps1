param (
    [string]$nome,
    [string]$versao,
    [string]$possuiUi = "NAO"
)

Write-Host  "xxxxxxxxxxxxxxxxxxxxxxx $($nome) - $($versao) - $($possuiUi)"

return "ok" 