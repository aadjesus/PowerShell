cls

    $pathBaseLog = "c:\#Log\"
    New-Item -Path $pathBaseLog -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
    $nomeScript = $MyInvocation.MyCommand -replace "\.", "_"
    $arquivoLog = "$($pathBaseLog)\$($nomeScript)_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
    Start-Transcript -Path $arquivoLog -Append



Write-Host "Processo finalizado com sucesso."
#$arquivoLog = "C:\DestinationFolder\reinstalar_agent_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"    

#New-Item -Path $arquivoLog -ItemType "File"

$nome = Split-Path -Path $PSCommandPath -Leaf
Write-Host $nome
Write-Host $PSCommandPath
#Write-Host $PSCommandPath
$x1 = Split-Path -Path $MyInvocation.MyCommand -Leaf
Write-Host $x1

#Write-Host " $($MyInvocation.MyCommand.CmdletBinding          )"
#Write-Host " $($MyInvocation.MyCommand.CommandType            )"
#Write-Host " $($MyInvocation.MyCommand.DefaultParameterSet    )"
#Write-Host " $($MyInvocation.MyCommand.Definition             )"
#Write-Host " $($MyInvocation.MyCommand.Description            )"
#Write-Host " $($MyInvocation.MyCommand.HelpFile               )"
#Write-Host " $($MyInvocation.MyCommand.Module                 )"
#Write-Host " $($MyInvocation.MyCommand.ModuleName             )"
#Write-Host " $($MyInvocation.MyCommand.Name                   )"
#Write-Host " $($MyInvocation.MyCommand.Noun                   )"
#Write-Host " $($MyInvocation.MyCommand.Options                )"
#Write-Host " $($MyInvocation.MyCommand.OutputType             )"
#Write-Host " $($MyInvocation.MyCommand.RemotingCapability     )"
#Write-Host " $($MyInvocation.MyCommand.ScriptBlock            )"
#Write-Host " $($MyInvocation.MyCommand.Source                 )"
#Write-Host " $($MyInvocation.MyCommand.Version                )"
#Write-Host " $($MyInvocation.MyCommand.Verb                   )"
#Write-Host " $($MyInvocation.MyCommand.Visibility             )"
                                                              
Write-Host "01 $($MyInvocation.BoundParameters       )   "
Write-Host "02 $($MyInvocation.CommandOrigin         )   "
#Write-Host "03 $($MyInvocation.DisplayScriptPosition )   "
#Write-Host "04 $($MyInvocation.ExpectingInput        )   "
#Write-Host "05 $($MyInvocation.HistoryId             )   "
Write-Host "06 $($MyInvocation.InvocationName        )   "
#Write-Host "07 $($MyInvocation.Line                  )   "
Write-Host "08 $($MyInvocation.MyCommand             )   "
#Write-Host "09 $($MyInvocation.OffsetInLine          )   "
#Write-Host "10 $($MyInvocation.PipelineLength        )   "
#Write-Host "11 $($MyInvocation.PipelinePosition      )   "
#Write-Host "12 $($MyInvocation.PositionMessage       )   "
#Write-Host "13 $($MyInvocation.PSCommandPath         )   "
#Write-Host "14 $($MyInvocation.PSScriptRoot          )   "
#Write-Host "15 $($MyInvocation.ScriptLineNumber      )   "
#Write-Host "16 $($MyInvocation.ScriptName            )   "
#Write-Host "17 $($MyInvocation.UnboundArguments      )   "
            
Stop-Transcript