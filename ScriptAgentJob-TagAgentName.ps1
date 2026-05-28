param (
	[string]$baseUrl,
    [Object]$headers
)

$direcionado = $Env:RELEASE_ENVIRONMENTNAME -match "Dir"

if (-not (($Env:BUILD_SOURCEBRANCHNAME -eq "master" -and $direcionado ) -or
          ($Env:RELEASE_ENVIRONMENTNAME -match "QA" ))) {
    return
}

Write-Host "`nUltima aprovação:" 
$url      = "$($baseUrl)/$($Env:RELEASE_RELEASEID)/environments/$($Env:RELEASE_ENVIRONMENTID)?api-version=7.1"

Write-Host $url 

$response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get

$ultimoAprovador = $response.preDeployApprovals |
    where-object { $_.status -eq "approved" } |
    Sort-Object { [DateTime]$_.modifiedOn } -Descending |
    Select-Object -First 1

Write-Host "`nAprovado por: $($ultimoAprovador.approvedBy.displayName)"    
$tagAgentName = if ($direcionado) { 
    $ultimoAprovador.comments } else {
    "$($ultimoAprovador.approvedBy.uniqueName)".Split('@') | Select-Object -First 1 }

return $tagAgentName