cls

$Env:BUILD_SOURCEBRANCHNAME         = "master"
$Env:BUILD_SOURCEBRANCHNAME         = "develop"
$Env:SYSTEM_TASKDEFINITIONSURI      = "https://dev.azure.com/praxio/"
$Env:SYSTEM_TEAMPROJECT             = "f7e1f0f0-eca6-49ed-89c4-b580797f7a63"
$Env:BUILD_BUILDNUMBER              = "aaaaaa-20260727-$($Env:BUILD_SOURCEBRANCHNAME)"
$Env:AGENT_WORKFOLDER               = "c:\azagent\A1\_work\_praxio"

$Env:SYSTEM_TEAMFOUNDATIONSERVERURI = "https://vsrm.dev.azure.com/praxio/"


#$Env:SYSTEM_ACCESSTOKEN             = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$Env:GLOBUSWEB_PAT                  = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$Env:SYSTEM_TEAMPROJECTID           = "Desenvolvimento"
$Env:RELEASE_ENVIRONMENTNAME        = "QA"
$Env:RELEASE_RELEASEID              = "88856"
$Env:RELEASE_ENVIRONMENTID          = "127455"

$Env:RELEASE_RELEASEID              = "89378"
$Env:RELEASE_ENVIRONMENTID          = "129168"

$Env:RELEASE_RELEASEID                = 90113
$Env:RELEASE_ENVIRONMENTID            = 131273

#$Env:RELEASE_RELEASEID                = 90042
#$Env:RELEASE_ENVIRONMENTID            = 131100


$Env:IGNORAR_VALIDAR_BRANCH   = $true1
$Env:ID_DEPLOYMENT_GROUP      = 817

$Env:SYSTEM_PIPELINESTARTTIME = '2026-07-25 11:48:40-03:00'


& 'c:\Users\alessandro.augusto\Praxio\Praxio.Tools.Deploy\Modules\pre-release\ValidarBranch.ps1'

#& 'c:\Users\alessandro.augusto\Praxio\Praxio.Tools.Deploy\Modules\pre-release\ObterMachineName.ps1'

$Env:RUNTIME_JSONPIPELINES = $null
& 'c:\Users\alessandro.augusto\Praxio\Praxio.Tools.Deploy\Modules\pre-release\ObterPipelines.ps1' -tags "GlobusWeb,develop" #$($Env:RUNTIME_BRANCHORIGIN)

#& 'c:\Users\alessandro.augusto\Praxio\Praxio.Tools.Deploy\Modules\pre-release\VerificaVersoesInstaladas.ps1'