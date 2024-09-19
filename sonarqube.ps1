clear 

#$token = [System.Text.Encoding]::UTF8.GetBytes("sqa_4b00f3d6d830f6aab5dfef2538fc9b50789e2dfa:")
#$base64 = [System.Convert]::ToBase64String($token)
        
#$basicAuth = [string]::Format("Basic {0}", $base64)
#$headers = @{ Authorization = $basicAuth }
#$result = Invoke-RestMethod -Method Get -Uri http://172.16.0.16:9000/api/qualitygates/project_status?projectKey=Praxio.Reserva -Headers $headers

$erro = $null 
Try {
    #Plantao.Web.UI
    #Globus4.Compras

    $headers = @{ Authorization = 'Bearer sqa_31d0da34e60b5a9fe4991c3b100a118327f25c28' }
    $result = Invoke-RestMethod -Method Get -Uri http://179.191.123.126:9000/api/qualitygates/project_status?projectKey=Plantao.Web.UI -Headers $headers
    
    $result.projectStatus

    if ($result.projectStatus.status -ne 'OK') {
        $erro = 'Falha no Quality Gate.'
    }
    
} Catch {
    $erro = "$_"
}
if ($erro -ne $null) {
    $erro
} 

#curl --header 'Authorization: Bearer MY_TOKEN' https://sonarqube.com/api/user_tokens/search
