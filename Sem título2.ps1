cls

if (-not (Test-Path $PROFILE)) {    
    New-Item -ItemType File -Path $PROFILE -Force
    Write-Host "Criando arquivo $($PROFILE)" -ForegroundColor Green
}

$linha = "`nImport-Module 'C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\Uteis.ps1'"

if (-not (Select-String -Path $PROFILE -Pattern "Uteis.ps1" -Quiet)) {
    Add-Content -Path $PROFILE -Value $linha -Encoding UTF8
    Write-Host "Linha adicionada ao perfil: $linha" -ForegroundColor Green
} else {
    Write-Host "Linha já está presente no perfil." -ForegroundColor Yellow
}