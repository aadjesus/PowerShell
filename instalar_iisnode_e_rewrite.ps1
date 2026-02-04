cls
Start-Process msiexec.exe -ArgumentList "/i c:\Praxio\GlobusWeb.Setup\Node\rewritemodule.msi /quiet /norestart" -Wait


cls
$module = Get-WebGlobalModule | Where-Object { $_.Name.ToUpper() -eq 'REWRITEMODULE' }
$module
#iisreset

       #Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*URL Rewrite*" } | Select-Object Name, Version

#$app = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*URL Rewrite*" }
#if ($app) { 
#    $app.Uninstall() 
#} else { 
#    Write-Output "URL Rewrite não encontrado." 
#}
