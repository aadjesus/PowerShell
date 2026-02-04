Import-Module WebAdministration
#Dev
#$projeto = "Plantao";
#$porta = "92";
#$diragente = 'c:\azagent\a1\_work\_temp\';
#Producao

$nomeProjeto = $Env:Release_DefinitionName.Split('.') | Select -Last 1;
$porta = '$(PORTA)';
$dirAgente = '$(System.DefaultWorkingDirectory)';

$drive = $((Get-Item $dirAgente).PSDrive.Name + ":");
$raiz = $(($drive) + "\Praxio\");
$appSite = Test-Path $('iis:\Sites\' + ($nomeProjeto)) -PathType Any;
$appPool = Test-Path $('iis:\AppPools\' + ($nomeProjeto)) -PathType Any;
$appDiretorio = Test-Path $(($raiz) + ($nomeProjeto)) -PathType Any;

if($appDiretorio -eq $false){
    New-Item -Path $(($raiz)) -Name $(($nomeProjeto)) -ItemType "directory";
}

if($appSite -eq $false){
    New-Item $('iis:\Sites\' + ($nomeProjeto)) -bindings @{protocol="http";bindingInformation=$('*:' + ($porta) + ':')} -physicalPath $(($raiz) + ($nomeProjeto));
    New-Item $('iis:\Sites\' + ($nomeProjeto) + '\$(APLICACAO)') -physicalPath $(($raiz) + ($nomeProjeto) + '\$(APLICACAO)') -type Application;
}

if($appPool -eq $false){
    New-WebAppPool $(($nomeProjeto));
    Set-ItemProperty $('iis:\appPools\' + ($nomeProjeto)) managedRuntimeVersion "";
}