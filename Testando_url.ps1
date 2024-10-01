clear 

#try {
#    $response = Invoke-RestMethod -Uri "http://localhost:8086/#/auth11"
#    $response
#} catch {
#    $StatusCode = $_.Exception.Response.StatusCode

#    $StatusCode
#}
#curl -Uri "https://localhost:44347/Health" 

#$x1 = (New-Object System.Net.WebClient).DownloadString("https://localhost:44347/Health")
$x1 = (New-Object System.Net.WebClient).DownloadString("http://localhost:8086/#/auth11")
$x1 