clear

$numOfArgs = $args.Length
ForEach ($itemArg in $args)
{
   
   $valor = $itemArg.ToUpper()
   $valor = $valor+"$($env:AGENT_MACHINENAME)"
   #$valor = (Get-item env:$connectionString).Value

   Write-Host $valor
   #Write-Output ('##vso[task.setvariable variable=CONNECTION_STRING]{0}' -f $valor)

}
