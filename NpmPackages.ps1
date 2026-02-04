param (
    [string]$packages
)

$packages
$lista        = $packages.Split(' ')
$packagesInst = npm list -g | findstr $packages

foreach ($item in $lista) {
    
    $instala = -not($packagesInst -match $item)
    $nome    = 'INSTALAR-' + $item.ToUpper()

    Write-Host "Package: $($item.ToUpper()), atualiza: $instala"    
    Write-Host "##vso[task.setvariable variable=$nome; isOutput=true]$instala"
}

#Package: VSTS-NPM-AUTH, atualiza: False
#Package: CPX, atualiza: False
#Package: PATCH-PACKAGE, atualiza: False
#Package: XAE, atualiza: True
