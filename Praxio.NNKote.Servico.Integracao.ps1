clear
#Get-ChildItem \\prox-hyperv -ErrorAction Stop
$service = Get-Service -Name 'Praxio.NNKote.Servico.Integracao'

$service
if ($service -ne $null) { 
    # & "c:\Praxio\Praxio.NNKote.Servico.Integracao\src\Praxio.NNKote.Servico\bin\Debug\netcoreapp3.1\BgmRodotec.Globus.Compras.NnKote.exe uninstall"         
    & "c:\tmp\a\BgmRodotec.Globus.Compras.NnKote.exe uninstall"
    #sc.exe delete $service    
}

$service = Get-Service $nome -ErrorAction SilentlyContinue 
if ($service.Status -eq 'Stopped') { 
  
}

