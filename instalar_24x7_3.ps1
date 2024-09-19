Try {
    function Achou24x7 {
        Return (Get-Service | Where-Object {$_.Name -like "*24x7*" }) -ne $null
    }    

    Write-Host "##[warning] Procurando"    
    if (Achou24x7){
        Write-Host "##[warning] Já está instalado"
        Return 
    }

    $key24x7  = "832461a31989bb36813a769dbe5a1b1a689ff75f"
    $download = "https://staticdownloads.site24x7.com/server/Site24x7WindowsAgent.msi"
    $arquivoMsi =  "c:\tmp\x\Site24x7WindowsAgent.msi"
    $arquivoLog =  $arquivoMsi.replace('.msi','.log')

    Write-Host "##[warning] Fazendo download" 
    Write-Host "##[warning] URL.:" $download
    Write-Host "##[warning] Destino.:" $arquivoMsi
    Invoke-WebRequest $download -OutFile $arquivoMsi
    
    if ((Get-ChildItem $arquivoMsi) -eq $null){
        Write-Host "##[error] Download não encontrado"
        Return 
    }

    $parametros = @(
        "/i"
        ('"{0}"' -f $arquivoMsi)
        ("EDITA1={0}" -f $key24x7)
        ("ENABLESILENT={0}" -f "YES")
        ("REBOOT={0}" -f "ReallySuppress")
        ('DN="{0}"' -f "AAUGUSTOx")
        "/qn"        
        ('/lv* "{0}"' -f $arquivoLog)
    )

    Write-Host "##[warning] Instalando" 
    Write-Host "##[warning] Log:" $arquivoLog
    #Start-Process "msiexec" -ArgumentList $parametros -Wait

    if ((Achou24x7)){
        Write-Host "##[warning] Instalado comsucesso"
    } else {
        Write-Host "##[error] Não foi possível instalar analisar arquivo de log"
        Write-Host "##[error] $arquivoLog"
    } 
} Catch {
    Write-Host "##[error] $_.Exception"
}