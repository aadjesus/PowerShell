$ori = "\\dc01\build\_OUTROS_\SIM_64495_BCO\_OUTROS__20170105.25\";
$dest = "C:\_OUTROS_SS\";

$diretorios = Get-ChildItem -Force $ori;

ForEach($item in $diretorios)
  {
     echo $("Copiando " + $ori+$item +" ...");
     Copy-Item -Path $ori$item -Destination $dest -Recurse -Force;

  }

echo $("Fim...");