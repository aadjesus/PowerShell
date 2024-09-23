clear
$diretorio   = 'c:\Users\Alessandro.Augusto\GitHub'
$nomeArquivo = 'teste.txt'
$data        = Get-Date

Get-ChildItem -Path $diretorio -Filter $nomeArquivo -Recurse -ErrorAction SilentlyContinue -Force | ForEach-object {    
    Add-Content -Path $_.FullName -Value $data       
    cd $_.Directory
	git add .	
	git commit -m "Atualizando arquivos"
	git push
}