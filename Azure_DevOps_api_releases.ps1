cls

$branchName     = "refs/heads/master"
$token          = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$headers        = @{ Authorization = "Basic $base64AuthInfo" }

$uri      = "https://vsrm.dev.azure.com/praxio/Desenvolvimento/_apis/release/releases/83235?api-version=6.0"

$uri      = "https://vsrm.dev.azure.com/praxio/Desenvolvimento/_apis/release/releases?api-version=7.1"  
#$uri      = "https://vsrm.dev.azure.com/praxio/Desenvolvimento/_apis/release/releases?definitionId=83235&definitionEnvironmentId={definitionEnvironmentId}&searchText={searchText}&createdBy={createdBy}&statusFilter={statusFilter}&environmentStatusFilter={environmentStatusFilter}&minCreatedTime={minCreatedTime}&maxCreatedTime={maxCreatedTime}&queryOrder={queryOrder}&$top={$top}&continuationToken={continuationToken}&$expand={$expand}&artifactTypeId={artifactTypeId}&sourceId={sourceId}&artifactVersionId={artifactVersionId}&sourceBranchFilter={sourceBranchFilter}&isDeleted={isDeleted}&tagFilter={tagFilter}&propertyFilters={propertyFilters}&releaseIdFilter={releaseIdFilter}&path={path}&api-version=7.1"
#$uri      = "https://vsrm.dev.azure.com/praxio/Desenvolvimento/_apis/release/releases?path=f7e1f0f0-eca6-49ed-89c4-b580797f7a63&api-version=7.1"
$uri      = "https://vsrm.dev.azure.com/praxio/Desenvolvimento/_apis/release/releases/83241?api-version=6.0"
$uri      = "https://vsrm.dev.azure.com/praxio/Desenvolvimento/_apis/release/releases/83256?api-version=7.1"
$uri      = "https://vsrm.dev.azure.com/praxio/Desenvolvimento/_apis/release/releases/83257?api-version=7.1"
$uri      = "https://vsrm.dev.azure.com/praxio/Desenvolvimento/_apis/Release/releases/83257/environments/112499?api-version=7.1"


$response = Invoke-RestMethod -Uri $uri -Headers $headers -Method GET




$ultimoAprovador = $response.preDeployApprovals |
    Sort-Object { [datetime]$_.modifiedOn  } -Descending |
    Select-Object -First 1

Write-Host "Nome: $($ultimoAprovador.approvedBy.displayName)"
Write-Host "Nome: $($ultimoAprovador.approvedBy.uniqueName)"
Write-Host "Data:  $($ultimoAprovador.modifiedOn)"


#$response
#$response.value  | ConvertTo-Json -Compress
#$targetEnv  = "QA"
#$approvalValido = $response | Sort-Object createdOn -Descending | Select-Object -First 1
#$approvalValido


# Write-Host "id                        " -ForegroundColor Red 
# $response.id                         
# Write-Host "name                      " -ForegroundColor Red 
# $response.name                       
# Write-Host "status                    " -ForegroundColor Red 
# $response.status                     
# Write-Host "createdOn                 " -ForegroundColor Red 
# $response.createdOn                  
# Write-Host "modifiedOn                " -ForegroundColor Red 
# $response.modifiedOn                 
# Write-Host "modifiedBy                " -ForegroundColor Red 
# $response.modifiedBy                 
# Write-Host "createdBy                 " -ForegroundColor Red 
# $response.createdBy                  
# Write-Host "createdFor                " -ForegroundColor Red 
# $response.createdFor                 
# Write-Host "environments              " -ForegroundColor Red 

# $response.environments.Count
# 
#  $x1 = $response.environments | 
#     Where-Object { $_.name -eq "QA" } |
#     Select-Object preDeployApprovals
# $x1.preDeployApprovals.Count
# 
# ($x1.preDeployApprovals | Measure-Object -Property id -Maximum)

 
# 
# Write-Host "variables                 " -ForegroundColor Red 
# $response.variables                  
# Write-Host "variableGroups            " -ForegroundColor Red 
# $response.variableGroups             
# Write-Host "artifacts                 " -ForegroundColor Red 
# $response.artifacts                  
# Write-Host "releaseDefinition         " -ForegroundColor Red 
# $response.releaseDefinition          
# Write-Host "releaseDefinitionRevision " -ForegroundColor Red 
# $response.releaseDefinitionRevision  
# Write-Host "description               " -ForegroundColor Red 
# $response.description                
# Write-Host "reason                    " -ForegroundColor Red 
# $response.reason                     
# Write-Host "releaseNameFormat         " -ForegroundColor Red 
# $response.releaseNameFormat          
# Write-Host "keepForever               " -ForegroundColor Red 
# $response.keepForever                
# Write-Host "definitionSnapshotRevision" -ForegroundColor Red 
# $response.definitionSnapshotRevision 
# Write-Host "logsContainerUrl          " -ForegroundColor Red 
# $response.logsContainerUrl           
# Write-Host "url                       " -ForegroundColor Red 
# $response.url                        
# Write-Host "_links                    " -ForegroundColor Red 
# $response._links                     
# Write-Host "tags                      " -ForegroundColor Red 
# $response.tags                       
# Write-Host "triggeringArtifactAlias   " -ForegroundColor Red 
# $response.triggeringArtifactAlias    
# Write-Host "projectReference          " -ForegroundColor Red 
# $response.projectReference           
# Write-Host "properties                " -ForegroundColor Red 
# $response.properties                 
