cls
$Env:PATH_DESTINO = 'c:\Praxio\GlobusWeb\'

	$lista = Get-ChildItem -Path $Env:PATH_DESTINO -Directory -Recurse -Force -ErrorAction SilentlyContinue |
		Where-Object { $_.Name -eq '.git' } |
		ForEach-Object { $_.Parent.FullName }


$totalRepositorio = $lista.Count
$contador   = 0
$linhaFinal = 0

foreach ($item in $lista) {
        $nome    = $item
		$contador++
		$porcentagem = [int](($contador / $totalRepositorio) * 100)
		Write-Progress -Activity "Clona repositório:" -Status "($contador de $totalRepositorio): $($nome)" -PercentComplete $porcentagem

        $host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates 0, 7    
	    for ($i = 7; $i -le $linhaFinal; $i++) {
		    Write-Host ("m" * [Console]::WindowWidth)
        }
            
        $host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates 0, 7
        cd $item
        
        Write-Host ('-' * [Console]::WindowWidth)
        Write-Host $item
        git status        
       
        $linhaFinal = $host.UI.RawUI.CursorPosition.Y-1
    
        Start-Sleep -Seconds 3
    
}