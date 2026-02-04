cls
$org        = "https://dev.azure.com/praxio"
$project    = "desenvolvimento"
$project    = "Inovação"
$token      = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$pipelineId = 823
$branch     = "refs/heads/develop"


$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ Authorization = "Basic $base64AuthInfo" }

#$url       = "$org/$project/_apis/build/builds?definitions=$pipelineId&branchName=$branch&`$top=1&queryOrder=finishTimeDescending&api-version=7.1"
#$lastBuild = Invoke-RestMethod -Uri $url -Headers $headers -Method GET
#$build     = $lastBuild.value | Select-Object -First 1
#Write-Host "Último build encontrado: ID $($build.id) - Status: $($build.result)"


$url   = "$org/$project/_apis/build/latest/$($pipelineId)?branchName=$branch&api-version=7.1"                             
$build = Invoke-RestMethod -Uri $url -Headers $headers -Method GET

Write-Host "Último build encontrado: ID $($build.id) - Status: $($build.result)"
$build