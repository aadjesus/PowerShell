cls
try {
    $pathBaseLog = "c:\#Log\"
    New-Item -Path $pathBaseLog -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
    $nomeScript = $MyInvocation.MyCommand -replace "\.", "_"
    $arquivoLog = "$($pathBaseLog)\$($nomeScript)_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
    Start-Transcript -Path $arquivoLog -Append
	
    $diretorio   = 'd:\GitHub\'
    $nomeArquivo = 'teste.txt'    
    
    $arquivos = Get-ChildItem `
        -Path $diretorio `
        -Filter $nomeArquivo `
        -Recurse -Depth 1 `
        -ErrorAction SilentlyContinue `
        -Force
    
    $qtde = Get-Random `
        -Minimum 2 `
        -Maximum ($arquivos.Count + 1)

    $sorteados = $arquivos | Get-Random -Count $qtde    
    foreach ($item in $sorteados) {   
        Write-Host "Diretorio: $($item.Directory)"

        try {                       
            Add-Content -Path $item.FullName -Value "$(Get-Date) -- $(New-Guid)"

            cd $item.Directory
	        git add .	
	        git commit -m "Atualizando arquivos"
	        git push
        } catch {
            Write-Error $_.Exception.Message
        }
    } 
} catch {
    Write-Error "Erro: $_"
} finally {
    Stop-Transcript
}