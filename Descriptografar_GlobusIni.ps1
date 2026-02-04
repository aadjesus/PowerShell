function Descriptografar($valor) {
    
    $valor   = $valor.Trim()
    $retorno = ''
    $coluna  = 1
    $posicao = 0

    while ($posicao + 3 -le $valor.Length) {
        $substring = $valor.Substring($posicao, 3)
        $caracter  = [int]::Parse($substring) - $coluna
        $retorno  += [char]$caracter

        $posicao += 4
        $coluna ++
        if ($coluna -gt 744) { 
            $coluna = 1 
        }
    }

    return $retorno
}

$caminhoArquivo = 'c:\Globus\GLOBUS.INI'
if (-not (Test-Path $caminhoArquivo)) {
    Write-Host 'Arquivo não encontrado: $caminhoArquivo'
    exit
}

$linhasCriptografadas = Get-Content -Path $caminhoArquivo

$resultados = @()

foreach ($linha in $linhasCriptografadas) {
    if ([string]::IsNullOrWhiteSpace($linha)) {
        continue
    }

    $resultados += Descriptografar($linha)
}

clear
Write-Host $resultados[0]
Write-Host $resultados[1]
Write-Host $resultados[2]
Write-Host $resultados
