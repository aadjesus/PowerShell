$textoScript = {
    function Get-Servico {
        Write-Host "Procurando serviço..."
        $retorno = Get-CimInstance -ClassName Win32_Service -Filter "Name LIKE '%praxio%'" | 
            Select-Object -First 1

        if (-not $retorno){
            Write-Host "##vso[task.logissue type=error]Serviço não encontrado"
            Write-Host "##vso[task.complete result=Failed;]"
            exit 0
        }

        return $retorno
    }

    $servico = Get-Servico
    $numero  = $servico.PathName | Select-String 'A(\d+)' | % { [int]$_.Matches.Groups[1].Value } 
    $pasta   = "C:\azagent\A$($numero)"
    cd $pasta

    .\config.cmd remove `
        --unattended `
        --auth 'PAT' `
        --token $(TOKEN) `
    
    $agentName = "$(RELEASE.RELEASEDESCRIPTION)"
    if ([string]::IsNullOrEmpty($agentName)) {
        $agentName = "$($env:COMPUTERNAME)-NEW"
    }

    .\config.cmd `
        --unattended `
        --deploymentgroup `
        --deploymentgroupname "Praxio-Releases-Produção" `
        --agent $agentName `
        --runasservice `
        --work '_work' `
        --url 'https://dev.azure.com/praxio/' `
        --projectname 'Desenvolvimento' `
        --addDeploymentGroupTags  `
        --deploymentGroupTags "$(TAGS)" `
        --auth PAT `
        --token $(TOKEN) `
    
    $servico = Get-Servico -nome $agentName
    sc.exe description $serviconame "$(DESCRICAO) - $(Get-Date -Format 'dd/MM/yyyy')" 
}

$pathScript = "$(AGENT.RELEASEDIRECTORY)\reinstalar_agent.ps1"
$textoScript | Out-File -FilePath $pathScript -Encoding utf8

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