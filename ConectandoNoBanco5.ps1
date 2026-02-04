cls


try {

    Add-Type -Path 'c:\Praxio\GlobusWeb.Setup\OracleSelectToJson\bin\Debug\net8.0\System.Data.OracleClient.dll'    
    
    $connection = New-Object System.Data.OracleClient.OracleConnection('Data Source=ORA19C;User Id=MOBIBRASIL220525;Password=MOBIBRASIL220525;')    
    $connection.Open()

    $command = $connection.CreateCommand()
    $command.CommandText = "SELECT * FROM dual"
    $ok = $command.ExecuteNonQuery()
    $ok

    Write-Host "Conexão executada com sucesso."

} catch {
    Write-Error "Não foi possível conectar no banco de dados."
    Write-Error $_.Exception.Message
} finally {
    if ($connection.State -eq 'Open') {
        $connection.Close()
    }
}  
