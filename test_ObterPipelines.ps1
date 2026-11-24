cls

$Env:GLOBUSWEB_PAT  = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$Env:SYSTEM_TASKDEFINITIONSURI          = "https://dev.azure.com/praxio/"


$Env:BUILD_SOURCEBRANCHNAME         = "master"
$Env:BUILD_SOURCEBRANCHNAME         = "develop"
$Env:SYSTEM_TASKDEFINITIONSURI      = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECT             = "f7e1f0f0-eca6-49ed-89c4-b580797f7a63"
$Env:BUILD_BUILDNUMBER              = "aaaaaa-20261013-$($Env:BUILD_SOURCEBRANCHNAME)"
$Env:AGENT_WORKFOLDER               = "c:\azagent\A1\_work\_praxio"

$Env:SYSTEM_TEAMFOUNDATIONSERVERURI = "https://vsrm.dev.azure.com/praxio/"

$Env:GLOBUSWEB_PAT                  = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$Env:SYSTEM_TEAMPROJECTID           = "Desenvolvimento"
$Env:RUNTIME_JSONPIPELINES = $null
$Env:RUNTIME_BRANCHORIGIN = "feature/EST_FRQ_652090"
$Env:RUNTIME_BRANCHORIGIN = "develop"
#$Env:RUNTIME_BRANCHORIGIN = "master"
$Env:RUNTIME_DATABUILD    = "2026-11-17T18:10:32.7261245Z"
$Env:RUNTIME_DATABUILD = (Get-Date).ToUniversalTime().ToString('o')
C:\Users\alessandro.augusto\Praxio\Praxio.Tools.Deploy\Modules\pre-release\ObterPipelines.ps1 -tags 'GlobusWeb'


#$h   = @{ Authorization = "Basic $([Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($Env:GLOBUSWEB_PAT)")))" }
#$url = "$($Env:SYSTEM_TASKDEFINITIONSURI)$($Env:SYSTEM_TEAMPROJECTID)/_apis/build/builds?tagFilters=GlobusWeb&statusFilter=completed&queryOrder=finishTimeDescending&`$top=30&api-version=7.1"
#(Invoke-RestMethod -Uri $url -Headers $h).value |
#    Where-Object { $_.sourceBranch -match 'EST_FRQ_652090' -or ($_.tags -contains 'EST_FRQ_652090') } |
#    Select-Object id, buildNumber, sourceBranch, result, finishTime, @{n='tags';e={$_.tags -join ','}} |
#    Format-Table -AutoSize