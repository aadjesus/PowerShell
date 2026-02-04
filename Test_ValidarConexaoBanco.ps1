cls

$basePath = "c:\azagent\A1\_work"
$origem   = "c:\Praxio\GlobusWeb\GlobusWeb.Setup\DLLs\Oracle.ManagedDataAccess.dll"
$destino  = "$basePath\_GlobusWeb\DLLs"
if (-not (Test-Path "$destino\Oracle.ManagedDataAccess.dll")) { 
    New-Item -Path $destino -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
    Copy-Item $origem -Destination $destino -ErrorAction SilentlyContinue
    
}



$Env:PATH_DESTINO = "c:\Praxio\GlobusWeb"

$Env:IGNORAR_CONEXAO_BANCO           = $true1
$Env:VALIDAR_ATUALIZACAO_AUTOMATICA  = $true

C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\ValidarConexaoBanco.ps1