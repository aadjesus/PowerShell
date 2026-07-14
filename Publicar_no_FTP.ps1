cls

        $ErrorActionPreference = 'Stop'

        $arquivo = "$(Agent.TempDirectory)/$(Build.BuildId)/ZIPs/$(BUILD.DEFINITIONNAME).zip"
        $destino = "$($Env:FTP_URL)/$($ENV:BUILD_SOURCEBRANCHNAME)/$($ENV:BUILD_DEFINITIONNAME).zip"

        Write-Host "Enviando '$arquivo' para '$destino'"

        $configCurl = Join-Path $Env:AGENT_TEMPDIRECTORY "curl-ftp-$($Env:BUILD_BUILDID).cfg"
        [System.IO.File]::WriteAllText($configCurl, "user = `"$($Env:FTP_USUARIO):$($Env:FTP_SENHA)`"")
        try {
          curl.exe -K $configCurl `
            --silent --show-error --ssl-reqd --insecure --ftp-create-dirs `
            --upload-file $arquivo $destino `
            --write-out "Enviados %{size_upload} bytes em %{time_total}s"
        }
        finally {
          Remove-Item $configCurl -Force -ErrorAction SilentlyContinue
        }

        if ($LASTEXITCODE -ne 0) {
          throw "Falha no upload"
        }
        Write-Host "`nUpload concluído com sucesso"
