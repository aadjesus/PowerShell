clear

$connectionString =''
$schemaGlobus = ''
$arqAppG7Config = "c:\azagent\A1\AppG7.config"

if (-not ($arqAppG7Config  | Test-Path)) {
      throw 'Arquivo ('+ $arqAppG7Config + ') não encontrado.'
}

foreach($line in Get-Content $arqAppG7Config) {    
    if($line -match "(DefaultConnection).*(value).*") {
        $connectionString = $Matches[0].Split('"')[2]
    }

    if($line -match "(SchemaGlobus).*(value).*"){
        $schemaGlobus = $Matches[0].Split('"')[2]
    }
}

if (($connectionString -eq '') -or ($schemaGlobus -eq '')) {
    throw '"ConnectionString" ou  "SchemaGlobus" não encontrado no arquivo.'
}


#$Chave = ConvertFrom-SecureString -SecureString $connectionString -Key (1..16)
#$Chave2 = [Convert]::FromBase64String($Chave);

#Write-Host $Chave
$Secure_String_Pwd = ConvertTo-SecureString "P@ssW0rD!" -AsPlainText -Force
Write-Host $Secure_String_Pwd


#$PlainPassword = "P@ssword1" | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString
#$secure2 = Convertto-SecureString -string $PlainPassword


#$Secure2 = ConvertTo-SecureString -String $Encrypted

#Write-Host $Secure2

#Write-Host "---1 >" $PlainPassword
#Write-Host "---2 >" $secure2.ToString()



$encrypted = Encrypt-String $string "MyStrongPassword"

Write-Host $encrypted