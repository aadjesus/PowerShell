#Import-Module WebAdministration
Import-Module -Name 'C:\Windows\System32\WindowsPowerShell\v1.0\Modules\WebAdministration\WebAdministration.psd1'

$projeto = "GPS";
$porta = "93";
#$dirAgente = 'C:\azagent\A1\_work\_temp\';
$dirAgente = '$(System.DefaultWorkingDirectory)';
$drive = $((Get-Item $dirAgente).PSDrive.Name + ":");
$raiz = $($drive + "\Praxio\");
$appSite = Test-Path iis:\Sites\$($projeto) -PathType Any;
$appPool = Test-Path iis:\AppPools\$($projeto) -PathType Any;
$appDiretorio = Test-Path $($raiz + $projeto) -PathType Any;

    if($appDiretorio -eq $false){
        New-Item -Path $($raiz) -Name $($projeto) -ItemType "directory";
    }


    if($appSite -eq $false){
        New-Item iis:\sites\$($projeto) -bindings @{protocol="http";bindingInformation=$('*:' + $porta + ':')} -physicalPath $($raiz + $projeto);
        New-Item iis:\sites\$($projeto)\Api -physicalPath $($raiz + $projeto + '\Api') -type Application;
    }

    if($appPool -eq $false){
        New-WebAppPool $($projeto);
        Set-ItemProperty iis:\appPools\$($projeto) managedRuntimeVersion "";
    }
    
----------------------------------------

##Dev
##$dirAgente = 'C:\azagent\A1\_work\r11\a\';
##$projeto = 'Praxio.GPS';
##$nomeProjeto = 'GPS';
##$drive = 'c:\';
#
##Producao
#$dirAgente = '$(System.DefaultWorkingDirectory)';
#$projeto = 'Praxio.GPS';
#$nomeProjeto = 'GPS';
#$drive = $((Get-Item $dirAgente).PSDrive.Name + ":\");
#
#
##Comum
#$dirDestino = $($drive + 'Praxio\' + $nomeProjeto);
#$dir = $($dirAgente + '\_' + ($projeto) + '\' + ($projeto) + '.Api\' + ($projeto) + '.Api.zip')
#
#write-Host $('Caminho agente ' + ($dir));
#write-Host $('Destino deploy ' + ($dirDestino));
#
#Expand-Archive $dir -DestinationPath $dirDestino
#

