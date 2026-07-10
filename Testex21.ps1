cls

function Get-Condicao($nome) {
	$valor = Get-Valor -nome $nome
	
	$retorno = 
		$valor -ne $null -and 
		$valor.ToUpper() -in @("TRUE", "SIM", "1")
	
	return $retorno
}

function Get-Valor {
	param (
		[string]$nome,
		[string]$mensagem = $null
	)

	$nome    = ($nome -replace "\.", "_").ToUpper()

	$nomeVar = "$($Env:AGENT_NAME)_$($nome)"
	if (-not (Test-Path "env:\$nomeVar")) {
		$nomeVar = "$nome"
	}
	
	$retorno = $null
	if ((Test-Path "env:\$nomeVar")) {
		$retorno = (Get-item env:$nomeVar).Value
	}
	
	if (-not [string]::IsNullOrEmpty($mensagem)) {
		Write-Host "$($mensagem): $($nomeVar) = $($retorno)"
	}

	return $retorno
}

1..20 | ForEach-Object { 
    $valor = "{0:0000}" -f $_
    Set-Item -Path "env:RELEASE_ARTIFACTS_GLOBUSWEB_aaaa$($valor)_FRONT_END_EXECUTAR_TASK"  -Value "SIM"
    Set-Item -Path "env:RELEASE_ARTIFACTS_GLOBUSWEB_aaaa$($valor)_FRONT_END_DEFINITIONNAME" -Value "aaa.bbb.ccc-$($valor)"
    Set-Item -Path "env:RELEASE_ARTIFACTS_GLOBUSWEB_aaaa$($valor)_FRONT_END_BUILDNUMBER"    -Value $valor
}

$env:RELEASE_ARTIFACTS_GLOBUSWEB_aaaa0001_FRONT_END_DEFINITIONNAME

$regex = "RELEASE_ARTIFACTS_(.*)_(FRONT|BACK)_END_EXECUTAR_TASK"
$variaveis = Get-ChildItem Env: |
    Where-Object { $_.Name -match $regex -and
                   $_.Value -eq "SIM" -and
                   $_.Name -ne "RELEASE_ARTIFACTS_GLOBUSWEB_SETUP" }

$nucleos    = [Environment]::ProcessorCount
$qtdeGrupos = [Math]::Max([Math]::Min($nucleos, $variaveis.Count), 1)

$qtdeGrupos
$variaveis.Count

$modulos = @()
$indice = 0
foreach ($item in $variaveis) {
    if ($item.Name -notmatch $regex) {
        continue
    }
    $indice % $qtdeGrupos
    $modulos += [PSCustomObject]@{
        Site       = $Matches[1]
        Grupo	   = [Math]::Floor($indice / $qtdeGrupos)
        Nome       = Get-Valor    -Nome "RELEASE_ARTIFACTS_$($Matches[1])_$($Matches[2])_END_DEFINITIONNAME"
        VersaoNova = Get-Valor    -Nome "RELEASE_ARTIFACTS_$($Matches[1])_$($Matches[2])_END_BUILDNUMBER"
        PossuiUi   = Get-Condicao -Nome "RELEASE_ARTIFACTS_$($Matches[1])_$($Matches[2])_END_POSSUI_UI"
    }
    $indice++
}


$porSite    = @($modulos | Group-Object { $_.Grupo })
$porSite

Write-Host "Nucleos: $nucleos | Grupos paralelos: $qtdeGrupos | Modulos: $($modulos.Count)"
$jobs = foreach ($chave in $porSite) {
    Start-Job -Name "Grupo-$chave" -ScriptBlock {
        param ($pasta, $itens)
        #Start-Sleep -Seconds 5
        foreach ($modulo in $itens) {
            & "$pasta\Testex21_1.ps1" -Nome $modulo.Nome -Versao $modulo.VersaoNova -PossuiUi $modulo.PossuiUi
        }

    } -ArgumentList $PSScriptRoot, $chave.Group
}

Wait-Job -Job $jobs
$resultados = Receive-Job -Job $jobs

Remove-Job -Job $meusJobs