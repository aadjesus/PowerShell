Clear-Host

#(Get-Service | Where-Object {$_.Name -like "*24x7*" }) | ForEach-object{ cmd /c  sc delete $_.Name}

Try {    
    function Achou24x7 {
        Return (Get-Service | Where-Object {$_.Name -like "*24x7*" }) -ne $null
    } 

    if (!Achou24x7){
        Write-Host "24x7 Já está instalado"
        Return 
    }    

    $URLDownload24x7 = "https://staticdownloads.site24x7.com/server/Site24x7WindowsAgent.msi"
    $pathSite24x7WindowsAgent = "c:\tmp\x\Site24x7WindowsAgent.msi"

    Write-Host "Fazendo download 24x7" 
    Write-Host "URL download    :" $URLDownload24x7
    Write-Host "Destino download:" $pathSite24x7WindowsAgent

    #Invoke-WebRequest $URLDownload24x7 -OutFile $pathSite24x7WindowsAgent

    Write-Host "Instalando 24x7" 
    #msiexec /i "c:\tmp\x\Site24x7WindowsAgent.msi" EDITA1=832461a31989bb36813a769dbe5a1b1a689ff75f ENABLESILENT=YES REBOOT=ReallySuppress DN="xx1" TP="Manu360 - Alerta servidor" RP="None" NP="TestAlert" GN="Manu360 - Clientes" /qn
    
    msiexec /i $pathSite24x7WindowsAgent EDITA1=832461a31989bb36813a769dbe5a1b1a689ff75f ENABLESILENT=YES REBOOT=ReallySuppress DN="xx1" /qn

    While($true)
    {       
    
        if(-not(Test-Path ($dirApi)) -or $sw.Elapsed.Seconds -eq 30){
            break  
        }
        write-Host 'Api removido' 
    }

    #msiexec /i "Site24x7WindowsAgent.msi" EDITA1=832461a31989bb36813a769dbe5a1b1a689ff75f ENABLESILENT=YES REBOOT=ReallySuppress DN="xx1" TP="xx2" RP="None" NP="xx3" GN="xx3" /qn
    #msiexec /i ('"' + $pathSite24x7WindowsAgent + '"') EDITA1=832461a31989bb36813a769dbe5a1b1a689ff75f ENABLESILENT=YES REBOOT=ReallySuppress DN="xx1" TP="xx2" RP="None" NP="xx3" GN="xx3" /qn
    
    #$x1 =  ('"' + $pathSite24x7WindowsAgent + '"')
    #cd c:\tmp\x
    #msiexec /i "Site24x7WindowsAgent.msi" EDITA1=832461a31989bb36813a769dbe5a1b1a689ff75f ENABLESILENT=YES REBOOT=ReallySuppress DN="xx-1" TP="Manu360 - Alerta servidor" RP="None" NP="Default Notification" GN="Manu360 - Clientes" RULE="production servers" /qn
    #msiexec /i "Site24x7WindowsAgent.msi" EDITA1=832461a31989bb36813a769dbe5a1b1a689ff75f ENABLESILENT=YES REBOOT=ReallySuppress DN="xx1" TP="xx2" RP="None" NP="TestAlert" GN="xx3" /qn

} Catch {
    Write-Host $_.Exception    
}
