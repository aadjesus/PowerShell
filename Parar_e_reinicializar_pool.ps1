clear
$NOME_WEBSITE = "NnKote"

Try {    
	  Get-IISAppPool | where { $_.Name -eq "$NOME_WEBSITE" -and $_.state -eq "Started"} | Stop-WebAppPool
	  Get-IISAppPool | where { $_.Name -eq "$NOME_WEBSITE"}
} Catch {

	  Write-Host "##vso[task.logissue type=error]--------------------------------------------------------------------------------------------------------"   
	  Write-Host "##vso[task.logissue type=error]Ocorreu um erro ao tentar parar o pool de aplicativo"
	  Write-Host "##vso[task.logissue type=error]$_.Exception"
	  Write-Host "##vso[task.logissue type=error]--------------------------------------------------------------------------------------------------------"   
	  Throw 
}

Get-IISAppPool | where { $_.Name -eq "$NOME_WEBSITE" -and $_.state -eq "Stopped"} | Start-WebAppPool
Get-IISAppPool | where { $_.Name -eq "$NOME_WEBSITE"}