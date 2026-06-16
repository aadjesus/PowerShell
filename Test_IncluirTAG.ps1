cls


$ENV:SYSTEM_TEAMFOUNDATIONSERVERURI = "https://vsrm.dev.azure.com/praxio/"
$ENV:SYSTEM_TEAMPROJECT             = "Desenvolvimento"
$Env:RELEASE_RELEASEID              = "88805"
#$Env:TAG_BRANCH                     = "breno.rocha" 
$Env:GLOBUSWEB_MACHINENAME       = "alessandro.augusto, aaaaa, bbbb"
$Env:SYSTEM_ACCESSTOKEN             = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")


& "$($Env:GLOBUSWEB_DEV_PATH)\GlobusWeb.Setup\Scripts\IncluirTAG.ps1"
