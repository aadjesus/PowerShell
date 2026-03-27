cls

$Env:RELEASE_ENVIRONMENTNAME    = "QA"
$Env:BUILD_SOURCEBRANCHNAME     = "Develop"
$Env:RELEASE_RELEASEDESCRIPTION = ""
$Env:SYSTEM_ACCESSTOKEN         = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")


$Env:SYSTEM_TEAMFOUNDATIONSERVERURI = "https://vsrm.dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECTID           = "f7e1f0f0-eca6-49ed-89c4-b580797f7a63"
$Env:RELEASE_RELEASEID              = 85259
$Env:RELEASE_ENVIRONMENTID          = 117781

C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\ValidarBranch.ps1

