cls

$Env:PATH_BASE = "c:\Servers"
& "C:\Users\alessandro.augusto\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\LerGlobusWebConfigJson.ps1"

& "$($Env:GLOBUSWEB_DEV_PATH)\GlobusWeb.Setup\Scripts\HealthCheck.ps1"
