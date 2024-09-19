clear
Get-ExecutionPolicy
Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install notepadplusplus  -y
choco install googlechrome -y
choco install vscode -y
choco install microsoft-teams  -y
choco install git  -y
choco install visualstudio2022enterprise -y
choco install totalcommander -y
choco install boxsync -y
choco install postman -y
choco install poshgit -y
#choco install nodejs.install --version=14.15.4 -y 
choco install nvm -y
