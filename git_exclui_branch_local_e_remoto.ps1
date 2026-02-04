cls
$Env:PATH_DESTINO = "c:\Praxio\GlobusWeb"

$lista = Get-ChildItem -Path $Env:PATH_DESTINO -Directory -Depth 2 -Recurse | 
    Where-Object { (Test-Path -Path "$($_.FullName)\azure-pipelines-front-end.yml") -or 
                   (Test-Path -Path "$($_.FullName)\azure-pipelines-back-end.yml")}

$branch = "feature/551767"
foreach ($item in $lista) {    
   Write-Host "Diretorio: $($item.FullName)"
   cd $item.FullName
   
   #$local = git show-ref --verify --quiet "refs/heads/$branch"
   #if (-not [string]::IsNullOrEmpty($local)) {
   #    Write-Host "Excluindo branch local"        
   #    git branch -D $branch
   #}
   
   $remoto = git ls-remote --exit-code --heads origin $branch 2>$null        
   if (-not [string]::IsNullOrEmpty($remoto)) {
       Write-Host "Excluindo branch remota" 
       git push origin --delete $branch
   }  
}