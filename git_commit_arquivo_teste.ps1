cls
try {
    $diretorio   = 'd:\GitHub\'
    $nomeArquivo = 'teste.txt'
    $data        = Get-Date

    $arquivos = Get-ChildItem `
        -Path $diretorio `
        -Filter $nomeArquivo `
        -Recurse -Depth 1 `
        -ErrorAction SilentlyContinue `
        -Force

    $qtde = Get-Random `
        -Minimum 2 `
        -Maximum ($arquivos.Count + 1)

    $pathBaseLog = "c:\#Log\"
    New-Item -Path $pathBaseLog -ItemType Directory -ErrorAction SilentlyContinue | Out-Null

    $arquivoLog = "$($pathBaseLog)\Commit_Automatico_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"

    Start-Transcript -Path $arquivoLog -Append

    $sorteados = $arquivos | Get-Random -Count $qtde    
    foreach ($item in $sorteados) {   
        Write-Host "Diretorio: $($item.Directory)"

        try {       
            Add-Content -Path $_.FullName -Value "$($data) -- $(New-Guid)"  
                
            cd $_.Directory
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