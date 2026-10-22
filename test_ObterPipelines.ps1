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

C:\Users\alessandro.augusto\Praxio\Praxio.Tools.Deploy\Modules\pre-release\ObterPipelines.ps1 -tags 'GlobusWeb,develop'