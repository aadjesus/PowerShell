Clear
if ($args[0] -eq $null) {
    Write-Output 'Parametro não informado'
    return 
}

$pathBaseOrigem   = 'c:\Users\AlessandroAugusto\Box Sync\Praxio\AmbienteDev\' +'\'+ $args[0] 
$pathBaseDestinno = "c:\Praxio\AmbienteDev\"
if (-not (Test-Path -Path $pathBaseOrigem)) {
    Write-Output 'Diretorio origem não encontrado'
    return 
}

Get-ChildItem -Path $pathBaseOrigem | ForEach-object { 
    $origem  = $_.FullName + "\*"
    $destino = $pathBaseDestinno + $_.Name

    if ($_.Name -eq "BgmRodotec.NnKote.Api" ){
        $destino = "c:\Praxio\BgmRodotec.NnKote\src\BgmRodotec.NnKote.Api\"
    }
    write-host "Origem: " $origem  
    write-host "Destino: " $destino
    Copy-Item -Path $origem -Destination $destino
}

Get-IISAppPool | Select-Object | where {$_.state -ne "Started"} | Stop-WebAppPool
Get-IISAppPool | Select-Object | where {$_.state -ne "Stopped"} | Start-WebAppPool

