cls

$Env:FTP_URL     = 'ftp://atualizacao.praxio.com.br/ftp/GlobusWeb'
$Env:FTP_USUARIO = 'prxftp'
$Env:FTP_SENHA   = '081011611232039304040565055605870628'


$Env:AGENT_WORKFOLDER    = "c:\azagent\A1\_work"
$Env:PATH_DESTINO        = "c:\temp\xxxx"
$Env:AGENT_TEMPDIRECTORY = $ENV:TEMP
$Env:AGENT_TEMPDIRECTORY = "c:\temp\xxxx\"

$Env:IGNORAR_NODE_MODULES            = $True1
$Env:FORCAR_ATUALIZACAO_NODE_MODULES = $True

$Env:IGNORAR__CLIENTORACLE            = $True1
$Env:FORCAR_ATUALIZACAO__CLIENTORACLE = $True


$arquivos = @(
    @{"nomeZip"="node_modules";"arquivoDestino"="oracledb.js";}, 
    @{"nomeZip"="_clientOracle";"arquivoDestino"="oci.dll";})


foreach ($item in $arquivos) {

    C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\DownloadFtp.ps1 -nomeZip $item.nomeZip -arquivoDestino1 $item.arquivoDestino
    
    $zip = "$($Env:AGENT_TEMPDIRECTORY)\$($item.nomeZip).zip"
    if (Test-Path $zip) {
        Write-Host "##[warning]Excluindo arquivo: $($zip)`n";
        Remove-Item $zip -Force -ErrorAction SilentlyContinue;
    }

}
