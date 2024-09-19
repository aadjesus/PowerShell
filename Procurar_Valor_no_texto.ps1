clear
$x1 = "refactor: Teste build tag _RecriarBanco_ #0 RC10";
$x2 = "asdasd developasdas ";

 if ($x1 -match '_RECRIARBANCO_'  -and
     $x2 -match 'develop'
     
     
     )
    {
         Write-Host "sssss";
    }

$x1 -match 'RC(?<NumeroMigration>\d*)'

$Matches

if ($Matches.NumeroMigration -ge 1)
{
    Write-Host "wwwwww";
}

#------------------------

try 
{     
    if ($Env:Build_SourceVersionMessage -match 'RC(?<NumeroMigration>\d*)' -and
        $Env:Build_SourceBranchName       -match 'develop')
    {
        $nomeArquivo = "RC"+ $Matches.NumeroMigration +".txt";  
        $pathArquivo  = $Env:build_artifactstagingdirectory + "\" + $Env:Build_DefinitionName + ".Infra.Migrations\" + $nomeArquivo  
         
        New-Item -Path "$pathArquivo" -ItemType File -Force
         
        if (($pathArquivo | Test-Path)) {
            Write-Host "Arquivo $nomeArquivo  gerado com sucesso."
        } 
    }    
}  
catch [Exception] 
{
   Write-Host "Não foi possível gerar o arquivo."
}


