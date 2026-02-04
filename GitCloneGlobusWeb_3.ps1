cls

$organization = "praxio"
$project      = "Desenvolvimento"

$secureToken  = Read-Host "Personal Access Tokens" -AsSecureString
$token        = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureToken))
$uri          = "https://dev.azure.com/$organization/$project/_apis/git/repositories?api-version=7.0"

$headers = @{
    Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
}

try {
    $response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get
    $lista    = $response.value | Where-Object { $_.name -like "GlobusWeb*" }

    foreach ($item in $lista) {
        Write-Host "`nNome: $($item.name)" -ForegroundColor Green
        Write-Host "URL: $($item.remoteUrl)" -ForegroundColor Cyan
        Write-Host ('-' * $Host.UI.RawUI.WindowSize.Width)
    }
} catch {
    Write-Host "Erro ao conectar ao Azure DevOps: $_" -ForegroundColor Red
}