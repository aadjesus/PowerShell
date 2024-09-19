clear
$index = 'c:\Praxio\AmbienteDev\IdentityServer4\web.config'
if ((Test-Path -Path $index)) {
    $versaoAtual = ''
    select-Xml -Path $index -XPath '/configuration/BuildNumber' | ForEach-Object { $versaoAtual = $versaoAtual + $_.Node.h + $_.Node.versao +';'}
    
    $versaoAtual

    #Write-Host "##vso[task.setvariable variable=VERSAOATUAL;]$lista"
}