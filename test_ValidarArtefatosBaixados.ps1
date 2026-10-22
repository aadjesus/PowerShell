cls

$Env:AGENT_NAME          = ""
$Env:AGENT_TEMPDIRECTORY = "c:\tmp"

$Env:RELEASE_ARTIFACTS_GLOBUSWEB_TESTE_FRONT_END_EXECUTAR_TASK  = "SIM"
$Env:RELEASE_ARTIFACTS_GLOBUSWEB_TESTE_FRONT_END_BUILDNUMBER    = "xxxxx"
$Env:RELEASE_ARTIFACTS_GLOBUSWEB_TESTE_FRONT_END_DEFINITIONNAME = "aaaaaaa.bbbb.cccccc"


C:\Users\alessandro.augusto\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\ValidarArtefatosBaixados.ps1

#  Procurar artefatos baixados
#  RELEASE_ARTIFACTS_GLOBUSWEB_TESTE_FRONT_END_DEFINITIONNAME: aaaaaaa.bbbb.cccccc
#  Artefato: c:\tmp\aaaaaaa.bbbb.cccccc\drop\*End.zip
#  Arquivo não encontrado
#  ##vso[task.setvariable variable=RELEASE_ARTIFACTS_GLOBUSWEB_TESTE_FRONT_END_EXECUTAR_TASK]NAO
#  
#  PS C:\Windows\system32> 

#  Procurar artefatos baixados
#  Artefato: c:\tmp\aaaaaaa.bbbb.cccccc\drop\*End.zip
#  Arquivo não encontrado
#  ##vso[task.setvariable variable=RELEASE_ARTIFACTS_GLOBUSWEB_TESTE_FRONT_END_EXECUTAR_TASK]NAO
#  PS C:\Windows\system32> 