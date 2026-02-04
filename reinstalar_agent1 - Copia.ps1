function Get-Servico {
    param (
       [string]$nome = 'praxio'
    )

    Write-Host "Procurando serviço"
    $retorno = Get-CimInstance -ClassName Win32_Service -Filter "Name LIKE '%$($nome)%'" | 
        Select-Object -First 1

    if (-not $retorno) {
        Write-Host "##vso[task.logissue type=error]Serviço não encontrado"
        Write-Host "##vso[task.complete result=Failed;]"
        #exit 0
    }

    return $retorno
}

$servicoAtual = Get-Servico

Write-Host "Criando pasta"
$numero = $servicoAtual.PathName | Select-String 'A(\d+)' | % { [int]$_.Matches.Groups[1].Value } 
$pasta     = "C:\azagent\A$($numero + 1)"

Get-Process | Where-Object { $_.Path -like "$pasta*" } | Stop-Process -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
    
Remove-Item -Path $pasta -Recurse -Force -ErrorAction SilentlyContinue

New-Item -Path $pasta -ItemType Directory -Force -ErrorAction SilentlyContinue

Write-Host "Fazendo download"
$url = "https://download.agent.dev.azure.com/agent/4.266.2/vsts-agent-win-x64-4.266.2.zip"
$zip = "$(AGENT.TEMPDIRECTORY)\agent.zip"
$WebClient = New-Object Net.WebClient
$WebClient.DownloadFile($url, $zip)

Write-Host "Descompactando"
Add-Type -AssemblyName System.IO.Compression.FileSystem;
[System.IO.Compression.ZipFile]::ExtractToDirectory($zip, $pasta);

$agentName = "$(RELEASE.RELEASEDESCRIPTION)"
if ([string]::IsNullOrEmpty($agentName)) {
    $agentName = "$($env:COMPUTERNAME)-NEW"
}

Write-Host "Executando"
cd $pasta
.\config.cmd --unattended `
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
  --token "$(TOKEN)" `

$servicoNovo = Get-Servico -nome $agentName
sc.exe description $servicoNovo.name "$(DESCRICAO) - $(Get-Date -Format 'dd/MM/yyyy')" 

Write-Host "Excluindo serviço"
try {
	sc.exe delete $servicoAtual.name
}
catch {
   Write-Host "$_" -ForegroundColor Red;
}