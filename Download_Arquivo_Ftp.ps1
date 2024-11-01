clear

$ftpServer   = 'waws-prod-cq1-039.ftp.azurewebsites.windows.net'
$username    = 'ale-reserva\$ale-reserva'
$password    = '79q4brd8y4DQ11nk23jlSHf41lYKH994RsatmMb1tb3X4xwGXSY1AmvvcRP4'

$remoteFile  = 'globusweb/iisx86.zip'
$localFile   = 'd:\Downloads\IISNODE\tmp3\iisx86.zip'

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$credentials = New-Object System.Net.NetworkCredential($username, $password )

$webClient   = New-Object System.Net.WebClient
$webClient.Credentials = $credentials



# Baixar o arquivo
$uri = "ftp://$ftpServer/$remoteFile"


#$uri
#$localFile
try {

    Write-Host "----------------------"
    $uri
    $localFile
    Write-Host "----------------------"
    #$webClient.DownloadFile($uri, $localFile)

$request = [System.Net.FtpWebRequest]::Create($uri)
$request.Credentials = $credentials
$request.Timeout = 500000  # 120 segundos
$response = $request.GetResponse()
$response

$outputFile = New-Item -ItemType File -Path $localFile -Force
$buffer = New-Object byte[] 2048
$bytesRead = 0

do {
    $bytesRead = $stream.Read($buffer, 0, $buffer.Length)
    if ($bytesRead -gt 0) {
        $outputFile.OpenWrite().Write($buffer, 0, $bytesRead)
    }
} while ($bytesRead -gt 0)

$stream.Close()
$outputFile.Close()
    

} catch {
    Write-Host "$_"
}

