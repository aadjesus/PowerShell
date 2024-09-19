$diretorio = "D:\BgmRodotec\Globus7\BgmRodotec.Escala\src\BgmRodotec.Escala.Infra\Database\BgmRodotec.Escala.Infra.Database\bin\Debug"
$database = Get-Childitem $diretorio "*.Database.exe"

Write-Host $database.FullName

$processStartInfo = New-Object System.Diagnostics.ProcessStartInfo
$processStartInfo.WorkingDirectory = "$diretorio"
$processStartInfo.FileName = $database.FullName
$processStartInfo.RedirectStandardError = $true
$processStartInfo.RedirectStandardOutput = $true
$processStartInfo.UseShellExecute = $false
$processStartInfo.CreateNoWindow = $false

$process = New-Object System.Diagnostics.Process
$process.StartInfo = $processStartInfo

$exception = $false;
while (!$process.StandardOutput.EndOfStream) {    
    
    $linha = $process.StandardOutput.ReadLine()
    if ($linha.Contains("Exception")){
        $Exception = $true;
    }

    Write-Host $linha
}
$process.Start() | Out-Null

if ($exception) {
    throw
}
