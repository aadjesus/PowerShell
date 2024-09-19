function Executar-Release ($path, $forcarVersaoEstavel=$false) {
    cd $path
   
    $branches = git branch --list
    if (-not($branches -match "master|develop")) {
        Write-Host "##### Inicializando GITFLOW com as branches padroes"
        git flow init --defaults
    }
    
	Write-Host "##### Atualizando as TAGs locais como oq esta no servidor"
	git fetch
	
	Write-Host "##### Deleta as TAGs local"
	git tag -d $(git tag)
	
	Write-Host "##### Deleta as TAGs do servidor"
    git push origin --delete $(git tag)    

    Write-Host "##### Indo para MASTER e cancelando as alterações pendentes"
    git checkout master
    git reset --hard
    git pull

    Write-Host "##### Indo para DEVELOP e cancelando as alterações pendentes"
    git checkout develop
    git reset --hard
    git pull
    
    $releaseAtual -match "release"
    if ($releaseAtual)
    {
        Write-Host "##### Excluir RELEASE"
        git branch -d $releaseAtual.Trim()
    } 

    Write-Host "##### Inicializando RELEASE"
    git flow release start "adequacaoNugets_$(Get-Date -Format "yyyyMMdd_HHmm")"
    
    
    if (($forcarVersaoEstavel)) 
    {
        Write-Host "##### Criando TAG"
        git tag -a v3.0 -m "setando branch para versao estavel"
    }
    
    Write-Host "##### Finalizando RELEASE"
    git flow finish
    
    if (($forcarVersaoEstavel)) 
    {
        Write-Host "##### Enviando TAG para o servidor"       
        git push origin --tags
    }

    Write-Host "##### Indo para MASTER e enviando alterações"
    git checkout master 
    git push
    Write-Host "##### Indo para DEVELOP e enviando alterações"
    git checkout develop
    git push
} 