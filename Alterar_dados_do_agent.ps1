$textoScript = @"
try {
    function Get-Servico {
         Write-Host "Procurando serviço"

        `$retorno = Get-CimInstance -ClassName Win32_Service -Filter "Name LIKE '%praxio%'" | Select-Object -First 1
        if (-not `$retorno){
            throw "Serviço `$nome não encontrado."
        }
        return `$retorno
    }    

    `$arquivoLog = "`$(AGENT.RELEASEDIRECTORY)\reinstalar_agent_`$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"    
    Start-Transcript -Path `$arquivoLog -Append

    Write-Host "Iniciando processo de reinstalação..."

    `$servico = Get-Servico
    `$numero  = `$servico.PathName | Select-String 'A(\d+)' | % { [int]`$_.Matches.Groups[1].Value } 
    `$pasta   = "C:\azagent\A`$(`$numero)"    
    cd `$pasta

    Write-Host "--------------------------------------------------------------------------"
    Write-Host "Removendo agente antigo da pasta `$pasta..."

    .\config.cmd ``
          remove ``
          --unattended ``
          --auth PAT ``
          --token `$(TOKEN)

    Write-Host "--------------------------------------------------------------------------"
    Write-Host "Configurando novo agente: `$agentName"

    .\config.cmd ``
          --unattended ``
          --deploymentgroup ``
          --deploymentgroupname "`$(deployment_group)" ``
          --runasservice ``
          --work _work ``
          --url "`$(SYSTEM.TASKDEFINITIONSURI)" ``
          --projectname "`$(SYSTEM.TEAMPROJECT)" ``
          --addDeploymentGroupTags ``
          --deploymentGroupTags "`$(TAGS)" ``
          --auth PAT ``
          --token `$(TOKEN)
    
    `$servico = Get-Servico
    sc.exe description `$servico.name "`$(DESCRICAO) - `$(Get-Date -Format 'dd/MM/yyyy')"

    Write-Host "Processo finalizado com sucesso."

} catch {
    Write-Error "Erro detectado: `$_"
} finally {
    Stop-Transcript
}
"@

$pathScript  = "$(AGENT.RELEASEDIRECTORY)\reinstalar_agent.ps1"

Write-Host "Criando arquivo: $($pathScript)"
$textoScript | Out-File -FilePath $pathScript -Encoding utf8 -Force

Write-Host "Criando tarefa para executar o script e exclui-lo apos execução "
$action = New-ScheduledTaskAction `
	-Execute "powershell.exe" `
	-Argument "-ExecutionPolicy Bypass -Command `"& '$pathScript'; Remove-Item -Path '$pathScript' -Force -ErrorAction SilentlyContinue`""

$inicio = (Get-Date).AddMinutes(1)
$fim    = (Get-Date).AddMinutes(2)

$trigger  = New-ScheduledTaskTrigger -Once -At $inicio
$trigger.EndBoundary = $fim.ToString("yyyy-MM-ddTHH:mm:ss")

$settings = New-ScheduledTaskSettingsSet `
	-DeleteExpiredTaskAfter (New-TimeSpan -Seconds 0)

Register-ScheduledTask `
	-TaskName "Praxio-Agente" `
	-Action $action `
	-Trigger $trigger `
	-Settings $settings `
	-User "SYSTEM" `
        -Force