param (
	[string]$baseUrl, 
	[Object]$headers,
	[string]$jsonPipelines,
	[string]$tagAgentName
)

$tagAgentName

$url = "$($baseUrl)/$($env:RELEASE_RELEASEID)?api-version=7.1"

Write-Host "`nRestaurando dados da release"
$release = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
Write-Host "Id: $($release.id)"

$release.variables | Add-Member -MemberType NoteProperty -Name JSON_PIPELINES -Value @{ value = $jsonPipelines } -Force
$release.variables | Add-Member -MemberType NoteProperty -Name TAG_AGENT_NAME -Value @{ value = $tagAgentName  } -Force
$body = $release | ConvertTo-Json -Depth 100

Write-Host "`nAtualizando dados da release"
$release = Invoke-RestMethod -Uri $url -Headers $headers -Method Put -Body $body 
Write-Host "variable.TAG_AGENT_NAME: $($release.variables.TAG_AGENT_NAME)"
Write-Host "variable.JSON_PIPELINES: $($release.variables.JSON_PIPELINES)"