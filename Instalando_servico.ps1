clear 

#PS C:\> Get-Service  -Name "iisadmin" | Format-List -Property Name, DependentServices
#PS C:\> Stop-Service -Name "iisadmin" -Force -Confirm

#Write-Host 'Procurando serviço'
#$servico = Get-Service -Name "*Manu360*"
#if ($servico.Status -eq $null) {
    #return
#}

#sc.exe delete $servico
#Remove-Service -Name $servico

#$service = Get-WmiObject -Class Win32_Service -Filter "Name='BgmRodotec.Manu360$Teste'"
#if ($service -ne $null) {
#    $service.delete()
#}
#Get-Service -Name "*Manu360*" | ForEach-object
#{ 
#    cmd /c  sc delete $_.Name
#}


#New-Service -Name 'Teste123' -BinaryPathName .\Praxio.NNKote.Servico.exe -DisplayName 'ssss' -Description 'ssssssss'

#$service = Get-WmiObject -Class Win32_Service -Filter "Name='BgmRodotec.Manu360'"
#$service
#sc stop 'BgmRodotec.Manu360'
#sc delete 'BgmRodotec.Manu360'

#SC QUERY state= all | FIND "_NAME"

#$service.Delete();

$nome = 'Praxio.NNKote.Servico.Integracao'


$service = Get-Service $nome -ErrorAction SilentlyContinue 

#sc.exe delete $service
$service
if ($service -ne $null -and $service.Status -ne 'Stopped') {      
    try {
        Stop-Service -Name $service -Force -ErrorAction Stop
        Write-Host 'xxxxxxxxxxxxxx'
    } Catch {
        Write-Host 'Não foi possivel parar o serviço: ' $_.Exception        

    }
    #sc.exe delete $service
}

#$service

#(get-wmiobject win32_Service | Where-Object { $nome -contains $_.Name })
$x1 = (get-wmiobject win32_Service | Where-Object { $nome -eq $_.Name }).ProcessID | % { Stop-Process -Force $_ }

$x1


#$presentServicesArray | % { Set-Service -Name $_.Name -StartupType $startupType -ErrorAction SilentlyContinue }
#$presentServicesArray | Where-Object { $_.Status -ne "Stopped" } | % { $_.Stop() }

#$ErrorActionPreference = "SilentlyContinue" # I don't want the wait for status to throw in the case of a timeout
#$presentServicesArray | % { $_.WaitForStatus("Stopped", [TimeSpan]::FromSeconds($waitTimeoutInSeconds)) }
#$ErrorActionPreference = "Stop"


#clear
#$name = 'Praxio.NNKote.Servico.Integracao'
#$presentServicesArray = $null
#$x1 = [PSCustomObject[]](Get-Service -Name $name -ErrorAction SilentlyContinue)
#$presentServicesArray += $x1
#$x1
######################################
#clear
#$nome    = 'Praxio.NNKote.Servico.Integracao'
#$servico =  (Get-Service -Name $nome -ErrorAction SilentlyContinue)
#if ($servico -eq $null) {
#    Write-Host 'Instalando serviço'
#    .\Praxio.NNKote.Servico.exe Install
#    Start-Service -Name $nome
#} elseif($servico.Status -eq 'Running')  {
#   Write-Host 'Parando serviço' 
#   Stop-Service -Name $nome -Force -ErrorAction Stop
#} elseif($servico.Status -eq 'Stopped')  {
#   Write-Host 'Executando serviço'  
#   Start-Service  -Name $nome
#}
#####################################
#clear
#$nome = 'Praxio.NNKote.Servico.Integracao'
##New-Service -Name $nome -BinaryPathName "c:\tmp\a\Praxio.NNKote.Servico.exe" -DisplayName 'xxxxxxxxx' -Description 'wwwwwwwwwwww' 
##c:\tmp\a\Praxio.NNKote.Servico.exe Install -instance eeeeee
#$service = Get-Service $nome
#$service
#sc.exe delete $service