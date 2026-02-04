Write-Host 'Procurando Migration.EXE'
$arqivoDatabase  = Get-ChildItem $(System.DefaultWorkingDirectory)/Migrations -Filter *.Infra.Migrations.exe
if ($arqivoDatabase -eq $null) {
    Write-Host "##vso[task.logissue type=error;]Migration.EXE não encontrado"
    throw
}

Write-Host 'Executando: '$arqivoDatabase.FullName
$processStartInfo = New-Object System.Diagnostics.ProcessStartInfo
$processStartInfo.FileName = $arqivoDatabase.FullName
$processStartInfo.RedirectStandardError = $true
$processStartInfo.RedirectStandardOutput = $true
$processStartInfo.UseShellExecute = $false
$processStartInfo.CreateNoWindow = $false
$processStartInfo.WorkingDirectory = $arqivoDatabase.Directory 
$process = New-Object System.Diagnostics.Process
$process.StartInfo = $processStartInfo
$process.Start() | Out-Null

while (!$process.StandardOutput.EndOfStream) {    
    $linha = $process.StandardOutput.ReadLine()
    if ($linha.Contains("ERRO Migration")){
         Write-Host "##vso[task.logissue type=error;]$linha"
          throw
    }
    else {
          Write-Host $linha
     }
}