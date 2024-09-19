clear

$arquivo = 'c:\Praxio\AmbienteDev\versoes.json' 

if (-not(Test-Path -Path $arquivo)) {
    $json = @{} | ConvertTo-Json
    $json | Set-Content -Path $arquivo    
}

$json = Get-Content -Path $arquivo -Force | ConvertFrom-Json

$versao = $json.aa1

Write-Host $json.'aa1'


if ($versao -eq $null) {
    Write-Host 'nao existe'
    $versao = 'aa1'
    $json | Add-Member -Name $versao -Type NoteProperty -Value 1
} else {
    $json.'aa1' = 'qqqqqqqqqqqqqqqqqq'
    Write-Host 'existe'
}

$json | ConvertTo-Json | Set-Content $arquivo