cls 

#[Environment]::SetEnvironmentVariable("PATH", "$([Environment]::GetEnvironmentVariable('PATH','User'));c:\azagent\A1\_work\_globusweb\_temp\Scripts", "User")

#Uteis.ps1 ssssssss

$aaa = [Environment]::GetEnvironmentVariable("PATH", 'User') + ';xxxxxxx;' + [Environment]::GetEnvironmentVariable("PATH", 'Machine')


$currentPaths = $aaa -split ';' | ForEach-Object {
        #if ($_ -and (Test-Path $_)) {
        #    [System.IO.Path]::GetFullPath($_)
        #}
        $_
    }

$currentPaths