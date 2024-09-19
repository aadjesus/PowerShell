clear
$pathAppSettings = (Get-ChildItem "c:\azagent\A1\AppSettings\" -Filter Escala.json) | Get-Content

$appSettingsJson = $pathAppSettings | Out-String | ConvertFrom-Json  
$defaultConnection = $appSettingsJson.ConnectionStrings.DefaultConnection

$matche = '(Password\=)(?<password>.*)([^""]*)'
if ($defaultConnection -cmatch $matche) {
    $passwordBase64 = "xxx"#[System.Convert]::ToBase64String([System.Text.UTF8Encoding]::UTF8.GetBytes($Matches.password));
    Write-Host $Matches.password
    Write-Host $passwordBase64    

    $pathAppSettings -replace $Matches.password,$passwordBase64 | Out-File $appSettings.PSPath

    #$base64 = [System.Convert]::FromBase64String($passwordBase64)
    #[System.Text.Encoding]::UTF8.GetString($base64)   
}

#clear
#
#$pathAppSettings = Get-ChildItem "c:\azagent\A1\AppSettings\" -Filter Escala.json
#
#$appSettings     = $pathAppSettings | Get-Content
#$appSettingsJson = $appSettings | Out-String | ConvertFrom-Json  
#
#$defaultConnection = $appSettingsJson.ConnectionStrings.DefaultConnection
#
#Write-Host $defaultConnection
#
#
#if ($defaultConnection -cmatch "Password\=(?<password>.*)") {
#    $passwordBase64 = [System.Convert]::ToBase64String([System.Text.UTF8Encoding]::UTF8.GetBytes($Matches.password));
#    Write-Host $Matches.password
#    Write-Host $passwordBase64    
#
#    ($appSettings -replace "(Password\=)(.*)","Password=$passwordBase64") | Out-File $pathAppSettings
#
#    $base64 = [System.Convert]::FromBase64String($passwordBase64)
#    [System.Text.Encoding]::UTF8.GetString($base64)   
#}


#$webBrowser.Document.GetElementById("appsettings").GetAttribute("innerHTML")
#$json.ConnectionStrings.DefaultConnection = [System.Convert]::ToBase64String([System.Text.UTF8Encoding]::UTF8.GetBytes($json.ConnectionStrings.DefaultConnection))

      
