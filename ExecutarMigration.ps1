$diretorio = '$(SystemDrive)\Praxio\$(Modulo)\Migration'
$database = $diretorio+ '\$(Projeto).Infra.Database.exe'

ExecutarMigration;

function ExecutarMigration() {
    $processStartInfo = New-Object System.Diagnostics.ProcessStartInfo
    $processStartInfo.FileName = $database
    $processStartInfo.RedirectStandardError = $true
    $processStartInfo.RedirectStandardOutput = $true
    $processStartInfo.UseShellExecute = $false
    $processStartInfo.CreateNoWindow = $false
    
    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $processStartInfo
    $process.Start() | Out-Null
    
    $exception = $false;
    while (!$process.StandardOutput.EndOfStream) {    
        $linha = $process.StandardOutput.ReadLine()
        if ($linha.Contains("Exception")){
            $exception = $true;
        }
        Write-Host $linha
    }
    
    Write-Host 'Excluindo migration'
    Remove-Item –path $diretorio -Recurse -Force
    if ($exception) {
        throw
    }
}
