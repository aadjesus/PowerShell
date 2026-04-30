cls

$basePath = "c:\azagent\A1\_work"
$origem   = "c:\Praxio\GlobusWeb\GlobusWeb.Setup\DLLs\Oracle.ManagedDataAccess.dll"
$destino  = "$basePath\_GlobusWeb\DLLs"

if (-not (Test-Path "$destino\Oracle.ManagedDataAccess.dll")) {
    New-Item -Path $destino -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
    Copy-Item $origem -Destination $destino -ErrorAction SilentlyContinue    
}

$Env:AGENT_WORKFOLDER = $basePath
$Env:PATH_DESTINO     = "c:\Servers\GlobusWeb"
$Env:IGNORAR_CONEXAO_BANCO = 11
$Env:IGNORAR_VALIDAR_SISTEMA = 21

C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\ValidarSistemaLiberado.ps1 -sistema 'manutencao'