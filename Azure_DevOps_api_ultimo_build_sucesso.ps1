cls

$token      = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ Authorization = "Basic $base64AuthInfo" }
$project    = "desenvolvimento"

$tag = "GlobusWeb,develop"
$uri = "https://dev.azure.com/praxio/${project}/_apis/build/builds?tagFilters=$($tag)&statusFilter=completed&resultFilter=succeeded&queryOrder=finishTimeDescending$top=1&api-version=7.1"

$response = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers

#$response.value | Select-Object @{Name='idBuild'; Expression={$_.id}},
#                                #@{Name='buildNumber'; Expression={$_.buildNumber}},
#                                @{Name='idPipeline'; Expression={$_.definition.id}},
#                                @{Name='name'; Expression={$_.definition.name}},
#                                @{Name='finishTime'; Expression={$_.finishTime}}

#$latestPerPipeline = $response.value | 
#    Where-Object { $_.definition.name -match 'GlobusWeb.*End' } |
#    Group-Object { $_.definition.id } | 
#    ForEach-Object {
#        $_.Group | Sort-Object finishTime -Descending | Select-Object -First 1
#    }
#
#$latestPerPipeline | Select-Object `
#    @{n="BuildID"; e={$_.id}},
#    @{n="PipelineID"; e={$_.definition.id}},
#    @{n="PipelineName"; e={$_.definition.name}},
#    sourceBranch,
#    buildNumber,
#    finishTime | Sort-Object { [DateTime]$_.finishTime } -Descending | Format-Table -AutoSize
#
#$latestPerPipeline.Count

$response.value | ConvertTo-Json 