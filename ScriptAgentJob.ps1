try { 

    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($Env:SYSTEM_ACCESSTOKEN)"))
    $headers        = @{ 
        Authorization = "Basic $base64AuthInfo"; 
        "Content-Type" = "application/json" 
    }
    $baseUrl = "$($Env:SYSTEM_TEAMFOUNDATIONSERVERURI)$($Env:SYSTEM_TEAMPROJECTID)/_apis/Release/releases"

    $jobPipelines = Start-Job -ScriptBlock {
       return & "$($using:PSScriptRoot)\ScriptAgentJob-Pipelines.ps1" `
           -BaseUrl "$($Env:SYSTEM_TASKDEFINITIONSURI)$($Env:SYSTEM_TEAMPROJECTID)/_apis/build/builds" `
           -Headers ($using:headers)
    }
    
    $jobAgentName = Start-Job -ScriptBlock {
        return & "$($using:PSScriptRoot)\ScriptAgentJob-TagAgentName.ps1" `
            -BaseUrl ($using:baseUrl) `
            -Headers ($using:headers)
    }

    $jobPipelines, $jobAgentName | Wait-Job

    $jsonPipelines = Receive-Job -Job $jobPipelines
    $tagAgentName  = Receive-Job -Job $jobAgentName

    & "$PSScriptRoot\ScriptAgentJob-AtualizarVariaveis.ps1" `
        -BaseUrl         $baseUrl `
        -Headers         $headers `
        -JsonPipelines   $jsonPipelines `
        -TagAgentName    $tagAgentName   

}
catch {
    Write-Host "##vso[task.logissue type=error;]$_.Exception.Message"
    Write-Host "##vso[task.complete result=Failed;]"
}