cls
$Env:PATH_DESTINO     = "c:\Praxio\AmbienteDev\GlobusWeb"
$Env:SITE             = "acidentes"
$Env:AGENT_TEMPDIRECTORY = "c:\azagent\A1\_work\_temp"
$Env:AGENT_WORKFOLDER    = "c:\azagent\A1\_work"

& "$($Env:GLOBUSWEB_DEV_PATH)\GlobusWeb.Setup\Scripts\APIComparaPackageJson.ps1"