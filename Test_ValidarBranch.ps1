cls

$Env:RELEASE_ENVIRONMENTNAME    = "QA"
$Env:RELEASE_ENVIRONMENTNAME    = "Canario"
#$Env:RELEASE_ENVIRONMENTNAME    = "Dir"
$Env:BUILD_SOURCEBRANCHNAME     = "master"
$Env:BUILD_SOURCEBRANCHNAME     = "develo"
$Env:RELEASE_RELEASEDESCRIPTION = ""
$Env:SYSTEM_ACCESSTOKEN         = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")


$Env:SYSTEM_TEAMFOUNDATIONSERVERURI = "https://vsrm.dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECTID           = "f7e1f0f0-eca6-49ed-89c4-b580797f7a63"
$Env:RELEASE_RELEASEID              = 85499
$Env:RELEASE_ENVIRONMENTID          = 118288

$Env:RELEASE_RELEASEID       = 87179
$Env:RELEASE_ENVIRONMENTID   = 123414

$Env:SYSTEM_TASKDEFINITIONSURI = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECT                 = "f7e1f0f0-eca6-49ed-89c4-b580797f7a63"
$Env:AGENT_DEPLOYMENTGROUPID            = 540
$Env:AGENT_MACHINENAME                  = "AAUGUSTO"
$Env:RELEASE_RELEASEDESCRIPTION        = "aaaa"

$Env:IGNORAR_VALIDAR_BRANCH = $true1
$Env:INSTALAR_DEVELOP_EM_PRODUCAO = "false"
#$Env:AGENT_MACHINENAME                  = "PRXGLBWEB"
#$Env:AGENT_NAME                         = "PRXGLBWEB"

C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\ValidarBranch.ps1

