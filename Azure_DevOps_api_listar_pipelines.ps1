cls

$token       = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$urlBase     = "https://dev.azure.com/praxio/Desenvolvimento"
$url         = "$($urlBase)/_apis/pipelines?api-version=7.1-preview.1"
$tokenBase64 = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$token"))
$headers     = @{"Authorization" = "Basic $tokenBase64"}
$response    = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
$prefixo	 = "GlobusWeb.*"
$lista       = @($response.value | 
	Where-Object { $_.name -like "$($prefixo)"} |
    Sort-Object name
	
)

$x1 = ""
foreach ($item in $lista) {

$x2 = $item.name.Replace('.', '_').Replace('GlobusWeb.','')

$x1 += 
 "- pipeline: $($x2)
    source: $($item.name)
    trigger:
      branches:
        include: [ master, develop, release/* ] `n"



}

$x1


#Write-Host "|Repositórios|Master|Develop|"
#Write-Host "|--|:--:|:--:|"
#foreach ($item in $lista) {
#   $urlPipeline  = "$($urlBase)/_apis/build/status/GlobusWeb/$($item.name)?branchName"
#   $linkPipeline = "$($urlBase)/_build/latest?definitionId=$($item.id)&branchName"
#   $linkRepo     = $item.name -replace '\.(Back|Front)\.End$' 
#   Write-Host "[$($item.name)]($($urlBase)/_git/$($linkRepo))|[![Build status]($($urlPipeline)=master)]($($linkPipeline)=master)|[![Build status]($($urlPipeline)=develop)]($($linkPipeline)=develop)"
#}

#Write-Host "|Repositórios|Master<b>Back-End|Develop<b>Back-End|Master<b>Front-End|Develop<b>Front-End|"
#Write-Host "|--|:--:|:--:|:--:|:--:|"
#
#$grupo = $lista | Group-Object -Property { $_.name -replace '\.(Back|Front)\.End$' }
#foreach ($item in $grupo) {
#    
#    $itens = @()
#    foreach ($item2 in $item.Group) {
#        $urlPipeline  = "$($urlBase)/_apis/build/status/GlobusWeb/$($item2.name)?branchName"
#        $linkPipeline = "$($urlBase)/_build/latest?definitionId=$($item2.id)&branchName"
#        $itens       += "[![Build status]($($urlPipeline)=master)]($($linkPipeline)=master)|[![Build status]($($urlPipeline)=develop)]($($linkPipeline)=develop)"
#    }
#    $itens = $itens -join '|'
#    
#    Write-Host "[$($item.Name)]($($urlBase)/_git/$($item.Name))|$itens"
#}

