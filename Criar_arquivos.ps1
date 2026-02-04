$scriptContent = @'
function Set-Valor {
    param(
        [Parameter(Mandatory=$true)][string]$Nome,
        [Parameter(Mandatory=$true)][string]$Valor
    )

    Write-Output "Nome: $Nome, Valor: $Valor"

    Write-Host "##vso[task.setvariable variable=$Nome;isOutput=true;isReadonly=false]$Valor"

    $arquivoVariaveis = Join-Path -Path $(System.WorkFolder) -ChildPath "variaveis.env"

    $hash = @{}
    if (Test-Path $arquivoVariaveis) {
        Get-Content $arquivoVariaveis | ForEach-Object {
            if ($_ -match '^(.*?)=(.*)$') {
                $hash[$matches[1]] = $matches[2]
            }
        }
    }

    $hash[$Nome] = $Valor

    $hash.GetEnumerator() | ForEach-Object {
        "$($_.Key)=$($_.Value)"
    } | Set-Content $arquivoVariaveis -Encoding UTF8

    Write-Host "Arquivo atualizado: $arquivoVariaveis"
}

function Get-Valor {
    param(
        [Parameter(Mandatory=$true)][string]$Valor
    )

   $variaveis        = Get-Content "$(System.WorkFolder)\variaveis.env" | ConvertFrom-StringData
   $valorVariavel = $variaveis[$Valor]

   Write-Host "##vso[task.setvariable variable=$Valor]$valorVariavel"

   Write-Host "$valorVariavel"

   Write-Host "$Valor"

   return $valorVariavel
}
'@

Set-Content -Path "$(System.WorkFolder)\Uteis.ps1" -Value $scriptContent

Write-Host "Arquivo Uteis.ps1 criado no diretório de trabalho."