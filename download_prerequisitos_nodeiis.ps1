cls

function Write-ErroExit {
    param (
        [string]$erro,
        [string]$complemento = $null
    )

    Write-Host "##[error]$erro"
    if (![string]::IsNullOrEmpty($complemento)) {
        Write-Host "##[error]Detalhes do erro: $complemento"
    }

    Write-Host "##vso[task.complete result=Failed;]"
    return
}


function Get-Download {
    param (        
        [string]$url,
        [string]$outFile
    )

    Write-Host $url
    Write-Host $outFile

	if (Test-Path $outFile) {
        return $true
	}

	$diretorio = Split-Path -Path $outFile -Parent
	if (-not (Test-Path -Path $diretorio)) {
		New-Item -ItemType Directory -Path $diretorio -Force
	}

	Write-Host "##[warning]Fazendo o download"	
	Invoke-WebRequest -Uri $url -OutFile $outFile

    if (-not (Test-Path $outFile)) {        
        Write-ErroExit("Não foi possivel fazer Download")
        return $false
    }

    return $true    
}

#https://github.com/azure/iisnode/wiki/iisnode-releases
#https://prod-iis-landing.azurewebsites.net/downloads/microsoft/url-rewrite

#$url     = "https://github.com/coreybutler/nvm-windows/releases/download/1.1.12/nvm-setup.exe"
#$destino = "d:\Downloads\xxxx1\nvm-setup1.exe"
#Get-Download -url $url -outFile $destino


#$url     = "https://download.microsoft.com/download/D/8/1/D81E5DD6-1ABB-46B0-9B4B-21894E18B77F/rewrite_x86_en-US.msi"            
#$destino = "d:\Downloads\xxxx1\ReWriteModule.msi"
#Write-Host $url
#Write-Host $destino
#Get-Download -Uri $url -OutFile $destino

$url     = "https://github.com/Azure/iisnode/releases/download/v0.2.21/iisnode-full-v0.2.21-x64.msi"
$destino = "d:\Downloads\xxxx1\iisnode.msi"
#Write-Host $url
#Write-Host $destino
Get-Download -url $url -outFile $destino


