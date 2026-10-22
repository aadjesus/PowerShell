cls 

$Prefixo = 'GlobusWeb-'

Import-Module WebAdministration -ErrorAction Stop

$apps = @(Get-WebApplication | Where-Object {
    $_.applicationPool -like "$Prefixo*" -or $_.path -like "/$Prefixo*"
})
$pools = @(Get-ChildItem IIS:\AppPools | Where-Object Name -like "$Prefixo*")

Write-Host "`n=== Aplicacoes ($($apps.Count)) ===" -ForegroundColor Cyan
$apps | ForEach-Object {
    $site = $_.GetParentElement().Attributes['name'].Value
    Write-Host ("  {0}{1}  [pool: {2}]  {3}" -f $site, $_.path, $_.applicationPool, $_.physicalPath)
}

Write-Host "`n=== Application Pools ($($pools.Count)) ===" -ForegroundColor Cyan
$pools | ForEach-Object { Write-Host ("  {0}  [{1}]" -f $_.Name, $_.State) }


$resp = Read-Host "`nConfirma a exclusao de $($apps.Count) aplicacao(oes) e $($pools.Count) pool(s)? Digite SIM"
if ($resp -ne 'SIM') { Write-Host 'Cancelado.'; return }

# 1) Aplicacoes primeiro (pool com apps vinculados nao deve ser removido antes)
foreach ($a in $apps) {
    $site = $a.GetParentElement().Attributes['name'].Value
    try {
        Remove-WebApplication -Site $site -Name $a.path.TrimStart('/') -ErrorAction Stop
        Write-Host "App removida: $site$($a.path)" -ForegroundColor Green
    } catch { Write-Host "ERRO app $site$($a.path): $_" -ForegroundColor Red }
}

# 2) Pools
foreach ($p in $pools) {
    try {
        if ($p.State -eq 'Started') { Stop-WebAppPool -Name $p.Name -ErrorAction SilentlyContinue }
        Remove-WebAppPool -Name $p.Name -ErrorAction Stop
        Write-Host "Pool removido: $($p.Name)" -ForegroundColor Green
    } catch { Write-Host "ERRO pool $($p.Name): $_" -ForegroundColor Red }
}

Write-Host "`nConcluido." -ForegroundColor Cyan
