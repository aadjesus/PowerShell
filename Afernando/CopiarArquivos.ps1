param (

	[string]$destinationPath = "C:\Desktop\Teste\",
	[string]$originPath = "C:\s\src\Globus\"
)

Copy-Item "$originPath\Sistemas\" -filter "*.sql" �destination "$destinationPath\Sistemas\" -recurse -container -force
Copy-Item "$originPath\Sistemas\" -filter "*.rav" �destination "$destinationPath\Sistemas\" -recurse -container -force
Copy-Item "$originPath\Sistemas\" -filter "*.rpt" �destination "$destinationPath\Sistemas\" -recurse -container -force

Copy-Item "$originPath\Clientes\" -filter "*.sql" �destination "$destinationPath\Clientes\" -recurse -container -force

foreach($childItem in (Get-ChildItem $destinationPath -Recurse))
{
    if( ($childItem.PSIsContainer) -and (!(Get-ChildItem -Recurse -Path $childItem.FullName)))
    {
        Remove-Item $childItem.FullName -Confirm:$false
    }
}
