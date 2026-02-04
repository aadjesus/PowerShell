clear

$projeto        = "Desenvolvimento" # "Inovação"
$pat            = [Environment]::GetEnvironmentVariable("XXXXXXXX", "User")
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($pat)"))

function Invoke-AzureDevOpsApi {
    param (
        [string]$Url
    )

    return Invoke-RestMethod -Uri $Url -Method Get -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} -ContentType "application/json"
}

Write-Host "Obtendo Deployment Groups"
#$deploymentGroupsResponse = Invoke-AzureDevOpsApi -Url "https://dev.azure.com/praxio/$projeto/_apis/distributedtask/deploymentgroups?api-version=7.1"
#$deploymentGroupsResponse = Invoke-AzureDevOpsApi -Url "https://dev.azure.com/$organization/$project/_apis/distributedtask/deploymentgroups/817?api-version=7.1"
#$deploymentGroupsResponse = Invoke-AzureDevOpsApi -Url "https://dev.azure.com/$organization/$project/_apis/distributedtask/deploymentgroups/540/targets/1164?api-version=7.1"
#$deploymentGroupsResponse = Invoke-AzureDevOpsApi -Url "https://dev.azure.com/$organization/$project/_apis/distributedtask/deploymentgroups/540/targets?tags=Teste123&api-version=7.1"
#                                                    GET https://dev.azure.com/$organization/$project/_apis/distributedtask/deploymentgroups/540/targets/1164?api-version=7.1
#                                                    GET https://dev.azure.com/$organization/$project/_apis/distributedtask/deploymentgroups/540/targets/1164?api-version=7.1
#                                                    GET https://dev.azure.com/$organization/$project/_apis/distributedtask/deploymentgroups/540/targets?tags={tags}
#$tag = $deploymentGroupsResponse.tags | 
#    Where-Object { "$_".ToLower() -eq "alessandro.augusto@bgmrodotec.com.br".ToLower() }
#    Select-Object -First 1
#$tag

$x1 = Invoke-AzureDevOpsApi -Url "https://dev.azure.com/praxio/Desenvolvimento/_apis/distributedtask/deploymentgroups/540/targets?tags=Teste123&api-version=7.1"
$x1


$clientes = @()
foreach ($group in $deploymentGroupsResponse.value) {
    #if ($group.id -ne 540) {
    #    continue
    #}
    
    
    #$groupName = $group.name
    #Write-Host "Grupo: $($groupName) (ID: $groupId)"

    $targetsResponse = Invoke-AzureDevOpsApi -Url "https://dev.azure.com/praxio/$projeto/_apis/distributedtask/deploymentgroups/$($group.id)/targets?name=AAUGUSTO&tags=Teste123&api-version=7.1" # ?agentStatus=online
                                              #GET https://dev.azure.com/praxio/$projeto/_apis/distributedtask/deploymentgroups?name={name}&actionFilter={actionFilter}&$expand={$expand}&continuationToken={continuationToken}&$top={$top}&ids={ids}&api-version=7.1
                                              #GET https://dev.azure.com/praxio/$projeto/_apis/distributedtask/deploymentgroups/{deploymentGroupId}/targets?tags={tags}&name={name}&partialNameMatch={partialNameMatch}&$expand={$expand}&agentStatus={agentStatus}&agentJobResult={agentJobResult}&continuationToken={continuationToken}&$top={$top}&enabled={enabled}&propertyFilters={propertyFilters}&api-version=7.1
                                              #GET https://dev.azure.com/praxio/$projeto/_apis/distributedtask/deploymentgroups/{deploymentGroupId}?actionFilter={actionFilter}&$expand={$expand}&api-version=7.1
                                              #GET https://dev.azure.com/praxio/$projeto/_apis/distributedtask/deploymentgroups/{deploymentGroupId}/targets/$($Env:AGENT_ID)?api-version=7.1
    

    if ($targetsResponse.count -gt 0) {
        $targetsResponse -ne $null
        $group.id
        $clientes += $group.name
    }

    #$qtdeOnline = @($targetsResponse.machines | Where-Object { $_.agent.status -eq "online" }).Count
    #$qtdeOnline = @($targetsResponse.machines ).Count
    #if ($qtdeOnline -gt 0) {
    #    $cliente   = [PSCustomObject]@{nome=$group.name; qtde=$qtdeOnline}
    #    $clientes += $cliente
    #}

    #return

    #foreach ($target in $targetsResponse.machines) {
        
        #if ($target.agent.name -ne 'AAUGUSTO') {
        #    continue
        #}
     #   Write-Host $target.agent.status
        #$target.agent._links
        
    
        #$targetsResponse2 = Invoke-AzureDevOpsApi -Url "https://dev.azure.com/$organization/$project/_apis/distributedtask/deploymentgroups/$groupId/targets/$($target.agent.id)?`$expand=capabilities&api-version=6.0-preview.1"
        #$targetsResponse2.tags
        #$targetsResponse2.agent.systemCapabilities.'Agent.OS'    
    #}   
}

($clientes | Format-Table)