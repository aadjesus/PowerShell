clear 

#cd c:\Users\Alessandro.Augusto\GitHub\PowerShell\ 
#cd c:\Praxio\Praxio.SyncESFtoKMM\
cd C:\Praxio\Testes

#$commits     = (git log -2 --pretty=%B)  # Esse comando na pipeline só traz uma linha ai só é possivel fazer a validação do regexMaster
$commits     = git log -2 --pretty=format:"%s"
$commits

$regexMaster = "Merge branch 'master' into develop"
$regexHotfix = "Merge branch 'hotfix"
$condicao    = ($commits -match $regexMaster -and $commits -match $regexHotfix)

if ($condicao -eq $True) {
    Write-Host "✅ Commit de merge de hotfix detectado na branch Develop. Interrompendo execução das próximas tasks."
} else {
    Write-Host "❌ A mensagem NÃO contém todas as palavras esperadas."
}