cls
$quantidade = Get-Random -Minimum 2 -Maximum 6
$hoje18hs   = Get-Date   -Hour 18 -Minute 0 -Second 0
$atual      = Get-Date
#$atual      = Get-Date -Date "2026-02-05 08:00 AM"

$tempoDisponivel  = [Math]::Round(($hoje18hs - $atual).TotalMinutes, 0) 
if ($tempoDisponivel -le 0) {
    return
}

$intervaloMinutos = $tempoDisponivel / $quantidade
$triggers = @()

for ($i = 1; $i -le $quantidade; $i++) {

    $maximo = [Math]::Floor($intervaloMinutos / 2) 
    $variacaoRandomica = Get-Random -Minimum 0 -Maximum $maximo
    
    $inicio = $atual.AddMinutes(($intervaloMinutos * $i) - $variacaoRandomica)
    
    if ($inicio -gt $hoje18hs) { 
        $inicio = $hoje18hs.AddMinutes(-1) 
    }
    $fim = $inicio.AddMinutes(2)

    $trigger = New-ScheduledTaskTrigger -Once -At $inicio
    $trigger.EndBoundary = $fim.ToString("yyyy-MM-ddTHH:mm:ss")

    $triggers += $trigger

    Write-Host "Trigger $i agendada para: $($inicio.ToString('HH:mm:ss')) : $($fim.ToString('HH:mm:ss'))" -ForegroundColor Cyan
}

$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$guid        = [guid]::NewGuid().Guid
$taskName    = "ALE - Commit automatico - $guid"

$action = New-ScheduledTaskAction `
	-Execute "powershell.exe" `
	-Argument "-WindowStyle Hidden -ExecutionPolicy Bypass -File d:\GitHub\PowerShell\git_commit_arquivo_teste.ps1"

$settings = New-ScheduledTaskSettingsSet `
    -DeleteExpiredTaskAfter (New-TimeSpan -Seconds 0)

Register-ScheduledTask `
    -TaskName $taskName `
    -Action $action `
    -Trigger $triggers `
    -Settings $settings `
    -User $currentUser `
    -Force