cls

$sourceApi = "C:\temp\web.config-API\web.config"
$sourceUi  = "C:\temp\web.config-UI\web.config"

$rootPath = "C:\Servers\GlobusWeb"


$configs = Get-ChildItem -Path $rootPath -Filter "web.config" -Recurse

Write-Host "Iniciando processamento de arquivos..."

foreach ($file in $configs) {
    $parentPath = $file.DirectoryName
    $origem = if ($parentPath -like "*\API" -or $parentPath -like "*\API\*") { $sourceApi } else { $sourceUi }


    Write-Host "Copiando: $($origem) para: $($file.DirectoryName)"

    Copy-Item -Path $origem -Destination $file.FullName -Force
}

Write-Host "`nProcesso concluído!" -ForegroundColor White -BackgroundColor DarkGreen