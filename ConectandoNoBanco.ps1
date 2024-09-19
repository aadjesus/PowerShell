clear
Add-Type -Path c:\Praxio\GPS\Api\Oracle.ManagedDataAccess.dll

$tnsName     = Read-Host("tnsName")
$host1       = Read-Host("Host")
$port        = Read-Host("Port")
$serviceName = Read-Host("Service Name")
$userId      = Read-Host("User Id")
$password    = Read-Host("Password")


$tnsName          = 'ora11g64';
$host1            = '172.16.0.19';
$port             = '1521';
$serviceName      = 'ORACLE';
$Global:userId    = 'PLANTAOHOMOLOGACAO';
$Global:password  = 'PLANTAOHOMOLOGACAO';

Write-Host 'Teste  Oracle.ManagedDataAccess.Client'
$connection = New-Object Oracle.ManagedDataAccess.Client.OracleConnection(
    [string]::Format(
    "User Id={0};Password={1};Data Source={2}:{3}/{4}",
    $userId,
    $password,
    $host1,
    $port,
    $serviceName))
$connection.open()
$command=$connection.CreateCommand()
$command.CommandText = "SELECT * FROM dba_Users WHERE username LIKE 'ESCALA%'"
$reader=$command.ExecuteReader()

while ($reader.Read()) {
    $reader[0]
}
$connection.Close()

Write-Host ''
Write-Host ''
Write-Host 'Teste  System.Data.OleDb'
$connection = New-Object System.Data.OleDb.OleDbConnection('Provider=OraOLEDB.Oracle.1;Data Source=ora11g64; Persist Security Info=True;User ID=PLANTAOHOMOLOGACAO;Password=PLANTAOHOMOLOGACAO;');
$connection.open()
$command=$connection.CreateCommand()
$command.CommandText = "SELECT * FROM dba_Users WHERE  username LIKE 'ESCALA%'"
$reader=$command.ExecuteReader()
while ($reader.Read()) {
    $reader[0]
}
$connection.Close()
