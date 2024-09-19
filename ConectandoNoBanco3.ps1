clear
Add-Type -Path 'c:\Users\Alessandro.Augusto\Box Sync\Aplicativos\PowerShell\Oracle\Oracle.ManagedDataAccess.dll'
try {
    
    $connectionStrings = 'Data Source=172.16.0.11:1521/ORACLE;Persist Security Info=True;User ID=MOBIBRASIL220525 ;Password=MOBIBRASIL220525'
    $connection        = New-Object Oracle.ManagedDataAccess.Client.OracleConnection($connectionStrings)
    
    
    $connection.open()
    $command             = $connection.CreateCommand()
    $command.CommandText = "
        begin 
            -- Criando Usuário
            CREATE USER WEB_ACD_MG IDENTIFIED BY WEB_ACD_MG;

            -- Criando Grant
            GRANT UNLIMITED TABLESPACE
                , GRANT ANY PRIVILEGE
                , CONNECT
                , CREATE USER
                , CREATE SESSION
                , CREATE TRIGGER 
                , CREATE SEQUENCE 
                , CREATE PROCEDURE 
                , CREATE TABLE
                , CREATE SYNONYM 
                , SELECT ANY SEQUENCE
                , SELECT ANY TABLE
                , INSERT ANY TABLE
                , UPDATE ANY TABLE
                , DELETE ANY TABLE
               TO WEB_ACD_MG;


        End;"

    $command.ExecuteNonQuery()
    
    $reader    

} catch {
    Write-Error $_.Exception
}