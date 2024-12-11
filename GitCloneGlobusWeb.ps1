clear
$Dir = 'c:\Praxio\GlobusWeb'
New-Item $Dir -type directory -force
cd $Dir

$lista = @(
    'GlobusWeb.Acidentes',
	'GlobusWeb.API.Delphi',
	'GlobusWeb.Arrecadacao',
	'GlobusWeb.Autenticacao',
	'GlobusWeb.Cargas',
	'GlobusWeb.Comuns.Libraries',
	'GlobusWeb.ContasPagar',
	'GlobusWeb.ContasReceber',
	'GlobusWeb.Controle',
	'GlobusWeb.Demo',
	'GlobusWeb.DVS',
	'GlobusWeb.Escala',
	'GlobusWeb.EscalaRodoviaria',
	'GlobusWeb.Escrituracao',
	'GlobusWeb.Estoque',
	'GlobusWeb.Folha',
	'GlobusWeb.Frequencia',
	'GlobusWeb.Frota',
	'GlobusWeb.Gateway',
	'GlobusWeb.Migration.GraphQl',
	'GlobusWeb.Plantao',
	'GlobusWeb.Pneus',
	'GlobusWeb.Portal',
	'GlobusWeb.Retaguarda',
	'GlobusWeb.Trafego',
	'GlobusWeb.TRR',
	'GlobusWeb.UIKit');


foreach ( $item in $lista )
{
    Write-Host $item
    if (Test-Path $item) {
		cd $item
		
		git checkout -b master
		git push --force

		git checkout -b develop
		git push --force
		
		cd ..

        continue;
    }

    Write-Host "Clonando projeto: $item "    
    $url = "https://praxio@dev.azure.com/praxio/Desenvolvimento/_git/$item";    
    git clone $url
    cd $item

    Write-Host "Inicializando GitFlow"
    git flow init -f --defaults 
    cd ..
}


