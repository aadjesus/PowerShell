cls
$repositorioComErro   = @()
$workspaces           = @()
$workspacesAlteradas  = @()
$servicos             = @()
$executarNpmInstall   = $false
$alteracaoRepositorio = $false
$porta                = 3000
$contador             = 0
$Env:PATH_DESTINO = 'c:\Praxio\GlobusWeb\'

	function Get-CaminhoRelativo {
		param (        
			[string]$diretorio
		)

		$retorno = ($diretorio -ireplace [regex]::Escape($Env:PATH_DESTINO), "").Replace("\","/")
		return $retorno
	}

	function Get-Json {
		param (        
			[string]$arquivo
		)
		try {
			$retorno = Get-Content -Path $arquivo -Force | ConvertFrom-Json

			return $retorno
		} catch {
			Write-Host "`nNão foi possível ler o arquivo: $arquivo.`n$_" -ForegroundColor Red
		}
	}


	function Get-Cancelar {
		$resposta = Read-Host -Prompt "Pressione ENTER para continuar"
		if (-not [string]::IsNullOrEmpty($resposta)) {
			Write-Host "`nOperação cancelada." -ForegroundColor Red
			return $true
		}
		return $false 
	}

    function Git-Pull {
	    param (        
		    [string]$repositorio
	    )
		cd $repositorio
        if ($repositorio -eq "GlobusWeb.Abastecimento") {            
			return
        }
        
		
        
        Write-Host "Git-Pull: $($repositorio)"
		#$script:executarNpmInstall = $true
		return $true
    }

	function Git-Clone {
		param (        
			[string]$repositorio,
			[string]$url
		)
		$script:repositorioComErro += "Falha ao clonar repositório: $($repositorio)"
		
        New-Item -Path $repositorio -ItemType Directory | Out-Null -ErrorAction SilentlyContinue
        cd $repositorio

        Write-Host "Git-Clone: $($repositorio)"
        $script:executarNpmInstall = $true
		return $true
    }

$repositorios = @(
    @{"name"= "GlobusWeb.Abastecimento"; "url"=""},
    @{"name"= "GlobusWeb.Acidentes"; "url"=""},
    @{"name"= "GlobusWeb.Arrecadacao"; "url"=""},
    @{"name"= "GlobusWeb.Autenticacao"; "url"=""},
    @{"name"= "GlobusWeb.Cargas"; "url"=""},
    @{"name"= "GlobusWeb.Componente"; "url"=""},
    @{"name"= "GlobusWeb.Compras"; "url"=""},
    @{"name"= "GlobusWeb.Contabilidade";"url"=""},
    @{"name"= "GlobusWeb.Contabilidade2";"url"=""}
    )

$totalRepositorio = $repositorios.count


foreach ($item in $repositorios) {
    
	$contador++			
	Write-Host "Repositório $($item.name): ($contador de $totalRepositorio)" -ForegroundColor Yellow
	
	cd $Env:PATH_DESTINO    	
	
			if (Test-Path $item.name) {
				$alterouRepositorio = Git-Pull -Repositorio $item.name
			} else {
				$alterouRepositorio = Git-Clone -Repositorio $item.name -URL $item.remoteUrl
			}

	Get-ChildItem -Filter "package.json" -Depth 1 -Recurse -ErrorAction SilentlyContinue | 
		ForEach-Object {
			$pathPackage = Get-Json -Arquivo $_.FullName
			$sigla		 = $pathPackage.sigla 
			$workspace   = $pathPackage.workspace 

			#Write-Host "FullName: $($_.FullName) -- Sigla: $($sigla) -- Workspace: $($workspace)"

					$caminhoRelativo = Get-CaminhoRelativo -Diretorio $_.DirectoryName
					if ($workspace) {
						$workspaces += $caminhoRelativo
						if ($alterouRepositorio) {
							$workspacesAlteradas += $caminhoRelativo
						}
					}
					
			if ([string]::IsNullOrEmpty($sigla)) {
				return
			}

			if ($sigla -eq "AUTH") {
				$portaTmp = 9000
			} else {
				$porta++
				$portaTmp = $porta
			}

			$servicos += @{
				"name"="$($pathPackage.name)";
				"key"="$($sigla)";
				"prefix"="$($pathPackage.name)/Api";
				"url"="http://localhost";
				"porta"=$portaTmp;
				"caminhoRelativo"="$($caminhoRelativo)";
			}
		}


}

		if ($repositorioComErro.count -gt 0) {
			Write-Host "`nForam encontrados problemas nos seguintes repositórios:" -ForegroundColor Red
			foreach ($item in $repositorioComErro) {
				Write-Host $item -ForegroundColor Red
			}
		}


Write-Host "x1- $($executarNpmInstall)"
Write-Host "x2- $($alteracaoRepositorio)"

#$x1 = $workspaces -join ", "
#$x2 = $workspacesAlteracao -join ", "
#Write-Host "x1: $($x1)"
#Write-Host "x2: $($x2)"
#$servicos


		Write-Host "`nProcesso concluído" -ForegroundColor Green
		$qtdeWorkspacesAlterada = $workspacesAlteradas.Count
		if ($executarNpmInstall -or $qtdeWorkspacesAlterada -gt 0) {
			Write-Host "`nRecomendado executar o comando abaixo:" -ForegroundColor Yellow
			if ($qtdeWorkspacesAlterada -gt 0 -and $qtdeWorkspacesAlterada -lt $workspaces.Count) {
				$comando = ($workspacesAlteradas | ForEach-Object { "--workspace $_" })  -join " "

				$comandoNpmInstall = ""
				if ($executarNpmInstall) {
					$comandoNpmInstall += "npm install $($comando) --if-present && "
				}

				Write-Host "$($comandoNpmInstall)npm run build $($comando) --force`n"
			} else {
				Write-Host "  npm run init" -ForegroundColor Yellow
			}
		}

		cd $Env:PATH_DESTINO -ErrorAction SilentlyContinue

