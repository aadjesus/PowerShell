clear 
cd c:\Praxio\PortalDoCliente\
#git log -1 --follow .\Main\Source\MyTicket\BGM.Database\BGM.Database.MyTicket.csproj

$ultimo_commit = git log -1 --pretty=tformat:"%H" --follow .\Main\Source\MyTicket\BGM.Database\BGM.Database.MyTicket.csproj;


#cd $(build.sourcesdirectory)

#$commit = git log -1 --pretty=tformat:'%H' --follow '.\Main\Source\MyTicket\BGM.Database\BGM.Database.MyTicket.csproj'

#Write-Host "##vso[task.setvariable variable=ultimo_commit]$commit"
#Write-Host "##vso[task.setvariable variable=ultimo_commit;isoutput=true]$commit"



Write-Host $ultimo_commit