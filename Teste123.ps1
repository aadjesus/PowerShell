cls

Write-Host "Processo finalizado com sucesso."
$arquivoLog = "C:\DestinationFolder\reinstalar_agent_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"    

New-Item -Path $arquivoLog -ItemType "File"