cls

#POST https://dev.azure.com/{org}/{project}/_apis/git/repositories/{repoId}/refs?api-version=7.1

$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers = @{ 
    Authorization = "Basic $base64AuthInfo"
    'Content-Type' = "application/json" 
}

try {
    Write-Host "Buscando tags"       
    
    $idRepositorio = "e6683df9-6ed5-45a7-bd1c-60cac94f421d"
    $major         = 0
    $baseUrl  = "https://dev.azure.com/Praxio/Fusea/_apis/git/repositories"    
    $url      = "$baseUrl/$idRepositorio/refs?filter=tags&api-version=7.1"

    $response  = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
    if ($response -ne $null -and $response.value.Count -gt 0) {
        $ultimaTag = $response.value | 
            Select-Object name  | 
            Select-String 'v(\d+)\.' | % { [int]$_.Matches.Groups[1].Value } | 
            Sort-Object -Property $_ | 
            Select-Object -Last 1
        $ultimaTag
        $major = $ultimaTag
    }
    $major = [int]$major + 1
    $tag   = "v$($major).0.0"

    $response.value | 
            Select-Object name  | 
            Select-String 'v(\d+)\.' | % { [int]$_.Matches.Groups[1].Value } | 
            Sort-Object -Property $_ | 
            Select-Object -Last 1
    

    
    
} catch {
    Write-Host "Status Code: $($_.Exception.Response.StatusCode.value__)"
    Write-Host "$($_.Exception.Response.StatusDescription)"
    Write-Host "$($_.ErrorDetails.Message)"
}