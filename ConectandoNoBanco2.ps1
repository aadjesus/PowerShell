clear

Write-Host '';
Write-Host 'Configuração do banco de dados';

#$Global:tnsName   = Read-Host("Tns Name")
#$host1            = Read-Host("Host")
#$port             = Read-Host("Port")
#$serviceName      = Read-Host("Service Name")
#$Global:userId    = Read-Host("User Id")
#$Global:password  = Read-Host("Password")
#Write-Host '';
#Write-Host 'Schemas para integracao';
#$Global:schemaGlobus = Read-Host("Globus"); 
#$Global:gps          = Read-Host("Gps"); 

$tnsName             = 'ora11g64';
$host1               = '172.16.0.19';
$port                = '1521';
$serviceName         = 'ORACLE';
$Global:userId       = 'PLANTAOHOMOLOGACAO';
$Global:password     = 'PLANTAOHOMOLOGACAO';
$Global:schemaGlobus = 'GLOBUS';
$Global:gps          = 'GPS';

$arquivo = 'c:\azagent\A1\appsettings.json';
if ((Test-Path $arquivo))
{
}

$dataSource = [string]::Format('{0}:{1}/{2}',$host1,$port,$serviceName);
if ((TestarConnection $dataSource) -or 
    (TestarConnection $dataSource 'Provider=OraOLEDB.Oracle.1;') -or 
    (TestarConnection $tnsName) -or
    (TestarConnection $tnsName 'Provider=OraOLEDB.Oracle.1;')) {
    Write-Host 'Teste de conexão concluído com êxito.';
} 
else {
    Write-Host 'Falha no teste de conexão devido a um erro na inicialização do provedor. ORA-01017: senha/nome do usuário inválido; log-on negado';
}

Function TestarConnection([string]$dataSource, [string]$provider) {
    Try
    {
        $connectionString = [string]::Format(
            "{0}User Id={1};Password={2};Data Source={3}",
            $provider,
            $userId, 
            $password,
            $dataSource);

        $connection = New-Object System.Data.OleDb.OleDbConnection($connectionString);
        $connection.open();
        $command=$connection.CreateCommand();
        $command.CommandText = "SELECT * FROM dba_Users WHERE username IN ('"+$schemaGlobus+"','"+$gps+"')";
        $reader=$command.ExecuteReader();
        while ($reader.Read()) {           
           Write-Host $reader[0];
        }
        $connection.Close();

        return $true;
    }
    Catch
    {
        return $false;
    }
}