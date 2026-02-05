cls

$pathScript = "d:\GitHub\PowerShell\git_commit_arquivo_teste.ps1"

$action = New-ScheduledTaskAction `
    -Execute "powershell.exe" `
    -Argument "-ExecutionPolicy Bypass -File $pathScript"

$agora = Get-Date
$limiteHoje = Get-Date -Hour 20 -Minute 0 -Second 0
$quantidade = Get-Random -Minimum 2 -Maximum 6

$triggers = @()

for ($i = 1; $i -le $quantidade; $i++) {
    $segundosRestantes = ($limiteHoje - $agora).TotalSeconds
    
    if ($segundosRestantes -gt 0) {
        $maximo = [Math]::Floor($segundosRestantes) 
        $randomOffset = Get-Random -Minimum 0 -Maximum $maximo
        $horarioSorteado = $agora.AddSeconds($randomOffset)
        
        $inicio = (Get-Date).AddMinutes($i)
        $fim    = (Get-Date).AddMinutes($i).AddSeconds(10)
                
        $trigger = New-ScheduledTaskTrigger -Once -At $inicio        
        $trigger.EndBoundary = $fim.ToString("yyyy-MM-ddTHH:mm:ss")

        $triggers += $trigger
    }
}

if ($triggers.Count -gt 0) {
    $settings = New-ScheduledTaskSettingsSet `
        -DeleteExpiredTaskAfter (New-TimeSpan -Seconds 0)

    Register-ScheduledTask `
        -TaskName "ALE - Commit automatico" `
        -Action $action `
        -Trigger $triggers `
        -Settings $settings `
        -User "SYSTEM" `
        -Force
    
    Write-Host "$($triggers.Count) execuções agendadas para hoje até às 18:00."
} else {
    Write-Warning "Não há tempo hábil para agendar execuções antes das 18:00 hoje."
}