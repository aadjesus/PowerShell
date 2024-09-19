

param (
    [string]$SourceBranch = "refs/heads/hotfix/Andorinha_9",
    [string]$SourceBranchName = "Andorinha_9",
    [string]$BuildNumber = "",
    [string]$artifactstagingdirectory = ""
   
 )

function IsHotfix ([string]$branchName) 
{
    $branchName.Replace($strOrigin, '').StartsWith('hotfix',"CurrentCultureIgnoreCase")
}

function IsFeature ([string]$branchName) 
{
    $branchName.Replace($strOrigin, '').StartsWith('feature',"CurrentCultureIgnoreCase")
}


function IsClient([string]$branchName) 
{
    $branchName.Replace($strOrigin, '').StartsWith('Clientes',"CurrentCultureIgnoreCase")
}

$strOrigin = 'refs/heads/'

Write-Host "Nome da Branch: $SourceBranch"

$dir = $SourceBranchName

$isHotfix  = IsHotfix -branchName $SourceBranch
$isFeature = IsFeature -branchName $SourceBranch
$isClient  = IsClient -branchName $SourceBranch

if ($isHotfix) 
{
  $dir = "HotFix\$SourceBranchName"
} 


if ($isclient) 
{
   $dir = "Clientes\$SourceBranchName"
} 

if ($isfeature) 
{   
  $dir = "Feature\$SourceBranchName"
} 


Write-Host "Copiando para ...\dc01\Build\Globus\$dir\$BuildNumber\Sistemas"
Write-Host "  "
Write-Host "Executando comando: Copy-Item $artifactstagingdirectory\Globus\Sistemas  \\dc01\Build\Globus\$dir\$BuildNumber\Sistemas -Recurse"

Copy-Item $artifactstagingdirectory\Globus\Sistemas  \\dc01\Build\Globus\$dir\$BuildNumber\Sistemas -Recurse
