cls

$Env:PATH_DESTINO = 'c:\Praxio\GlobusWeb\'

$lista = Get-ChildItem -Path $Env:PATH_DESTINO -Directory -Depth 2 -Recurse | 
    Where-Object { (Test-Path -Path "$($_.FullName)\azure-pipelines-front-end.yml") -or 
                   (Test-Path -Path "$($_.FullName)\azure-pipelines-back-end.yml") 
                   #(Test-Path -Path "$($_.FullName)\azure-pipelines.yml")
                   }
$task   = "554964"


$numero = "554962"
$branch = "feature/$($numero)"

foreach ($item in $lista) {    
    if ($item.FullName -match 'node_modules') {
        continue
    }
    Write-Host "Diretorio: $($item.FullName)" -ForegroundColor Cyan

    cd $item.FullName    
    #$publicar = $false

    #git checkout $branch
    #git push

    #git config --global --add safe.directory "$($item.FullName)".Replace('\','/')   

    #git checkout develop
    #git pull

    #git branch -D $branch
    git push origin --delete $branch

    #git flow feature finish $branch
    #git checkout develop
    #git pull
    
#    git flow feature start $numero    
#
#    $arquivo = 'azure-pipelines-front-end.yml'
#    if (Test-Path $arquivo) {
#        $publicar = $true
#        Write-Host "Copiou: $($arquivo)"
#        Copy-Item "c:\temp\azure-pipelines-front-end.yml" -Destination $arquivo  -Recurse -Force;
#        git add .
#        git commit -m "feat: Ajustando pipeline front-end #$($task)
#
#US #$($numero)"
#    }
##
#    $arquivo = 'azure-pipelines-back-end.yml'
#    if (Test-Path $arquivo) {
#        $publicar = $true
#        Write-Host "Copiou: $($arquivo)"
#        Copy-Item "c:\temp\azure-pipelines-back-end.yml" -Destination $arquivo -Recurse -Force;
#        git add .
#        git commit -m "feat: Ajustando pipeline back-end #$($task)
#
#US #$($numero)"
#    }
#
#
##    $alterouGitIgnore = $false;
##    if (-not (Test-Path ".gitignore")) {
##        Copy-Item "c:\temp\.gitignore" -Destination .gitignore -Recurse -Force;
##        Write-Host "Copiou"
##        $alterouGitIgnore = $true
##    } else {    
##        $content = Get-Content -Path ".gitignore"
##        $vs_exists = $content | Where-Object { $_ -like "*.vs/*" -or $_ -eq ".vs" }
##
##        if (-not $vs_exists) {
##            "/.vs/" | Out-File -FilePath ".gitignore" -Append
##            Write-Host "Alterou"
##            $alterouGitIgnore = $true
##        }
##    }
#
##    $status = git status --porcelain
##	if (-not [string]::IsNullOrEmpty($status)) {
##        Write-Host $status
##	    $alterouGitIgnore = $true
##    }        
##    if ($alterouGitIgnore) {
##         Write-Host "ok...................."
##        git add .
##        git commit -m "feat: Ajustando .gitignore para ignirarignorar a pasta '.vs' #$($task)
##
##US #$($numero)"
##    }
#
#    if ($publicar) {
#        git push   
#    }

}
$lista.Count