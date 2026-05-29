cls

$caminho = "$env:TMP\meu_token.txt"
$caminho
$token = "sssssssssssss"

if (Test-Path $caminho) {
    Set-ItemProperty -Path $caminho -Name Attributes -Value "Normal"
}

# Criptografa o token de forma nativa
$tokenCriptografado = ConvertTo-SecureString $token -AsPlainText -Force
$textoSeguro = ConvertFrom-SecureString $tokenCriptografado

# Salva diretamente na pasta TMP do sistema
$textoSeguro   | Out-File -FilePath "$env:TMP\meu_token.txt" -Force
#(Get-Item "$env:TMP\meu_token.txt").Attributes = 'Hidden'




$textoSeguro = Get-Content -Path "$env:TMP\meu_token.txt"

# Decodifica para texto puro de forma segura
$tokenCriptografado = ConvertTo-SecureString $textoSeguro
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($tokenCriptografado)
$tokenOriginal = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)


$tokenOriginal