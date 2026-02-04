cls
$Env:PATH_DESTINO     = 'c:\Praxio\AmbienteDev\GlobusWeb'
$Env:AGENT_WORKFOLDER = 'c:\azagent\A1\_work'

. (Join-Path $Env:AGENT_WORKFOLDER '\_GlobusWeb\Scripts\Uteis.ps1')

$arquivo = $Env:PATH_DESTINO + '\GlobusWeb.config 5.json'
$json     = Get-Json($arquivo)
$database = $json.databases | Where-Object { $_.env -eq "production" }
if (-not $database) {
    Write-ErroExit("Configuração do para para o ambiente 'production' não encontrado: $arquivo")
}

try {
    Add-Type -Path (Join-Path $Env:AGENT_WORKFOLDER '\_GlobusWeb\DLLs\Oracle.ManagedDataAccess.dll')

    $dbHost        = Get-Descriptografar($database.host)
    $dbUsername    = Get-Descriptografar($database.username)
    $dbPassword    = Get-Descriptografar($database.password)
    $dbServiceName = Get-Descriptografar($database.serviceName)
    $dbPort        = $database.port
    $connectionStrings = "Data Source=$($dbHost):$($dbPort)/$($dbServiceName);User ID=$($dbUsername);Password=$($dbPassword);"    
    Write-Host $connectionStrings
    $connection = New-Object Oracle.ManagedDataAccess.Client.OracleConnection($connectionStrings)    
    $connection.Open()

    $command = $connection.CreateCommand()
    $command.CommandText = "Select * from Dual"    
    $ok = $command.ExecuteNonQuery()

    Write-Host "##[warning]Conexão executada com sucesso."

} catch {
    Write-ErroExit "Não foi possível conectar no banco de dados." -complemento $_
} finally {
    if ($connection.State -eq 'Open') {
        $connection.Close()
    }
}