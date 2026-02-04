try {
    function Get-Servico {
    	param (
		    [string]$nome
	    )

        $retorno = Get-CimInstance -ClassName Win32_Service -Filter "Name LIKE '%$nome%'" | Select-Object -First 1
        if (-not $retorno){
            throw "Serviço $nome não encontrado."
        }
        return $retorno
    }    

    $arquivoLog = "C:\azagent\A1\_work\r1\a\reinstalar_agent_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"    
    Start-Transcript -Path $arquivoLog -Append

    Write-Host "Iniciando processo de reinstalação..."

    $servico = Get-Servico -nome 'praxio'
    $numero  = $servico.PathName | Select-String 'A(\d+)' | % { [int]$_.Matches.Groups[1].Value } 
    $pasta   = "C:\azagent\A$($numero)"    
    cd $pasta

    Write-Host "--------------------------------------------------------------------------"
    Write-Host "Removendo agente antigo da pasta $pasta..."

    .\config.cmd `
          remove `
          --unattended `
          --auth PAT `
          --token "ssssssssssssssss"

    $agentName = ""
    if ([string]::IsNullOrWhiteSpace($agentName)) { 
        $agentName = "AAUGUSTO-NEW" 
    }

    Write-Host "--------------------------------------------------------------------------"
    Write-Host "Configurando novo agente: $agentName"

    .\config.cmd `
          --unattended `
          --deploymentgroup `
          --deploymentgroupname "Praxio-Releases-Produção" `
          --agent "$agentName" `
          --runasservice `
          --work _work `
          --url "https://dev.azure.com/praxio/" `
          --projectname "Desenvolvimento" `
          --addDeploymentGroupTags `
          --deploymentGroupTags "#ATENÇÃO: Excluir essa TAG e criar uma TAG: #NOMEDOCLIENTE_CODDIGOSAC_NOMEMAQUINA" `
          --auth PAT `
          --token "ssssssssssssssss"
    
    $servico = Get-Servico -nome $agentName
    sc.exe description $servico.name "Praxio - Agente de Deployment Group para integração e entrega contínua (CI/CD) - $(Get-Date -Format 'dd/MM/yyyy')"

    Write-Host "Processo finalizado com sucesso."

} catch {
    Write-Error "Erro detectado: $_"
} finally {
    Stop-Transcript
}
