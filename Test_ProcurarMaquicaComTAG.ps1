cls

$Env:RELEASE_ENVIRONMENTNAME    = "QA"
#$Env:RELEASE_ENVIRONMENTNAME    = "Canario"
#$Env:RELEASE_ENVIRONMENTNAME    = "Dir"
$Env:BUILD_SOURCEBRANCHNAME     = "master"
$Env:BUILD_SOURCEBRANCHNAME     = "develo"
$Env:RELEASE_RELEASEDESCRIPTION = ""
$Env:SYSTEM_ACCESSTOKEN         = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")


$Env:SYSTEM_TEAMFOUNDATIONSERVERURI = "https://vsrm.dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECTID           = "f7e1f0f0-eca6-49ed-89c4-b580797f7a63"
$Env:RELEASE_RELEASEID              = 87943
$Env:RELEASE_ENVIRONMENTID          = 125435

$Env:RELEASE_RELEASEID       = 87943
$Env:RELEASE_ENVIRONMENTID   = 125435

$Env:SYSTEM_TASKDEFINITIONSURI = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECT                 = "f7e1f0f0-eca6-49ed-89c4-b580797f7a63"
$Env:AGENT_DEPLOYMENTGROUPID            = 540
$Env:AGENT_MACHINENAME                  = "AAUGUSTO"
#$Env:AGENT_MACHINENAME                  = "BRENOROCHA"

$Env:IGNORAR_VALIDAR_BRANCH = $true1

$Env:GLOBUSWEB_TAGS = "alessandro.augusto,zuba1"

C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\ProcurarMaquicaComTAG.ps1