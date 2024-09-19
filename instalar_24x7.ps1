Write-Host "Procurando serviço 24x7"
$site24x7 = (Get-Service | Where-Object {$_.Name -like "*24x7*" })
if ($site24x7.length -gt 0) {
    $site24x7
    return
}

Try {    
    Write-Host "Fazendo download serviço 24x7"
    $pathSite24x7WindowsAgent = "c:\tmp\x\Site24x7WindowsAgent.msi"
    #Invoke-WebRequest $(URLDownload24x7) -OutFile $pathSite24x7WindowsAgent

    Write-Host "Instalando serviço 24x7"

    #msiexec.exe /i "$pathSite24x7WindowsAgent" EDITA1=832461a31989bb36813a769dbe5a1b1a689ff75f ENABLESILENT=YES REBOOT=ReallySuppress DN="$(InstanceName)" TP="Manu360 - Alerta servidor" RP="None" NP="Default Notification" GN="Manu360 - Clientes" RULE="production servers" /qn
    Write-Host '"$pathSite24x7WindowsAgent"'
} Catch {
    #Write-Host "##vso[task.logissue type=error]$_.Exception"
	Throw 
}
