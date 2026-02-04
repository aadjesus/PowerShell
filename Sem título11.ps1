cls
$linhaInicial = 10 # Defina a linha onde o texto será exibido

$totalRepositorio = 10
for ($i = 1; $i -le $totalRepositorio; $i++) {
    $porcentagem = ($i / $totalRepositorio) * 100
    
    # Move o cursor para a linha desejada
    $host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates 0, $linhaInicial
    
    # Escreve o texto
    Write-Host "Repositório: ($i de $totalRepositorio): Repositorio-Exemplo-$i - $porcentagem% concluído"
    
    Start-Sleep -Milliseconds 500
}

# Retorna o cursor para o final da tela
$host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates 0, ($host.UI.RawUI.CursorPosition.Y + 1)