function Executar-Release ($path, $forcarVersaoEstavel=$false) {​​​​​​​
    cd $path
    
    git flow init --defaults
    
    git fetch
    git push origin --delete $(git tag -l)
    git tag -d $(git tag -l)

    git checkout master
    git reset --hard
    git pull

    git checkout develop
    git reset --hard
    git pull
    
    $teste = git branch --list *release*
    if ($teste) {​​​​​​​
        git branch -d $teste.Trim()
    }

    git flow release start "adequacaoNugets_$(Get-Date -Format "yyyyMMdd_HHmm")"
    git flow publish
    
    if (($forcarVersaoEstavel)) {​​​​​​​
      git tag -a v3.0 -m "setando branch para versao estavel"
    }
    
    git flow finish

    git checkout master
    if (($forcarVersaoEstavel)) {​​​​​​​
      git push origin --tags
    }
    
    git push
    git checkout develop
    git push
}


#projetos base
#Executar-Release 'C:\Praxio\Framework.Domain.Core.Model' $true
#Executar-Release 'C:\Praxio\Framework.AccessToken' $true
#Executar-Release 'C:\Praxio\Framework.Platform.Auth' $true
#Executar-Release 'C:\Praxio\Framework.Platform.Grid' $true
#Executar-Release 'C:\Praxio\Framework.RestApiClient' $true
#Executar-Release 'C:\Praxio\Framework.EventStore' $true
#Executar-Release 'C:\Praxio\Framework.FluentNHibernate' $true
#Executar-Release 'C:\Praxio\Framework.Platform.RetornoBo' $true
#


#Projetos com dependências
#Executar-Release 'c:\Praxio\Fusea\Framework.Domain.Core' $true              --- ok
#Executar-Release 'c:\Praxio\Fusea\Framework.Configuration' $true            --- gerou versao 3.1.0
#Executar-Release 'c:\Praxio\Fusea\Framework.Database' $true                 --- gerou versao 3.0.0
#Executar-Release 'c:\Praxio\Fusea\Framework.Platform.Client' $true          --- gerou versao 3.1.0
Executar-Release 'c:\Praxio\Fusea\Framework.Logs' $true
Executar-Release 'c:\Praxio\Fusea\Framework.Platform.Log' $true
Executar-Release 'c:\Praxio\Fusea\Framework.Platform' $true
#Executar-Release 'c:\Praxio\Fusea\Framework.Platform.LibBase' $true         --- gerou versao 3.6.0
Executar-Release 'c:\Praxio\Fusea\BgmRodotec.Arquivo' $true
    # Client                                                                 --- ok 

Executar-Release 'c:\Praxio\Fusea\BgmRodotec.Email' $true
    # Client                                                                 ---ok

Executar-Release 'c:\Praxio\Fusea\BgmRodotec.Endereco' $true
    # Client                                                                 ---              

Executar-Release 'c:\Praxio\Fusea\BgmRodotec.Notificacao' $true
    # Client                                                                 -- ok
     
Executar-Release 'c:\Praxio\Fusea\BgmRodotec.Auth' $true
    # Client                                                                 -- ok                     


#Executar-Release 'c:\Praxio\Fusea\Framework.Database.Core' $true            --- ok
#
standard