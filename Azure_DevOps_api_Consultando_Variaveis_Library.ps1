cls

$token       = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$tokenBase64 = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$token"))

$urlBase      = "https://dev.azure.com/praxio/Desenvolvimento/_apis"
$headers      = @{"Authorization" = "Basic $tokenBase64"}


$idLibraria = 132 # GlobusWeb
$uri          = "$($urlBase)/distributedtask/variablegroups/$($idLibraria)?api-version=7.1-preview.1"



$response = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers -ErrorAction Stop
$response.variables