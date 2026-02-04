#deletar o serviço via CMD
#SC STOP AgentService
#SC DELETE AgentService
#Get-Service -Name "Praxio-Azure DevOps" | Remove-Service
#Get-Service -Name "Stuff" | ForEach-object{ cmd /c  sc delete $_.Name}

#Abrir powershell como administrador
#powershell -Command "Start-Process powershell -Verb runAs"

New-Service -Name "Praxio-Azure DevOps" -Description "Conecta a maquina com o Azure DevOps da https://dev.azure.com/praxio" -StartupType "Automatic" -BinaryPathName c:\azagent\A1\bin\AgentService.exe

