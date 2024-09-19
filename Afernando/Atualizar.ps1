$ori = "\\dc01\build\Globus\SIM_64495_BCO\Globus_20170105.25\";
$dest = "C:\GlobuSSS\";

$diretorios = Get-ChildItem -Force $ori;

ForEach($item in $diretorios)
  {
     echo $("Copiando " + $ori+$item +" ...");
     Copy-Item -Path $ori$item -Destination $dest -Recurse -Force;

  }

echo $("Fim...");