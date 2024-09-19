Clear

$projetos =  [ordered]@{}
$projetos.Add('0.Sair      ','Sair')
$projetos.Add('1.Escala    ','Escala')
$projetos.Add('2.Plantão   ','Plantao')
$projetos.Add('3.Gps       ','Gps')
$projetos.Add('4.Analytics ','Analytics')
$projetos.Add('5.Folga     ','Folga')

function Menu-Projetos
{
    cls
    Write-Host "================ Projetos ================"
    
    clear
    foreach ($i in $projetos.GetEnumerator()) {
        Write-Host "$($i.Name)"
    }     
}

$projeto = '';
do
{
    Menu-Projetos
    Write-Host ''
    $input = Read-Host "Informe o número projeto"
    $projeto = $projetos[[int]$input];
    if ($input -eq 0 -or $projetos.Values -contains $projeto){
        Write-Host $projeto
        return
    }     
    else {
        Write-Host "Projeto não cadastrado"
        pause
    }
}
until ($input -eq 'q')


Write-Host '================ Configuração TNS ================';
$vHost        = Read-Host("Host")
$vPort        = Read-Host("Port")
$vServiceName = Read-Host("Service Name")
Write-Host ''
Write-Host 'Configuração login';
$vUserId      = Read-Host("User Name")
$vPassword    = Read-Host("Password")

$vConnection = [string]::Format(
    "User Id={0};Password={1};Data Source={2}:{3}/{4}",
    $vUserId,
    $vPassword,
    $vHost,
    $vPort,
    $vServiceName);

$vConnection = [System.Convert]::ToBase64String(
               [System.Text.UTF8Encoding]::UTF8.GetBytes($vConnection));		


$schemas = '';
Write-Host '';
Write-Host 'Informe o(s) schema(s)';
do {
    $nome = Read-Host("Nome schema"); 
    $valor = Read-Host("Valor");
    if ($nome -ne '' -and $valor -ne '') {       
        if ($schemas.Length -ge 1) {
            $schemas += ','
        }
        $schemas += '"' + $nome +'": "'+  $valor +'"'
    }    
} 
until ($nome -eq '' -or $valor -eq '');
$schemas = '''[{'+$schemas + '}]''';


Write-Host 'Configuração WebSite';
$vPorta        = Read-Host("Porta")