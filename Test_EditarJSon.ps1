cls
#$arquivo = "c:\Praxio\GlobusWeb\GlobusWeb.Abastecimento\package - Copia.json"
#C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\EditarJSon.ps1 -arquivo $arquivo -chave scripts -valor @{}


#$Env:AGENT_WORKFOLDER = 'c:\azagent\A1\_work'
#$Env:PATH_BASE        = 'Servers\GlobusWeb'
#& 'C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\LerGlobusWebConfigJson.ps1'
#$arquivo = 'c:\Praxio\AmbienteDev\GlobusWeb\acidentes\GlobusWeb.config.json'
#C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\EditarJSon.ps1 -arquivo $arquivo -chave scripts -valor @{"url"= "$($Env:GATEWAY_EXTERNALURL)";"prefix"= "$($Env:GLOBAL_PREFIX)/gateway/Api";"porta"= "$($Env:GATEWAY_PORTA)"}

$arquivo = "c:\Servers\GlobusWeb\GlobusWeb.Config.json"

C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\EditarJSon.ps1 -arquivo $arquivo -chave versoes -valor @{"x2"="aaaa---x2"}



