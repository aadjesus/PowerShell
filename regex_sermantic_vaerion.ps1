clear

#$regex =  '(?<major>\d+).(?<minor>\d+).(?<path>\d+)((-(?<stage>[A-Za-z-]+-?)((.)(?<num1>\d+)((\+)(?<num2>\d+)|)|)|)|(\+)(?<xx>\d+))'
#$regex  = '(?<major>\d+).(?<minor>\d+).(?<path>\d+)((-(?<stage>[a-z-]+-?)((.(?<num1>\d+)(\+(?<num2>\d+)|))|))|(\+(?<num1>\d+)|))'
$regex  = "\w+"


#(\+)(?<xx>\d+)

@(
    "1.11.111-estagio.1+11",
    "2.22.222-estagio.22", 
    "3.33.333-estagio",
    "4.44.444",
    "5.55.555+66",
    "1"
) | ForEach-Object {
    
    try {    
        $Matches.Clear();
        if ($_ -match $regex) {       
            #$Matches.num1  = (@{$false='';$true=$Matches.num1}[$Matches.num1 -ne $null]).PadLeft(2,'0')
            #$Matches.num2  = (@{$false='';$true=$Matches.num2}[$Matches.num2 -ne $null]).PadLeft(3,'0')
            #$Matches.stage = (@{$false='';$true=('-' + $Matches.stage) }[$Matches.stage -ne $null])    
            #
            #if ($Matches.num1 -eq '00') {
            #    $Matches.num1 = $null;
            #    $Matches.num2 = $null;
            #} else {
            #    $Matches.num1 = '.' + $Matches.num1
            #}
            #
            #$numeroVersao = $Matches.major +'.'+ $Matches.minor +'.'+ $Matches.path + ($Matches.stage+$Matches.num1+$Matches.num2)
            #$numeroVersao
            $Matches
            #Write-Host "##vso[task.setvariable variable=BuildNumberFormatado;]$numeroVersao"
        }
    } catch {
        Write-Host "$_.Exception"
    }
}



#$aaa = "0.1.0-beta.8+60";   # 0.1.0-beta-0008060
##$aaa = "0.1.0-beta.15";     # 0.1.0-beta-0015000
#$aaa = "0.1.3-beta";
#$aaa = "0.1.0";
#$aaa = "0.1.0-alpha.68";
#$aaa = "0.1.0-alpha.68";


#$x1 = $aaa -match '(([a-z]+-?)(.)((\d{0,})((\+)(\d{0,})|)|)|)'
#$x1 = $aaa -match '([a-z]+-?)(.)(\d{0,})'
#$x1 = $aaa -match '(\d{0,}).(\d{0,}).(\d{0,})((-[a-z]+-?)|)'




#if ($Matches.stage -ne $null) {
#    $Matches.num1 = (@{$false='0';$true=$Matches.num1}[$Matches.num1 -ne $null]).PadLeft(2,'0')
#    $Matches.num2 = (@{$false='0';$true=$Matches.num2}[$Matches.num2 -ne $null]).PadLeft(3,'0')
#    $Matches.stage = '-' + $Matches.stage +'.'
#}
#
##
#$x1 = $Matches.major +'.'+ $Matches.minor +'.'+ $Matches.path + ($Matches.stage+$Matches.num1+$Matches.num2)
#$x1

#$Matches.minor +'.'+
#($Matches.stage+$num1+$num2)

#[system.String]::Join(".", $x1+)

#$Matches

#$x1 = $aaa -match '(\w+)(\.)(\d{1,})[(\+)(\d{1,})]'
#$x1 = $aaa -replace '(a-z)(.)(\d{1,})((\+)(\d{1,})|())', '$1$3$6'
#$x1 = $aaa -replace '(\.)(\d{0,})(\+)(\d{0,})',(('$4').PadLeft(5,'0'))

#"860".PadRight(5,'0')
#"15".PadRight(5,'0')






#clear
#$aaa = "0.1.0-beta.8+60";   # 0.1.0-beta-0008060
##$aaa = "0.1.0-beta.1";     # 0.1.0-beta-0015000
##$aaa = "0.1.0-beta";
#$aaa = "0.1.0";
##$aaa = "0.1.0-alpha.68";
##$aaa = "0.1.0-alpha.68";
#
#
#$Matches.Clear();
#$x1 = $aaa -match '(([a-z]+-?)(.)((\d{0,})((\+)(\d{0,})|)|)|)'
##$x1 = $aaa -match '([a-z]+-?)(.)(\d{0,})'
##$x1 = $aaa -match '(\d{0,}).(\d{0,}).(\d{0,})((-[a-z]+-?)|)'
#$x1 = $aaa -match '(?<major>\d+).(?<minor>\d+).(?<path>\d+)(-(?<stage>[A-Za-z-]+-?)(.)(?<num1>\d+)(\+)(?<num2>\d+)|)'
##                       1     2     3     4
#
#
#$x1 =  @( 
# $Matches.major
#,$Matches.minor
#,$Matches.path
#,$Matches.stage
#,@{$false='';$true=$Matches.num1.PadLeft(5,'0')}[$Matches.num1 -ne $null]
#,@{$false='';$true=$Matches.num2.PadLeft(5,'0')}[$Matches.num2 -ne $null]
#);
#
#
##$Matches
#
##$x1 = $aaa -match '(\w+)(\.)(\d{1,})[(\+)(\d{1,})]'
##$x1 = $aaa -replace '(a-z)(.)(\d{1,})((\+)(\d{1,})|())', '$1$3$6'
##$x1 = $aaa -replace '(\.)(\d{0,})(\+)(\d{0,})',(('$4').PadLeft(5,'0'))
#
##"860".PadRight(5,'0')
##"15".PadRight(5,'0')


#script: 'echo "##vso[task.setvariable variable=NuGetVersion;isOutput=true]$(Write-Output (GitVersion.exe $(Build.Repository.LocalPath) /output json | ConvertFrom-Json).NuGetVersion)"'

#$config = { 
#                plugins=(("@semantic-release/git"), 
#                         ("@semantic-release/commit-analyzer"), 
#                         ("semantic-release-ado", 
#                         {
#                            setOnlyOnRelease = $false
#                         })), 
#                branches=('master'); 
#                repositoryUrl="$(Build.Repository.Uri)" 
#           }
