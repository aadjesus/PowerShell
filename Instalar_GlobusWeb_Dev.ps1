cls;
$ErrorActionPreference="Stop";
If(-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent() ).IsInRole( [Security.Principal.WindowsBuiltInRole] "Administrator")){ 
	throw "Executar comando em um prompt de administrador do PowerShell"
};

If($PSVersionTable.PSVersion -lt (New-Object System.Version("3.0"))) { 
	throw "A versão mínima do Windows PowerShell exigida pelo script (3.0) não corresponde à versão atualmente em execução do Windows PowerShell."
};

Write-Host "  ____ _       _             __        __   _      ";
Write-Host " / ___| | ___ | |__  _   _ __\ \      / /__| |__   ";
Write-Host "| |  _| |/ _ \| '_ \| | | / __\ \ /\ / / _ \ '_ \  ";
Write-Host "| |_| | | (_) | |_) | |_| \__ \\ V  V /  __/ |_) | ";
Write-Host " \____|_|\___/|_.__/ \__,_|___/ \_/\_/ \___|_.__/ ©";
Write-Host ""
Write-Host "Instalação do ambiente GlobusWeb para o desenvolvimento.";

$pathBase = Read-Host "Digite o diretorio base (ex: Praxio)";
$destino  = "$($ENV:SystemDrive)\$($pathBase)\GlobusWeb";
Write-Host "Destino: $destino";

$resposta = Read-Host -Prompt "Confirmar (S|ENTER)?";

if (-not ($resposta -match "^(S|s)?$")) {
    throw "Processo cancelado."
}

$pat = Read-Host "Digite PAT";

if (-not (Test-Path -Path $destino)) {
    New-Item -Path $destino -ItemType Directory | Out-Null;
}
