clear 
#Get-IISAppPool;
#Get-IISAppPool | Select-Object | where {$_.name -eq "Cargas - API"} | Start-WebAppPool;
#Get-IISSite
#Get-IISSite | Select-Object | where {$_.name -eq "Cargas - API"} | Stop-IISSite -Confirm;

#Stop-IISSite -Confirm:$false -Name "Cargas - API"
#Start-IISSite -Name "Cargas - API"

foreach ($AppPool in Get-IISAppPool) {
    Write-Host $AppPool.name
    $AppPool.Recycle()
}