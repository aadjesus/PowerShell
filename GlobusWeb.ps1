clear
$Dir = 'c:\praxio1'
New-Item $Dir -type directory -force
cd $Dir

$lista = @(
    #"GlobusWeb.Acidentes",
    #"GlobusWeb.API.Delphi",
    #"GlobusWeb.Autenticacao",
    #"GlobusWeb.Comuns.Libraries",
    #"GlobusWeb.Controle",
    #"GlobusWeb.Folha",
    #"GlobusWeb.Frequencia",
    #"GlobusWeb.Frota",
    #"GlobusWeb.Gateway",
    #"GlobusWeb.Migration.GraphQl",
    "GlobusWeb.UIKit");


foreach ( $item in $lista )
{
    Write-Host "Clonando projeto: $item "    
    $url = "https://praxio@dev.azure.com/praxio/Desenvolvimento/_git/$item";    
    git clone $url
    cd $item

    Write-Host "Inicializando GitFlow"
    git flow init -f --defaults 
    cd ..
}


