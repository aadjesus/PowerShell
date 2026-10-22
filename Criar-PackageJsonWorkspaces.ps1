cls
# Cria um package.json (npm workspaces) na pasta onde o script e executado,
# com todas as back-end / front-end que possuem package.json.
# Uso: cd D:\AgentsGlbEvo\AgEvo0101\_work ; .\Criar-PackageJsonWorkspaces.ps1

$raiz = (Get-Location).Path

$arquivos = @(Get-ChildItem -Filter package.json -Recurse -Depth 3 -File -Force -ErrorAction SilentlyContinue |
    Where-Object { $_.Directory.Name -in @('back-end', 'front-end') })

if ($arquivosCount -eq 0) {
    Write-Warning "Nenhuma back-end/front-end com package.json encontrada em $raiz"
    return
}

$workspaces = @($arquivos |
    ForEach-Object {
        "    `"$_.Directory.FullName -replace [regex]::Escape($raiz), '' -replace '\\', '/' `""
    }) -join ",`r`n" | Out-Null

$conteudo = @"
{
  "name": "globusweb",
  "description": "Monorepo para os app's GlobusWeb",
  "author": "praxio",
  "license": "UNLICENSED",
  "private": true,
  "keywords": [
    "praxio",
    "nstech",
    "globusweb",
    "monorepo"
  ],
  "scripts": {
    "copy-patches": "cpx \"node_modules/@praxio/globusweb-libraries-patches/patches/**/*\" ./patches",
    "postinstall": "npm run copy-patches && patch-package && npm dedupe",
    "init": "npm install --workspaces && npm dedupe --workspaces && npm run build --workspaces --force"
  },
  "dependencies": {
    "cpx": "^1.5.0",
    "patch-package": "8.0.0",
    "praxio-oai-kit": "^2.1.0",
    "wait-on": "^8.0.1"
  },
  "workspaces": [
$linhas
  ]
}
"@

# UTF-8 sem BOM
[System.IO.File]::WriteAllText((Join-Path $raiz 'package.json'), $conteudo, (New-Object System.Text.UTF8Encoding($false)))

$workspaces | ForEach-Object { Write-Host "  $_" }
Write-Host "Gerado1 $raiz\package.json com $($workspaces.Count) workspaces."