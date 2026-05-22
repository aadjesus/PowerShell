clear

$Env:FTP_URL             = 'ftp://atualizacao.praxio.com.br/ftp/GlobusWeb'  # <- aqui troca ftps:// por ftp://
$Env:AGENT_TEMPDIRECTORY = 'c:\temp'
$Env:FTP_USUARIO          = 'prxftp'
$Env:FTP_SENHA            = 'Prx##2025'


$arquivo = 'ClientOracle.zip'


		$ftpUrl     = "$($Env:FTP_URL)/$($arquivo)"
		$destinoFtp = "$($Env:AGENT_TEMPDIRECTORY)\$arquivo"
		
		$ftpRequest = [System.Net.FtpWebRequest]::Create($ftpUrl)
		$ftpRequest.Credentials = New-Object System.Net.NetworkCredential($Env:FTP_USUARIO, $Env:FTP_SENHA)
		$ftpRequest.Method = [System.Net.WebRequestMethods+Ftp]::DownloadFile
		$ftpRequest.EnableSsl = $true
		$ftpRequest.UsePassive = $true 
		$ftpRequest.KeepAlive = $false

		$response = $ftpRequest.GetResponse()
		$stream   = $response.GetResponseStream()
		$file     = [System.IO.File]::Create($destinoFtp)
		$buffer   = New-Object byte[] 10240
		do {
			$read = $stream.Read($buffer, 0, $buffer.Length)
			$file.Write($buffer, 0, $read)
		} while ($read -gt 0)

		$file.Close()
		$stream.Close()
		$response.Close()

		if (-not (Test-Path $destinoFtp)) {        
			Write-ErroExit -Mensagem "Não foi possível fazer Download"
		}
