try {
	$origem = "C:\Users\alessandro.augusto\.claude"
	$destino = "d:\GitHub\MEMORY.claude"

	# Copia settings.json
	Copy-Item `
		-Path "$origem\settings.json" `
		-Destination "$destino\settings.json" `
		-Force

	# Copia projects
	robocopy `
		"$origem\projects" `
		"$destino\projects" `
		/E `
		/IS `
		/IT

	# Copia plugins
	robocopy `
		"$origem\plugins" `
		"$destino\plugins" `
		/E `
		/IS `
		/IT

	Write-Host "Backup concluído."	
} catch {
    Write-Error "Erro: $_"
} finally {
    Stop-Transcript
}