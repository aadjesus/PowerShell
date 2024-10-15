
 function AspackFiles($path)
{
  $arquivos = Get-ChildItem $path\*.exe -recurse |Select FullName

  foreach ($a in $arquivos) {
    ExecutaAspack($a.FullName)
  }   

} 


function ExecutaAspack($file)
{

	$AspackDir = "C:\Program Files (x86)\ASPack"
	
    $pinfo = New-Object System.Diagnostics.ProcessStartInfo
    $pinfo.WorkingDirectory = "$AspackDir\"
    $pinfo.FileName = "$AspackDir\ASPack.exe"
    $pinfo.RedirectStandardError = $true
    $pinfo.RedirectStandardOutput = $true
    $pinfo.UseShellExecute = $false
    $pinfo.Arguments = """$file"" /U /B- /S"
    $p = New-Object System.Diagnostics.Process
    $p.StartInfo = $pinfo
    $p.Start() | Out-Null

    $stdout = $p.StandardOutput.ReadToEnd()
    $stderr = $p.StandardError.ReadToEnd()
    $now=Get-Date -format "dd-MM-yyyy HH:mm:ss"  
		
    Write-Host "$now - Compactação (ASPack) $file concluida !"
     
}
 

 AspackFiles("C:\_OUTROS_EMP_\_OUTROS_Mais\src\WPF\Distribuicao")
