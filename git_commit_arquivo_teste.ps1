clear

$diretorio   = 'd:\GitHub\'
$nomeArquivo = 'teste.txt'
$data        = Get-Date

Get-ChildItem -Path $diretorio -Filter $nomeArquivo -Recurse -ErrorAction SilentlyContinue -Force | ForEach-object {    
    Write-Host "$($_.Directory): " -ForegroundColor Green

    try {       
        Add-Content -Path $_.FullName -Value "$($data) -- $(New-Guid)"  
            
        cd $_.Directory
	    git add .	
	    git commit -m "Atualizando arquivos"
	    git push
    } catch {
        Write-Error $_.Exception.Message
    } finally {
        $guid = [guid]::NewGuid().Guid
        $arquivoLog = "C:\DestinationFolder\$($_.Directory.BaseName)_$($guid).txt"

        New-Item -Path $arquivoLog -ItemType "File"
        Add-Content -Path $arquivoLog -Value "$($data) -- $(New-Guid)"  
    }
}