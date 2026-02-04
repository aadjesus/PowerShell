cls

$token       = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$tokenBase64 = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$token"))

$urlBase      = "https://dev.azure.com/praxio/Desenvolvimento/_apis"
$headers      = @{"Authorization" = "Basic $tokenBase64"}

$uri          = "$($urlBase)/distributedtask/variablegroups/122?api-version=7.1-preview.1"
$response = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers -ErrorAction Stop
#$Response = Invoke-WebRequest -Uri $LibraryApiUrl -Headers $Headers -Method Get -ErrorAction Stop
$response.variables.FTP_URL.value