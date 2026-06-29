cls
# 1. Defina o caminho real da pasta que você quer exibir
$TargetFolder = "C:\Users\alessandro.augusto\Praxio"

# 2. Um GUID único para identificar sua pasta no sistema
$Guid = "{a82b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d}"

# Caminhos do registro para "Este Computador" (CLSID e NameSpace)
$ClsidPath = "HKLM:\Software\Classes\CLSID\$Guid"
$NameSpacePath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\$Guid"

# 3. Cria a estrutura no CLSID
New-Item -Path $ClsidPath -Force | Out-Null
New-ItemProperty -Path $ClsidPath -Name "(Default)" -Value "Praxio" -Type String -Force | Out-Null
# Removeo target de dropdown e define como pasta de arquivos
New-ItemProperty -Path $ClsidPath -Name "System.IsPinnedToNameSpaceTree" -Value 1 -Type DWord -Force | Out-Null

# 4. Aponta para a instância do Shell que abre pastas do sistema
New-Item -Path "$ClsidPath\InprocServer32" -Force | Out-Null
New-ItemProperty -Path "$ClsidPath\InprocServer32" -Name "(Default)" -Value "%SystemRoot%\system32\shell32.dll" -Type ExpandString -Force | Out-Null
New-ItemProperty -Path "$ClsidPath\InprocServer32" -Name "ThreadingModel" -Value "Both" -Type String -Force | Out-Null

# 5. Define a propriedade que redireciona para o seu diretório real
New-Item -Path "$ClsidPath\Instance" -Force | Out-Null
New-ItemProperty -Path "$ClsidPath\Instance" -Name "CLSID" -Value "{535d04c0-c181-11d0-a295-00a0c9c4983a}" -Type String -Force | Out-Null # CLSID para caminhos físicos

New-Item -Path "$ClsidPath\Instance\InitPropertyBag" -Force | Out-Null
New-ItemProperty -Path "$ClsidPath\Instance\InitPropertyBag" -Name "Attributes" -Value 21 -Type DWord -Force | Out-Null
New-ItemProperty -Path "$ClsidPath\Instance\InitPropertyBag" -Name "TargetFolderPath" -Value $TargetFolder -Type String -Force | Out-Null

# 6. Registra no NameSpace do "Este Computador"
New-Item -Path $NameSpacePath -Force | Out-Null

# 7. Reinicia o Windows Explorer para aplicar na hora
Stop-Process -Name explorer -Force

Write-Host "Pasta adicionada com sucesso em 'Este Computador'!" -ForegroundColor Green