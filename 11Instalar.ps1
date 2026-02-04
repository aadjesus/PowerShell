#Politica de segurança powershell.ps1

#habita o uso dos scripts
#Set-ExecutionPolicy Unrestricted 
#Desabilita 
#Set-ExecutionPolicy Restricted 

clear
Get-ExecutionPolicy
Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# notepad++
choco install notepadplusplus  -y --force

# chrome
choco install googlechrome -y --force

# visual studio code
choco install vscode -y --force

# teams
choco install microsoft-teams  -y --force

# git
choco install git -y --force
# mostra dados git no power shell
choco install poshgit -y --force 

# visual studio 2022 enterprise
choco install visualstudio2022enterprise -y --force

# total commander
choco install totalcommander -y --force

# box
choco install boxsync -y --force

# postman
choco install postman -y --force

#choco install nodejs.install --version=14.15.4 -y --force
choco install nvm -y --force

# docker for windows
choco install docker-desktop -y --force

# IDE curso
choco install cursoride -y --force

# Auth github
choco install gh -y --force