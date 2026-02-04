cls
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$token        = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$buildId      = 196385
$artifactName = 'drop'
$DownloadTo   = 'C:\Temp\Drop.zip'

$token = ""
$base64String = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(":$token"))
$headers      = @{'Authorization' = 'Basic ' + $base64String}

# Get build definition id
#$response = Invoke-WebRequest -Uri "https://dev.azure.com/$($Company)/$($Project)/_apis/build/definitions?name=$($DefinitionName)&api-version=6.0" -Method 'GET' -Headers $h -UseBasicParsing
#$response_json = ($response.Content | ConvertFrom-Json)
#$DefinitionId = $response_json.value.id

# Get latest build id for named branch
#$response = Invoke-WebRequest -Uri "https://dev.azure.com/$($Company)/$($Project)/_apis/build/latest/$($DefinitionId)?branchName=$($Branch)&api-version=6.0-preview" -Method 'GET' -Headers $h -UseBasicParsing
#$response_json = ($response.Content | ConvertFrom-Json)
#$BuildId = $response_json.id

# Download latest named artifact
$urlBuild     = "https://dev.azure.com/Praxio/Desenvolvimento/_apis/build/builds/$($buildId)/artifacts?artifactName=$($artifactName)&api-version=6.0"

$urlBuild     = "https://dev.azure.com/Praxio/Desenvolvimento/f7e1f0f0-eca6-49ed-89c4-b580797f7a63/_apis/build/builds/$($buildId)/artifacts?artifactName=$($artifactName)&api-version=6.0&`$format=zip"

Invoke-WebRequest -Uri $url -Method 'GET' -Headers $headers -UseBasicParsing -OutFile "$($DownloadTo)"

#$response     = Invoke-WebRequest -Uri $urlBuild -Method 'GET' -Headers $headers -UseBasicParsing
#$response.StatusCode
#if ($response.StatusCode -ne 200) {
#    return
#}

#$response_json = ($response.Content | ConvertFrom-Json)
#Invoke-WebRequest -Uri $response_json.resource.downloadUrl -Method 'GET' -Headers $headers -UseBasicParsing -OutFile "$($DownloadTo)"

