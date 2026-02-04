cls

$Env:PATH_DESTINO = "c:\Praxio\GlobusWeb"

$lista = Get-ChildItem -Path $Env:PATH_DESTINO -Directory -Depth 2 -Recurse | 
    Where-Object { (Test-Path -Path "$($_.FullName)\azure-pipelines-front-end.yml") -or 
                   (Test-Path -Path "$($_.FullName)\azure-pipelines-back-end.yml")}

$branch = "feature/551767"
foreach ($item in $lista) {    
        
   Write-Host "Diretorio: $($item.FullName)"
   cd $item.FullName

    $status = git status --porcelain
    if (-not [string]::IsNullOrEmpty($status)) {
        git add .
        git commit -m "feat: Ajustando .gitignore para ignirarignorar a pasta '.vs' #551769

US #551767"
    }        
}
