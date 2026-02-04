param (
    [string]$connectionStrings
)


clear

$connectionStrings =  'Data Source=172.16.0.5:1521/ORCL;Persist Security Info=True;User ID=MOBIBRASIL220525;Password=MOBIBRASIL2205251'
if ([string]::IsNullOrEmpty($connectionStrings)) {
    Write-Host "ConnectionStrings não informada."
    exit 1
}


try {
   
    Add-Type -Path 'c:\Users\Alessandro.Augusto\GitHub\PowerShell\Oracle\Oracle.ManagedDataAccess.dll'
    
    $connection = New-Object Oracle.ManagedDataAccess.Client.OracleConnection($connectionStrings)    
    $connection.Open()

    $command = $connection.CreateCommand()
    $command.CommandText = "Select sysdate from Dual"
    $ok = $command.ExecuteNonQuery()
    
    Write-Host "Conexão executada com sucesso."

} catch {
    Write-Host "Não foi possível conectar no banco de dados."
    Write-Error $_.Exception.Message
} finally {
    if ($connection.State -eq 'Open') {
        $connection.Close()
    }
}
    
