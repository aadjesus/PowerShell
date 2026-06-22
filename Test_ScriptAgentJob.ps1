cls

$Env:BUILD_SOURCEBRANCHNAME         = "complice"
$Env:SYSTEM_TASKDEFINITIONSURI      = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECT             = "f7e1f0f0-eca6-49ed-89c4-b580797f7a63"
$Env:BUILD_BUILDNUMBER              = "xxxxxx-$($Env:BUILD_SOURCEBRANCHNAME)"

$Env:SYSTEM_TEAMFOUNDATIONSERVERURI = "https://vsrm.dev.azure.com/praxio/"


$Env:SYSTEM_ACCESSTOKEN             = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$Env:SYSTEM_TEAMPROJECTID           = "Desenvolvimento"
$Env:RELEASE_ENVIRONMENTNAME        = "QA"
$Env:RELEASE_RELEASEID              = "88992"
$Env:RELEASE_ENVIRONMENTID          = "127947"
$Env:IGNORAR_VALIDAR_BRANCH   = $tru1e
$Env:ID_DEPLOYMENT_GROUP      = 540

$Env:SYSTEM_PIPELINESTARTTIME = '2026-06-21 11:48:40-03:00'

& "$($Env:GLOBUSWEB_DEV_PATH)\GlobusWeb.Setup\Scripts\ScriptAgentJob.ps1" -tags "GlobusWeb1,complice1"
