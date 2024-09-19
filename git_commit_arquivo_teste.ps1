clear
$diretorio   = 'c:\Users\Alessandro.Augusto\GitHub'
$nomeArquivo = 'teste.txt'
$data        = Get-Date

Get-ChildItem -Path $diretorio -Filter $nomeArquivo -Recurse -ErrorAction SilentlyContinue -Force | ForEach-object {    
	cd $_.Directory
    write-host "Alterando arquivo"
    Add-Content -Path $_.FullName -Value $data   
    
	write-host "Incluindo arquivo"
	git add .	

	git commit -m "Atualizando arquivos"
	
    write-host "Publicando"
	git push
}	
