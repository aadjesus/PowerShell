$diretorioDeBackup = "C:\Users\antonio.pinheiro\Desktop"
$dtNomeArquivo = Get-Date -format dd-MM-yyyy-H-mm
$nomeArquivo = "C:\Users\antonio.pinheiro\Desktop\Desktop""$($dtNomeArquivo)"".rar"

$compactador = "C:\Program Files\WinRAR\WinRAR.exe"
$compactadorParametros = "a ""$($nomeArquivo)"" ""$($diretorioDeBackup)"" "
$comando = "$($compactador) $($compactadorParametros)"

Write-Host "Executando $($comando) ..."
$ps = new-object System.Diagnostics.Process
$ps.StartInfo.FileName = $compactador
$ps.StartInfo.Arguments = $compactadorParametros
$ps.StartInfo.WorkingDirectory = $diretorioDeBackup
$ps.StartInfo.RedirectStandardOutput = $true
$ps.StartInfo.RedirectStandardError = $true
$ps.StartInfo.UseShellExecute = $false
if ($ps.Start() -eq $true) {
	Write-Host "Processo iniciado em $($ps.StartTime)"
	$ps.WaitForExit()
	Write-Host "Processo finalizado em $($ps.ExitTime)"
	$ps.StandardOutput.ReadToEnd()
	$ps.StandardError.ReadToEnd()
	$exiteCode = $ps.ExitCode 
} else { 
	Write-Host "Erro executando compactador."
} 