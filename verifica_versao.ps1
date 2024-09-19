clear

$nome = 'Praxio.NNKote.Servico.Integracao'
$service = Get-Service $nome -ErrorAction SilentlyContinue 

$service

if ($service -ne $null ) {     
    sc.exe delete $service
}
