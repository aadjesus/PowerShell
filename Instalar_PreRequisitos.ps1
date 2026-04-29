# Caminho temporário
$TempDir = "C:\Temp"
if (!(Test-Path $TempDir)) {
    New-Item -ItemType Directory -Force -Path $TempDir | Out-Null
}

Write-Host "🔍 Verificando módulos do IIS..." -ForegroundColor Cyan

# Função auxiliar para verificar se módulo está instalado
function Is-ModuleInstalled($moduleName) {
    try {
        $module = Get-WebGlobalModule | Where-Object { $_.Name -eq $moduleName }
        return $null -ne $module
    } catch {
        return $false
    }
}

# --- Verificar URL Rewrite ---
$rewriteInstalled = Is-ModuleInstalled "RewriteModule"

if ($rewriteInstalled) {
    Write-Host "✅ URL Rewrite já está instalado." -ForegroundColor Green
} else {
    Write-Host "⬇️ Instalando URL Rewrite..." -ForegroundColor Yellow

    $rewriteMsi = "$TempDir\rewrite_amd64.msi"
    if (!(Test-Path $rewriteMsi)) {
        Invoke-WebRequest -Uri "https://download.microsoft.com/download/D/D/9/DD9C11E3-60C3-4D48-9F94-7C0A28F87A56/rewrite_amd64_en-US.msi" -OutFile $rewriteMsi
    }

    Start-Process msiexec.exe -Wait -ArgumentList "/i `"$rewriteMsi`" /quiet /norestart"
    Write-Host "✅ URL Rewrite instalado com sucesso." -ForegroundColor Green
}

# --- Verificar IISNode ---
$iisnodeInstalled = Is-ModuleInstalled "iisnode"

if ($iisnodeInstalled) {
    Write-Host "✅ IISNode já está instalado." -ForegroundColor Green
} else {
    Write-Host "⬇️ Instalando IISNode..." -ForegroundColor Yellow

    $iisnodeMsi = "$TempDir\iisnode.msi"
    if (!(Test-Path $iisnodeMsi)) {
        Invoke-WebRequest -Uri "https://github.com/Azure/iisnode/releases/download/v0.2.21/iisnode-full-v0.2.21-x64.msi" -OutFile $iisnodeMsi
    }

    Start-Process msiexec.exe -Wait -ArgumentList "/i `"$iisnodeMsi`" /quiet /norestart"
    Write-Host "✅ IISNode instalado com sucesso." -ForegroundColor Green

    # Reinicia o IIS para aplicar as configurações
    Write-Host "🔄 Reiniciando IIS..." -ForegroundColor Cyan
    iisreset | Out-Null
    Write-Host "✅ IIS reiniciado com sucesso." -ForegroundColor Green
}
