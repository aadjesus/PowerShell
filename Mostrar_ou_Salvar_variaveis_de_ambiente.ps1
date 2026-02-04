cls

$Env:PATH_DESTINO = "c:\Praxio\AmbienteDev\GlobusWeb\"

Write-Host "----------------------- Variáveis da maquina"
[System.Environment]::GetEnvironmentVariables()
Write-Host "`n----------------------- Variáveis do usuário"
[System.Environment]::GetEnvironmentVariables('User')
#Write-Host "`n----------------------- Salvar"
[Environment]::SetEnvironmentVariable("GLOBUSWEB_DEV_PATH", "c:\Praxio\GlobusWeb\", "User")
#Write-Host "`n----------------------- Obter"
[Environment]::GetEnvironmentVariable("GLOBUSWEB_DEV_PATH", "User")


[Environment]::SetEnvironmentVariable("XXXXXXXX", "", "User")
[Environment]::GetEnvironmentVariable("XXXXXXXX", "User")

#$Env:SYSTEM_ACCESSTOKEN