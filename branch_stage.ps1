if ('master' -ne $Build_SourceBranchName -and 
    'Homologação','Canário','Produção' -eq $Env:Release_Environmentname) {
    
    Write-Host "##vso[task.logissue type=error;]ATENÇÂO: A distribuição não pode ser completada porque as alterações não foram feitas na Branch Master."

    throw
}

#$stages = @('Teste','Homologação','Canário','Produção')
#for ($i=1; $i -lt $stages.length; $i++) {
#    $StagePrevious = (Get-Variable ('Release_Environments_' + $stages[$i-1] + '_Status')).Value    
#
#    if ($Env:Release_Environmentname -eq $stages[$i] -and 
#        'NotStarted','Rejected'  -eq $StagePrevious) {
#       Write-Host "##vso[task.logissue type=error;]ATENÇÂO: A distribuição não pode ser completada porque o estagio anterior não foi executado eu deu erro."
#
#    throw
#    }
#}

$status = @('Succeeded', 'PartiallySucceeded')
if (
     ('Homologação' -eq $Env:Release_Environmentname -and $status -NotContains $Env:Release_Environments_QA_Status) -or
     ('Canário'     -eq $Env:Release_Environmentname -and $status -NotContains $Env:Release_Environments_Homologação_Status) -or
     ('Produção'    -eq $Env:Release_Environmentname -and $status -NotContains $Env:Release_Environments_Canário_Status) 
) {

    Write-Host "##vso[task.logissue type=error;]ATENÇÂO: A distribuição não pode ser completada porque o estagio anterior não foi executado eu está com erro."
    throw
}