cls

$Env:ssssssssss_CONNECTION_STRING = "Data Source=ORA11G64;User ID=PHD251006;Password=PHD251006"
$sufixo         = "CONNECTION_STRING"
$Env:AGENT_NAME = "ssssssssss"

try { 
    $nome = "$((Get-item env:"AGENT_NAME").Value)_$($sufixo)"
    if (-not (Test-Path "env:\$nome")) {    
	    throw "Variavel não encontrada. Ex: AGENT_NAME_CONNECTION_STRING"
    }

    $valor = (Get-item env:$nome).Value
    $itens = $valor.Split(';')
    if ($itens.count -lt 3) {
        throw "Connection string invalida."
    }

    foreach ($item in $itens) {
        $nomeIten  = $item.Split('=')[0] -replace ' ', '_'
        $valorIten = $item.Split('=')[1]

        Set-Content -Path "env:\$nomeIten" -Value $valorIten
    }

    Write-Host "##vso[task.setvariable variable=CONNECTION_STRING;]$valor"
    Set-Content -Path "env:\CONNECTION_STRING" -Value $valor
}
catch {
    Write-Host "##vso[task.logissue type=error;]$($_.Exception.Message)"
	Write-Host "##vso[task.complete result=Failed;]"
	exit 0    
}
