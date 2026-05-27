cls

$tags      = "GlobusWeb,$($Env:BUILD_SOURCEBRANCHNAME)"
$baseUrl = "$($Env:SYSTEM_TASKDEFINITIONSURI)$($Env:SYSTEM_TEAMPROJECTID)/_apis/build/builds"
$uri         = "$($baseUrl)?tagFilters=$($tags)&statusFilter=completed&resultFilter=succeeded$top=1&api-version=7.1"

$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($Env:SYSTEM_ACCESSTOKEN)"))
$headers             = @{ Authorization = "Basic $base64AuthInfo"; "Content-Type" = "application/json" }

Write-Host "Procurando Pipelines com as tags: $($tags)"
$response = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers

$pipelines = $response.value | 
    Group-Object { $_.definition.id } | 
    ForEach-Object {
        $_.Group | Sort-Object finishTime -Descending | Select-Object -First 1
    } | 
    Select-Object -Property @{Name='name'; Expression={$_.definition.name}}, id, buildNumber, finishTime

$jsonPipelines = $pipelines | ConvertTo-Json -Compress

($pipelines | Format-Table -AutoSize | Out-String -Width 200)

#-------------------------------------------------------------------------------------------------

$url = "$($env:SYSTEM_TEAMFOUNDATIONSERVERURI)$env:SYSTEM_TEAMPROJECT/_apis/Release/releases/$($env:RELEASE_RELEASEID)?api-version=7.1"

Write-Host "Restaurando release"
$release = Invoke-RestMethod -Uri $url -Method Get -Headers $headers
$release.variables | Add-Member -MemberType NoteProperty -Name JsonPipelines -Value @{ value = $jsonPipelines } -Force

$body = $release | ConvertTo-Json -Depth 100
Write-Host "Atualizando release"
$release = Invoke-RestMethod -Uri $url -Method Put -Body $body -Headers $headers
Write-Host "JsonPipelines: $($release.variables.JsonPipelines)"
