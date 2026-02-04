cls
$Env:PATH_BASE    = 'Praxio'
#$Env:PATH_DESTINO = 'c:\Praxio\GlobusWeb\'

. 'C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\Uteis.ps1'

$dataBase = Get-DataBase

$dataBase.Arquivo
$dataBase.Json
$dataBase.Database