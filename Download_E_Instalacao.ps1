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
    
    # https://drive.google.com/file/d/1bYZEgqSvsT-Uh-1gIFqlK5YUrp4CmDp6/view?usp=sharing
    
    # https://drive.usercontent.google.com/u/0/uc?id=1bYZEgqSvsT-Uh-1gIFqlK5YUrp4CmDp6&export=download
    $id = "1bYZEgqSvsT-Uh-1gIFqlK5YUrp4CmDp6";
    $url = "https://drive.usercontent.google.com/u/0/uc?id=1bYZEgqSvsT-Uh-1gIFqlK5YUrp4CmDp6&export=download";
    
    #$id  = "1yXcHn1YLSJA_VmF9kjBP50NjzrwiL4hh"
    #$url = "https://drive.google.com/drive/u/0/folders/$id"
    #$downloadUrl = "https://drive.google.com/uc?export=download&id=YOUR_FILE_ID"
    #$destination = "C:\Seu\Caminho\Destino\arquivo.pdf"

    $output = "$diretorioDownloads\$pArquivo.zip";

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
Instalar-Arquivo($arquivo);
