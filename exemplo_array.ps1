clear;
Write-Host '';
Write-Host 'Schemas para integracao';
$schemaGlobus = Read-Host("Schema Globus"); 

$arrayInput = @();
Write-Host '';
Write-Host 'Schemas adicionais';
do {
    $nome = Read-Host("Nome"); 
    $valor = Read-Host("Valor");
    if ($nome -ne '' -and $valor -ne '') {
        $arrayInput += $nome +' - '+ $valor;
    }
    Write-Host '';
}
until ($nome -eq '' -or $valor -eq '');

$arrayInput;