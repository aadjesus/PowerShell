try {
    $pathBaseLog = "c:\#Log\"
    New-Item -Path $pathBaseLog -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
    $nomeScript = $MyInvocation.MyCommand -replace "\.", "_"
    $arquivoLog = "$($pathBaseLog)\$($nomeScript)_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
    Start-Transcript -Path $arquivoLog -Append
    
    $origem  = "$($env:USERPROFILE)\AppData\Roaming\microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
    $destino = "$($env:USERPROFILE)\Box\Aplicativos\PowerShell\PSReadLine\ConsoleHost_history_$(Get-Date -f yyyyMMdd_hhmmss).txt"
    
    Move-Item -Path $origem -Destination $destino 
} catch {
    Write-Error "Erro: $_"
} finally {
    Stop-Transcript
}