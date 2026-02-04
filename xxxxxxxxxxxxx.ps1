cls
$token               = "TOKEN_AQUI"
$tags                = "TAGS_AQUI"
$releaseDesc         = "RELEASE_DESCRIPTION"
$agentDir            = "c:\azagent\A4\_work\r4\a"
$COMPUTERNAME        = "COMPUTERNAME_AQUI"
$projectname         = "SYSTEM_TEAMPROJECT"
$deploymentgroupname = "deployment_group"  
$url                 = "SYSTEM_TASKDEFINITIONSURI"
$DESCRICAO           = "Sua Descricao"

$token        		 = "$env:TOKEN"
$tags         		 = "$env:TAGS"
$releaseDesc  		 = "$env:RELEASE_RELEASEDESCRIPTION"
$agentDir     		 = "$env:AGENT_RELEASEDIRECTORY"
$COMPUTERNAME 	     = "$env:COMPUTERNAME"
$projectname  		 = "$env:SYSTEM_TEAMPROJECT"
$deploymentgroupname = "$env:deployment_group"  
$url                 = "$env:SYSTEM_TASKDEFINITIONSURI"
$DESCRICAO			 = "$env:DESCRICAO"


$textoScript = @"
try {
    function Get-Servico {
    	param (
		    [string]`$nome
	    )

        `$retorno = Get-CimInstance -ClassName Win32_Service -Filter "Name LIKE '%`$nome%'" | Select-Object -First 1
        if (-not `$retorno){
            throw "Serviço Praxio não encontrado."
        }
        return `$retorno
    }    

    `$arquivoLog = "$agentDir\reinstalar_agent_`$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"    
    Start-Transcript -Path `$arquivoLog -Append

    Write-Host "Iniciando processo de reinstalação..."

    `$servico = Get-Servico -nome 'praxio'
    `$numero  = `$servico.PathName | Select-String 'A(\d+)' | % { [int]`$_.Matches.Groups[1].Value } 
    `$pasta   = "C:\azagent\A`$(`$numero)"    
    cd `$pasta

    Write-Host "--------------------------------------------------------------------------"
    Write-Host "Removendo agente antigo da pasta `$pasta..."

    .\config.cmd remove --unattended --auth PAT --token "$token"

    `$agentName = "$releaseDesc"
    if ([string]::IsNullOrWhiteSpace(`$agentName)) { 
        `$agentName = "$COMPUTERNAME-NEW" 
    }

    Write-Host "--------------------------------------------------------------------------"
    Write-Host "Configurando novo agente: `$agentName"

    .\config.cmd --unattended --deploymentgroup --deploymentgroupname "$deploymentgroupname" --agent "`$agentName" --runasservice --work '_work' --url "$url" --projectname "$projectname" --addDeploymentGroupTags --deploymentGroupTags "$tags" --auth PAT --token "$token"
    
    `$servico = Get-Servico -nome `$agentName
    sc.exe description `$servico.name "$DESCRICAO - `$(Get-Date -Format 'dd/MM/yyyy')"

    Write-Host "Processo finalizado com sucesso."

} catch {
    Write-Error "Erro detectado: `$_"
} finally {
    Stop-Transcript
}
"@

$pathScript  = "$agentDir\reinstalar_agent.ps1"
$textoScript | Out-File -FilePath $pathScript -Encoding utf8 -Force

$action = New-ScheduledTaskAction `
	-Execute "powershell.exe" `
	-Argument "-ExecutionPolicy Bypass -File $pathScript"

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
	-User "SYSTEM"