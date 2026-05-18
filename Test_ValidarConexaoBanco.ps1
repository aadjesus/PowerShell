cls

$basePath = "c:\azagent\A1\_work"
$origem   = "c:\Praxio\GlobusWeb\GlobusWeb.Setup\DLLs\*"
$destino  = "$basePath\_GlobusWeb\DLLs"

if (-not (Test-Path "$destino\Oracle.ManagedDataAccess.dll")) { 
    New-Item -Path $destino -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
    Copy-Item $origem -Destination $destino -ErrorAction SilentlyContinue
    
}

$Env:PATH_DESTINO = "c:\Servers\GlobusWeb\"
$Env:AGENT_NAME = "TESTE_123"

$Env:TESTE_123_IGNORAR_CONEXAO_BANCO           = 0
$Env:IGNORAR_CONEXAO_BANCO           = $true1


$Env:IGNORAR_ATUALIZACAO_AUTOMATICA  = $true1

C:\Praxio\GlobusWeb\GlobusWeb.Setup\Scripts\ValidarConexaoBanco.ps1