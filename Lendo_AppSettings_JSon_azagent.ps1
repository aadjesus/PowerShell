clear

$arqAppsettings = 'c:\azagent\A1\appsettings.json'

if (-not ($arqAppsettings  | Test-Path)) {
      throw 'Arquivo ('+ $arqAppsettings + ') não encontrado.'
}

$textoAppsettings = (Get-Content $arqAppsettings | Out-String ) # -replace '\s*',''

Write-Host $textoAppsettings 
Write-Host ''

#$textoAppsettings1 = ($textoAppsettings | Out-String | ConvertFrom-Json )  #-replace '\s*',''
#Write-Host $textoAppsettings1



#$FinalJsonArray = $($textoAppsettings1).PSObject.Properties | foreach {@{Name = $_.Name; Value = $_.Value}} | ConvertTo-Json
#$FinalJsonArray


((Get-Content -path $arqAppsettings -Raw) -replace 'www','123') | Set-Content -Path $arqAppsettings


