$nome = $args[0]

$nome_Artefato = "RELEASE_ARTIFACTS_$($nome)_DEFINITIONNAME"
$nome_Artefato = (Get-item env:$nome_Artefato).Value

$versao_Artefato = "RELEASE_ARTIFACTS_$($nome)_BUILDNUMBER"
$versao_Artefato = (Get-item env:$versao_Artefato).Value

Write-Host "##[warning] Nome artefato: $nome_Artefato, versão: $versao_Artefato" 

$arquivo = $Env:AGENT_ROOTDIRECTORY + '\_globusweb\versoes.json'
if (-not (Test-Path -Path $arquivo)) {    
    $json = @{} | ConvertTo-Json
    $directory = Split-Path -Path $arquivo -Parent
    if (-not (Test-Path -Path $directory)) {
        New-Item -ItemType Directory -Path $directory -Force
    }
    $json | Out-File -FilePath $arquivo -Force
}

$json         = Get-Content -Path $arquivo -Force | ConvertFrom-Json
$versao_Atual = $json.$nome_Artefato

if ($versao_Atual -ne $null) {
   Write-Host "##[warning] Versao atual:" $versao_Atual
}

if ($versao_Atual -eq $versao_Artefato) {
   Write-Host "##[warning] Versao ja instalada"
   Write-Host "##vso[task.setvariable variable=ATUALIZAR;]Nao"
}
elseif ($json.$nome_Artefato -eq $null) {
    Write-Host "##[warning] Instalar projeto"
    $json | Add-Member -Name $nome_Artefato -Type NoteProperty -Value $versao_Artefato
} else {
    Write-Host "##[warning] Atualizar projeto"
    $json.$nome_Artefato = $versao_Artefato
}

$json | ConvertTo-Json | Set-Content $arquivo