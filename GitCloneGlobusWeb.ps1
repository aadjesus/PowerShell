cls

$Dir = 'c:\Praxio\GlobusWeb'
$arquivoLog = "$Dir\clone_log_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"

if (-not (Test-Path $Dir)) {
    try {
        New-Item $Dir -Type Directory -Force | Out-Null
    } catch {
        Write-Host "Erro ao criar diretório $Dir : $_" -ForegroundColor Red
        exit 1
    }
}

cd $Dir
Start-Transcript -Path $arquivoLog -Append

$lista = @(
    'GlobusWeb.Abastecimento',
	'GlobusWeb.Acidentes',
	'GlobusWeb.API.Delphi',
	'GlobusWeb.Arrecadacao',
	'GlobusWeb.Autenticacao',
	'GlobusWeb.AuthClient',
	'GlobusWeb.Cargas',
	'GlobusWeb.ClientesAPI',
	'GlobusWeb.Compras',
	'GlobusWeb.Comuns.Libraries',
	'GlobusWeb.Contabilidade',
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
	'GlobusWeb.Fretamento',
	'GlobusWeb.Frota',
	'GlobusWeb.Gateway',
	'GlobusWeb.Manutencao',
	'GlobusWeb.Migration.GraphQl',
	'GlobusWeb.Motor',
	'GlobusWeb.Plantao',
	'GlobusWeb.Pneus',
	'GlobusWeb.Portal',
	'GlobusWeb.RecursosHumanos',
	'GlobusWeb.Retaguarda',
	'GlobusWeb.Servicos',
	'GlobusWeb.Trafego',
	'GlobusWeb.TRR',
	'GlobusWeb.Turismo',
	'GlobusWeb.UIKit');

foreach ($item in $lista) {	    
    Write-Host ('-' * $Host.UI.RawUI.WindowSize.Width)
    Write-Host "Processando $item..." -ForegroundColor Cyan
    
    try {
        if (Test-Path $item) {
            Write-Host "Repositório existente, atualizando branches..."
            cd $item
            
            $remoteUrl = git config --get remote.origin.url
            if ($remoteUrl -notlike "*$item*") {
                Write-Host "Diretório existe mas não é o repositório correto" -ForegroundColor Yellow
                cd ..
                continue
            }
            
            git fetch --all
            git checkout master 2>&1 | Out-Null
            git pull origin master
            
            git checkout develop 2>&1 | Out-Null
            git pull origin develop
            
            cd ..
            continue
        }

        git clone "https://praxio@dev.azure.com/praxio/Desenvolvimento/_git/$item"
        if (-not $?) {
            throw "Falha ao clonar repositório"
        }

        Write-Host "`nInicializando GitFlow"
        cd $item      
        git flow init -f --defaults
        
        cd ..
        
    } catch {
        Write-Host "Erro ao processar $item : $_" -ForegroundColor Red
        continue
    }
}

Write-Host ('-' * $Host.UI.RawUI.WindowSize.Width)
Write-Host "`nProcesso concluído. Verifique o log em $arquivoLog para detalhes." -ForegroundColor Green
Stop-Transcript