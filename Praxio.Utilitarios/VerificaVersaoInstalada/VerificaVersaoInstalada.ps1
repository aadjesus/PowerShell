$nome = $args[0]
try {
    $nome_Artefato = "RELEASE_ARTIFACTS_$($nome)_DEFINITIONNAME"
    $nome_Artefato = (Get-item env:$nome_Artefato).Value

    $versao_Artefato = "RELEASE_ARTIFACTS_$($nome)_BUILDNUMBER"
    $versao_Artefato = (Get-item env:$versao_Artefato).Value

    Write-Host "##[warning] Nome artefato:" $nome_Artefato
}
Catch {
    $nome_Artefato = $Env:BUILD_DEFINITIONNAME
    $versao_Artefato = $Env:BUILD_BUILDNUMBER

    Write-Host "##[warning] Nome build:" $nome_Artefato
}

if ($args[1] -ne $null) {
    $nome = $args[1]
    $nome_Artefato = "$nome_Artefato.$nome"
}

$arquivo = $Env:AGENT_ROOTDIRECTORY + '\versoes.json'
if (-not(Test-Path -Path $arquivo)) {    
    $json = @{} | ConvertTo-Json
    $json | Set-Content -Path $arquivo
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