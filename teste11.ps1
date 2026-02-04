cls

$base = "$ENV:SystemDrive\Praxio\GlobusWeb"
$pathDestino = Read-Host "Informe o diretório base. (ENTER = $($base))"
if ([string]::IsNullOrEmpty($pathDestino)) {
    $pathDestino = $base
}

try {
    $driver = Split-Path -Path $pathDestino -Qualifier -ErrorAction Stop
}
catch {
    $pathDestino = "$($ENV:SystemDrive)\$($pathDestino)";
}


$pathDestino = "$($pathDestino)";
Write-Host "Destino: $pathDestino";

$resposta = Read-Host -Prompt "Pressione (S|ENTER) para confirmar";
if (-not ($resposta -match "^(S|s)?$")) {
    Write-Host "`nOperação cancelada."
    Exit 1
}



Write-Host $pathDestino