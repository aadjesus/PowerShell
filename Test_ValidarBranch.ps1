cls

$Env:RELEASE_ENVIRONMENTNAME    = "Produção"
$Env:BUILD_SOURCEBRANCHNAME     = "Develop"
$Env:RELEASE_RELEASEDESCRIPTION = ""
$Env:SYSTEM_ACCESSTOKEN         = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")

$Env:SYSTEM_TEAMFOUNDATIONSERVERURI = "https://vsrm.dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECTID           = "f7e1f0f0-eca6-49ed-89c4-b580797f7a63"
$Env:RELEASE_RELEASEID              = 85499
$Env:RELEASE_ENVIRONMENTID          = 118288

$Env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECT                 = "f7e1f0f0-eca6-49ed-89c4-b580797f7a63"
$Env:AGENT_DEPLOYMENTGROUPID            = 540
$Env:AGENT_MACHINENAME                  = "AAUGUSTO"
$Env:AGENT_NAME                         = "AAUGUSTO"
$Env:RELEASE_RELEASEDESCRIPTION        = "c"

#$Env:AGENT_MACHINENAME                  = "PRXGLBWEB"
#$Env:AGENT_NAME                         = "PRXGLBWEB"

C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\ValidarBranch.ps1

