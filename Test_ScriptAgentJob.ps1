cls

$Env:BUILD_SOURCEBRANCHNAME         = "588597"
$Env:SYSTEM_TASKDEFINITIONSURI      = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECTID           = "f7e1f0f0-eca6-49ed-89c4-b580797f7a63"
$Env:SYSTEM_TEAMFOUNDATIONSERVERURI = "https://vsrm.dev.azure.com/praxio/"


$Env:SYSTEM_ACCESSTOKEN             = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")

$Env:RELEASE_ENVIRONMENTNAME        = "DIR"
$Env:RELEASE_RELEASEID              = "88549"
$Env:RELEASE_ENVIRONMENTID          = "126606"
$Env:IGNORAR_VALIDAR_BRANCH = $true1
$Env:AGENT_DEPLOYMENTGROUPID      = 540

C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\ScriptAgentJob.ps1