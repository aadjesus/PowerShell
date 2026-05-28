param (
	[string]$BaseUrl,
    [Object]$headers
)

$tags = "GlobusWeb,$($Env:BUILD_SOURCEBRANCHNAME)"
$uri  = "$($baseUrl)?tagFilters=$($tags)&statusFilter=completed&resultFilter=succeeded$top=1&api-version=7.1"
Write-Host "Consultando pipelines com as tags: $($tags)"
$response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get

$pipelines = $response.value | 
    Group-Object { $_.definition.id } | 
    ForEach-Object {
        $_.Group | Sort-Object finishTime -Descending | Select-Object -First 1
    } | 
    Select-Object -Property @{Name='name'; Expression={$_.definition.name}}, id, buildNumber

$jsonPipelines = $pipelines | ConvertTo-Json -Compress

Write-Host "Pipelines:"
($pipelines | Format-Table -AutoSize | Out-String -Width 200)

return $jsonPipelines