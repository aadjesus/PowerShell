clear
    Write-Host "##[group]Beginning of a group"
    Write-Host "##[warning]Warning message"
    Write-Host "##[error]Error message"
    Write-Host "##[section]Start of a section"
    Write-Host "##[debug]Debug text"
    Write-Host "##[command]Command-line being run"
    Write-Host "##[endgroup]"

    Write-Host "##vso[task.logissue type=error]aaaaaaaa"