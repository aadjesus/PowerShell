cls
#$scriptPath = "d:\GitHub\PowerShell\Agendador_Tarefas_Windows_Commit.ps1"
#$runPath    = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
#$appName    = "CommitAutomatico"
#
#$command    = "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$scriptPath`""
#
#if (-not (Test-Path $registryPath)) {
#    New-Item -Path $registryPath -Force | Out-Null
#    Write-Host "Chave criada com sucesso!" -ForegroundColor Green
#}
#
#New-ItemProperty -Path $runPath -Name $appName -Value $command -PropertyType String -Force
#
#Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name $appName


$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$name = "CommitAutomatico"
$value = 'powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File "d:\GitHub\PowerShell\Agendador_Tarefas_Windows_Commit.ps1"'

try {
    # Garante que a chave 'Run' existe (raramente não existe, mas por segurança)
    if (-not (Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
    }

    # Cria ou sobrescreve o valor
    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType String -Force -ErrorAction Stop
    
    Write-Host "✅ Sucesso! O valor '$name' foi criado no Registro." -ForegroundColor Green
}
catch {
    Write-Host "❌ Erro ao registrar: $($_.Exception.Message)" -ForegroundColor Red
}