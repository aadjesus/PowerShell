
#$rwa=Get-SPWebApplication | where {$_.Name -match "Your Old Web Application Name"}
#$rwa.Name
#$rwa.Name="Your New Web Application Name"
#$rwa.Update()
#Get-SPWebApplication | where {$_.Name -match "Your New Web Application Name"}





Import-Module WebAdministration
#New-Item -ItemType Directory -Path d:\iis\robbinsapps
#New-WebApplication -Name RobbinsApps -Site MikeFRobbins -PhysicalPath d:\iis\robbinsapps -ApplicationPool "ASP.NET v4.0"
#Get-ChildItem iis:\sites\mikefrobbins

#https://localhost
#Rename-Item 'localhost:\Sites\Plantao' 'Sites\Plantao-Teste'
#Get-ChildItem iis:\sites\mikefrobbins

#$webname = Get-SPWebApplication | Where {$_.Name -match "SPDEV"} 

#Import-Module WebAdministration
#New-Item -ItemType Directory -Path c:\Praxio\Plantao
#New-WebApplication -Name RobbinsApps -Site MikeFRobbins -PhysicalPath c:\Praxio\Plantao -ApplicationPool "ASP.NET v4.0"
#Get-ChildItem iis:\sites\mikefrobbins


#Rename-Item 'IIS:\Sites\MikeFRobbins\RobbinsApps' 'RobbinsApps-Archive'
#Get-ChildItem iis:\sites\mikefrobbins


Import-Module WebAdministration # 

$webSite = Get-ChildItem iis:\sites\plantao2

#Rename-Item iis:\sites\plantao plantao2
