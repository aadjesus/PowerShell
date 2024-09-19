param (
    [string]$ProjectName="Acidentes.dpr",
    [string]$ProjectDir="C:\TFSAgent\_work\7\s\Globus\Sistemas\Acidentes",
    [string]$ReleaseDir = "C:\TFSAgent\_work\7\a\Sistemas\Acidentes"
 )



#function BuildProjeto 
#{
    Set-Location $ProjectDir 

    New-Item $ReleaseDir -type directory -force > $null
    dcc32 $Env:BgmRodotec_BuildOptions $ProjectName -I"$Env:BgmRodotec_IncludeDir"  -U"$Env:BgmRodotec_LibDir"  -E"$ReleaseDir"

    throw "Ocorreu um erro ao compilar o projeto $ProjectDir . Verifique o log para maiores informações"
#}

#BuildProjeto