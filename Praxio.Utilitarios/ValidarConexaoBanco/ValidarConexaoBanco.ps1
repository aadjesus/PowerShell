param (
    [string]$connectionStrings
)

if ([string]::IsNullOrEmpty($connectionStrings)) {
    Write-Host "ConnectionStrings não informada."
    exit 1
}

try {
    $dllPath = Join-Path -Path $PSScriptRoot -ChildPath "Oracle.ManagedDataAccess.dll"    
    Add-Type -Path $dllPath
    
    $connection = New-Object Oracle.ManagedDataAccess.Client.OracleConnection($connectionStrings)    
    $connection.Open()

    $command = $connection.CreateCommand()
    $command.CommandText = "Select * from Dual"    
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
