clear

#$arquivos = Get-ChildItem 'c:\Praxio\Praxio.Retrofit.Intelligence\src\Praxio.Retrofit.Intelligence.Migrations\*Migrati*.dll' -recurse | Select Directory
#$arquivos[1]

$diretorio = "c:\Praxio\Praxio.Retrofit.Intelligence\src"

$diretorio2 = Get-Childitem $diretorio -recurse | Where { $_.FullName -match 'Migrations.csproj$'} 


#$diretorio = Get-Childitem ${{ parameters.commonParameters.sourceDirectory }} -recurse | Where { $_.FullName -match '(bin).*(Migration).*(dll)'}
 
Write-Host $diretorio2
Write-Host $diretorio2.Name
Write-Host $diretorio2.FullName
Write-Host $diretorio2.Directory
#dir $diretorio2.Directory

