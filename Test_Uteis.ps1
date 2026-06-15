cls
$Env:PATH_BASE    = 'Praxio'
#$Env:PATH_DESTINO = 'c:\Praxio\GlobusWeb\'

& "$($Env:GLOBUSWEB_DEV_PATH)\GlobusWeb.Setup\Scripts\Uteis.ps1"

$dataBase = Get-DataBase

$dataBase.Arquivo
$dataBase.Json
$dataBase.Database