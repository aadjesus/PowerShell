cls

$Env:PATH_DESTINO = 'c:\Praxio\GlobusWeb'

cd $Env:PATH_DESTINO

$lista = Get-ChildItem -Path $Env:PATH_DESTINO -Directory  | 
    Where-Object {Test-Path -Path "$($_.FullName)\.git"}

foreach ($item in $lista) {    
    if ($item.FullName -match 'node_modules') {
        continue
    }
    Write-Host "Diretorio: $($item.FullName)" -ForegroundColor Cyan    
    
    #git checkout develop

    # Somente JavaScript,TypeScript
    #cloc . --exclude-dir=node_modules,bin,obj,.git,dist,.vscode --include-lang=JavaScript,TypeScript --md > "$($item.FullName)/$($item.Name).md"
    # Excluir os json,yml,md 
    #cloc . --exclude-dir=node_modules,bin,obj,.git,dist,.vscode --exclude-ext=json,yml,md,sh         --md > "$($item.FullName)/$($item.Name).md"
    
    cd $item.FullName
    cloc . --exclude-dir=node_modules,bin,obj,.git,dist,.vscode --md > "c:\tmp\GlobusWeb\$($item.Name).md"
}

cd $Env:PATH_DESTINO
cloc . --exclude-dir=node_modules,bin,obj,.git,dist,.vscode --md > "c:\tmp\GlobusWeb\GlobusWeb.md"