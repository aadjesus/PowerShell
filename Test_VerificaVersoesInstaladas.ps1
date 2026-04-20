cls

$Env:PATH_BASE            = "Servers"
$Env:PORTA_PARENT_WEBSITE = "80"
$Env:AGENT_WORKFOLDER     = "c:\azagent\A1\_work\"
$Env:FORCAR_ATUALIZACAO   = 11

$Env:BUILD_SOURCEBRANCHNAME    = "develop"
$Env:BUILD_PROJECTNAME         = "Desenvolvimento"
$Env:SYSTEM_TASKDEFINITIONSURI = "https://dev.azure.com/praxio/"
$Env:SYSTEM_ACCESSTOKEN        = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")

C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\VerificaVersoesInstaladas.ps1
