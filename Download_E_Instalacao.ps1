clear

$diretorioDownloads = "d:\Downloads\IISNODE\tmp2\";

New-Item $diretorioDownloads -type directory -force

$xBits = "x86";
if ([Environment]::Is64BitOperatingSystem) {
    $xBits = "x64";
}

function Downloads-Arquivo {
    param(
        [parameter(Position=0)]
        [string]$pArquivo
    )

    Write-Host "Download do arquivo: $pArquivo"

    $output = "$diretorioDownloads\$pArquivo.zip";

    #https://drive.google.com/file/d/1Pa0hGERCkd7aHOxW9XOrD-mmxsCQumls/view?usp=drive_link
    
    $url = "https://drive.google.com/uc?export=download&id=1AoyIJte1IR8lPLuQkbANoECN5SB2ATPz";
                                                           #1Pa0hGERCkd7aHOxW9XOrD-mmxsCQumls

    $response = Invoke-WebRequest -Uri $url -OutFile $output;

    return $output;
}

function Instalar-Arquivo {
    param(
        [parameter(Position=0)]
        [string]$pArquivo
    )

    if (-not (Test-Path $pArquivo)) {
        Write-Host "Arquivo: $pArquivo encontrado."
        return;
    }

    Write-Host "Instalando arquivo!" 
    #Start-Process -FilePath "C:\caminho\para\o\instalador\iisnode-full-v0.2.21-x64.msi" -ArgumentList "/quiet" -Wait    
}

$arquivo =  Downloads-Arquivo("aaa$xBits");
#Instalar-Arquivo($arquivo);

#clear 
#$achoRewriteModule = (Get-WebGlobalModule | Where-Object { $_.name -eq 'RewriteModule'  })
#$achoIIsNode       = (Get-WebGlobalModule | Where-Object { $_.name -eq 'iisnode'  })
#$achoRewriteModule
#$achoIIsNode
