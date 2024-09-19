clear
Get-Job | Remove-Job

$jobArquivo = start-job -ScriptBlock {
    c:\Users\aadje\Downloads\a\BgmRodotec.Arquivo\BgmRodotec.Arquivo.Database\Migrate.exe --conn "Data Source=ALE\SQLEXPRESS;Initial Catalog=ArquivoTeste;User ID=sa;Password=bgm123;" -db SqlServer -a c:\Users\aadje\Downloads\a\BgmRodotec.Arquivo\BgmRodotec.Arquivo.Database\BgmRodotec.Arquivo.Database.dll
}

$jobAuth = start-job -ScriptBlock {
    c:\Users\aadje\Downloads\a\BgmRodotec.Auth\BgmRodotec.Auth.Database\Migrate.exe --conn "Data Source=ALE\SQLEXPRESS;Initial Catalog=AuthTeste;User ID=sa;Password=bgm123;" -db SqlServer -a c:\Users\aadje\Downloads\a\BgmRodotec.Auth\BgmRodotec.Auth.Database\BgmRodotec.Auth.Database.dll
}

$jobNotificacao = start-job -ScriptBlock {
    c:\Users\aadje\Downloads\a\BgmRodotec.Notificacao\BgmRodotec.Notificacao.Database\Migrate.exe --conn "Data Source=ALE\SQLEXPRESS;Initial Catalog=NotificacaoTeste;User ID=sa;Password=bgm123;" -db SqlServer -a c:\Users\aadje\Downloads\a\BgmRodotec.Notificacao\BgmRodotec.Notificacao.Database\BgmRodotec.Notificacao.Database.dll
}

Get-Job | Wait-Job
Get-Job | Receive-Job 
#$jobArquivo
#Receive-Job $jobAuth
#Receive-Job $jobNotificacao

