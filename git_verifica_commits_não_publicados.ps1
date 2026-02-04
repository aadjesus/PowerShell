cls

$Env:PATH_DESTINO = "c:\Praxio\GlobusWeb"

$lista = Get-ChildItem -Path $Env:PATH_DESTINO -Directory -Depth 2 -Recurse | 
    Where-Object { (Test-Path -Path "$($_.FullName)\azure-pipelines-front-end.yml") -or 
                   (Test-Path -Path "$($_.FullName)\azure-pipelines-back-end.yml")}

$branch = "feature/551767"
foreach ($item in $lista) {    
        
   Write-Host "Diretorio: $($item.FullName)"
   cd $item.FullName

   $qtde = git rev-list --count $branch "^origin/develop"
   if ($qtde -gt 0) {
       Write-Host  "$qtde"
       #git push --set-upstream origin $branch
   }
}
