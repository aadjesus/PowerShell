cls
$totalItens = 50
$contador = 0

# Posições fixas para os textos
$linhaTexto1 = [Console]::CursorTop + 7
$linhaTexto2 = [Console]::CursorTop + 8

for ($i = 1; $i -le $totalItens; $i++) {
    $contador++
    $porcentagem = [int](($contador / $totalItens) * 100)
    Write-Progress -Activity "Clonando repositórios" -Status "'Projeto-$i'" -PercentComplete $porcentagem
    Start-Sleep -Milliseconds 50

    # Salvar a posição atual do cursor
    $cursorTop = [Console]::CursorTop

    $linha =  7
    [Console]::SetCursorPosition(0, $linha)
    Write-Host "Testo 1"    
    [Console]::SetCursorPosition(0, ++$linha)
    Write-Host "Testo 2"    

    [Console]::SetCursorPosition(0, $cursorTop)
}

Write-Progress -Activity "Clonando repositórios" -Status "Concluído!" -PercentComplete 100 -Completed

# Limpar as linhas dos textos após conclusão
[Console]::SetCursorPosition(0, $linhaTexto1)
Write-Host (" " * [Console]::WindowWidth)
[Console]::SetCursorPosition(0, $linhaTexto2)
Write-Host (" " * [Console]::WindowWidth)
[Console]::SetCursorPosition(0, $linhaTexto2 + 1)