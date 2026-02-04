# Baixe o ZIP (substitua pela versão mais recente)
Invoke-WebRequest -Uri "https://github.com/coreybutler/nvm-windows/releases/download/1.1.11/nvm-noinstall.zip" -OutFile "nvm-noinstall.zip"

# Extraia para uma pasta (ex: C:\nvm)
Expand-Archive -Path "nvm-noinstall.zip" -DestinationPath "C:\nvm"




# Adicione NVM ao PATH do usuário
[Environment]::SetEnvironmentVariable("NVM_HOME", "C:\nvm", "User")
[Environment]::SetEnvironmentVariable("NVM_SYMLINK", "C:\nodejs", "User")
[Environment]::SetEnvironmentVariable("Path", [Environment]::GetEnvironmentVariable("Path", "User") + ";C:\nvm", "User")

# Atualize o PATH na sessão atual
$env:Path += ";C:\nvm"


New-Item -ItemType Directory -Path "C:\nodejs" -Force

nvm version

nvm install 18.12.1

nvm use 18.12.1

#Alternativa: Usar um arquivo settings.txt
#Você pode criar um arquivo settings.txt na pasta do NVM para configurar os caminhos:

#text
#root: C:\nvm
#path: C:\nodejs


## Extrair NVM portátil
#Expand-Archive -Path "nvm-noinstall.zip" -DestinationPath "C:\azagent\A1\_work\nvm"
#
## Configurar variáveis
#[Environment]::SetEnvironmentVariable("NVM_HOME", "C:\azagent\A1\_work\nvm", "User")
#[Environment]::SetEnvironmentVariable("NVM_SYMLINK", "C:\azagent\A1\_work\nodejs_symlink", "User")
#$env:Path += ";C:\azagent\A1\_work\nvm"
#
## Criar diretórios necessários
#New-Item -ItemType Directory -Path "C:\azagent\A1\_work\nodejs_symlink" -Force
#
## Instalar e usar uma versão do Node.js
#nvm install 18.16.0
#nvm use 18.16.0