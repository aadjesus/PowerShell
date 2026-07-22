cls

$Env:FTP_URL             = 'ftp://atualizacao.praxio.com.br/ftp/GlobusWeb'  # <- aqui troca ftps:// por ftp://
$Env:AGENT_TEMPDIRECTORY = 'c:\temp'
$Env:FTP_USUARIO          = 'prxftp'
$Env:FTP_SENHA            = 'Prx##2025'

$ENV:BUILD_SOURCEBRANCHNAME = "develop"
$ENV:BUILD_DEFINITIONNAME   = "GlobusWeb.Aba.Back"
$buildNumberOrigin          = "20260721"

$arquivo = 'c:\temp\appsettings.json'
$destino = "$($Env:FTP_URL)/build/$($ENV:BUILD_SOURCEBRANCHNAME)/$($buildNumberOrigin)_$($ENV:BUILD_DEFINITIONNAME).zip"

 Write-Host "Enviando '$arquivo' para '$destino'"

#Remove-Item Alias:curl -ErrorAction SilentlyContinue

          curl.exe --user "$($Env:FTP_USUARIO):$($Env:FTP_SENHA)" `
               --silent `
               --show-error `
               --ssl-reqd `
               --insecure `
               --ftp-create-dirs `
               --upload-file $arquivo $destino `
               --write-out "Enviados %{size_upload} bytes em %{time_total}s"

$arquivoLocal = "c:\temp\#x1\zzz.zip"

         curl.exe --user "$($Env:FTP_USUARIO):$($Env:FTP_SENHA)" `
              --silent `
              --show-error `
              --ssl-reqd `
              --insecure `
              --output $arquivoLocal $destino `
              --write-out "Baixados %{size_download} bytes em %{time_total}s`n"