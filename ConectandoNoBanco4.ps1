cls
try {
    Add-Type -Path "c:\azagent\A1\_work\_globusweb\_temp\DLLs\Oracle.ManagedDataAccess.dll"    
    #Add-Type -Path "c:\azagent\A1\_work\_globusweb\_temp\ValidarConexaoBanco\System.Data.OracleClient.dll"
    

    $connectionStrings = "Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=172.16.0.5)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=ORCL)));User ID=PICCOLOTUR220522;Password=PICCOLOTUR220522;"
    $connectionStrings = "Data Source=172.16.0.5:1521/ORCL;User ID=PICCOLOTUR220522;Password=PICCOLOTUR220522"

    $connection = New-Object Oracle.ManagedDataAccess.Client.OracleConnection($connectionStrings)    
    $connection.Open()

    $command = $connection.CreateCommand()
    $command.CommandText = "SELECT * FROM dual"
    $ok = $command.ExecuteNonQuery()

    Write-Host "Conexão executada com sucesso."

} catch {
    Write-Error "Não foi possível conectar no banco de dados."
    Write-Error $_.Exception.Message
} finally {
    if ($connection.State -eq 'Open') {
        $connection.Close()
    }
}  
