cls
$token    = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")

$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ Authorization = "Basic $base64AuthInfo" }

$urlBase = "https://dev.azure.com/praxio/Desenvolvimento/_apis"

			$uri      = "$($urlBase)/distributedtask/variablegroups/122?api-version=7.1-preview.1"
			Write-Host "Url: $($uri)"
			$response = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers


$response