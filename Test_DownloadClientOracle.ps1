cls

$Env:FTP_URL     = 'ftp://atualizacao.praxio.com.br/ftp/GlobusWeb'
$Env:FTP_USUARIO = 'prxftp'
$Env:FTP_SENHA   = 'Prx##2025'


$Env:AGENT_WORKFOLDER    = "c:\azagent\A1\_work"
$Env:PATH_DESTINO        = "c:\Servers\GlobusWeb"
$Env:AGENT_TEMPDIRECTORY = $ENV:TEMP

$Env:IGNORAR__ClientOracle            = $True1
$Env:FORCAR_ATUALIZACAO__ClientOracle = $True1

& "$($Env:GLOBUSWEB_DEV_PATH)\GlobusWeb.Setup\Scripts\DownloadClientOracle.ps1"