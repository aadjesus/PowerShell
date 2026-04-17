cls
$Env:RELEASE_ARTIFACTS_NOME_BUILDID = 196385
$Env:AGENT_TEMPDIRECTORY            = 'c:\temp\'

$Env:SYSTEM_ACCESSTOKEN             = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$Env:SYSTEM_TASKDEFINITIONSURI      = "https://dev.azure.com/praxio/"

$Env:SYSTEM_TEAMPROJECTID           = "f7e1f0f0-eca6-49ed-89c4-b580797f7a63"
$Env:SYSTEM_TEAMPROJECT             = "Desenvolvimento"


$Env:RELEASE_ARTIFACTS_GLOBUSWEB_FRETAMENTO_BACK_END_BUILDID = "206501"


C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\DownloadBuild.ps1 -nomeArtefato "GLOBUSWEB_FRETAMENTO_BACK_END"