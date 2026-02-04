#feat: Criando release #548339
#
#US #548315


cls

git checkout develop
git pull origin develop

git checkout master
git pull origin master

git merge develop
git push origin master


git flow release start "2025.Q4.S5"

git tag -a 1.0.0 -m "feat: Ajustando versão GitVersion #551769

US #551767"

#########git flow publish

git flow finish

#########git checkout master

git push origin --tags

git push
git checkout develop
git push


