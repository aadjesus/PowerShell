cls

$Env:AGENT_OSARCHITECTURE = "x64"
$Env:AGENT_TEMPDIRECTORY  = "c:\temp\xxxx"

$Env:FTP_URL     = 'ftp://atualizacao.praxio.com.br/ftp/GlobusWeb'
$Env:FTP_USUARIO = 'prxftp'
$Env:FTP_SENHA   = 'Prx##2025'

$Env:IGNORAR_INSTALACAO_PREREQUISITOS = $null
$Env:IGNORAR_INSTALACAO_PREREQUISITO_NODEJS = $null

& "$($Env:GLOBUSWEB_DEV_PATH)\GlobusWeb.Setup\Scripts\ValidarPreRequisitos.ps1"