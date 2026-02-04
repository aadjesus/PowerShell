cls

$baseUrl        = "https://dev.azure.com/praxio/Desenvolvimento/_apis/git"
$branchName     = "refs/heads/master"
$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ Authorization = "Basic $base64AuthInfo" }
$MAQUINA_DE_BUILD = "GraphQl|Eslint|UIKit|Delphi|Libraries|AuthClient|Demo|ClientesAPI|Setup|UIKit|Tools|Servicos"

$prefixo   = "GlobusWeb.*"
Write-Host "Procurando Repositórios com prefixo: $($prefixo)"
$uri      = "$baseUrl/repositories?api-version=7.1"
$response = Invoke-RestMethod -Uri $uri -Headers $headers -Method GET
$repositorios = $response.value |
    Where-Object { $_.name -like "$($prefixo)" -and
                   $_.name -notmatch $MAQUINA_DE_BUILD } |
    Select-Object id, name, url |
    Sort-Object name

foreach ($item in $repositorios) {
    $item | Add-Member -MemberType NoteProperty -Name "x1" -Value "sssssss"
}

$repositorios

#$json = $repositorios | ConvertTo-Json -Compress
#Write-Host "##vso[task.setvariable variable=lista;isOutput=true]$json"          
#Write-Host "$($repositorios.Count): Repositórios encontrados"
#$repositorios