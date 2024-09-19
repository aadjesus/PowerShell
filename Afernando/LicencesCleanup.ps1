$configFiles = Get-ChildItem . *.licx -rec
foreach ($file in $configFiles)
{
	sp $file.PSPath IsReadOnly $false
    Clear-Content $file.PSPath
}