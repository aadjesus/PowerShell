
if ( '$(Build.Sourcebranchname)' -ne 'master'){
    Write-Host "##vso[task.logissue type=error]--------------------------------------------------------------------------------------------------------"   
    Write-Host "##vso[task.logissue type=error]Não é possível atualizar o ambiente '$(Release.Environmentname)' com a branch '$(Build.Sourcebranchname)'."
    Write-Host "##vso[task.logissue type=error]--------------------------------------------------------------------------------------------------------"   
    Throw 
}