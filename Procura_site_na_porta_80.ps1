
#https://pt.stackoverflow.com/questions/139796/toda-conex%C3%A3o-https-e-http-sempre-est%C3%A1-atrelada-a-porta-443-e-80-respectivamente

#Por que usar portas diferentes?
#	Obscurecimento: Ao usar uma porta não padrão, você torna menos óbvio o serviço que está sendo executado, o que pode dificultar ataques automatizados.
#	Múltiplos sites na mesma máquina: Se você precisa hospedar vários sites na mesma máquina, usar portas diferentes permite isolar cada site, aumentando a segurança.
#	Evitar conflitos: Em ambientes complexos, pode ser necessário usar portas diferentes para evitar conflitos com outros serviços.
#Quais os riscos?
#	Desconhecimento do usuário: A maioria dos usuários está acostumada a digitar apenas o nome do domínio, sem especificar a porta. Isso pode levar a dificuldades de acesso.
#	Configuração de firewalls: Você precisará configurar os firewalls para permitir o tráfego na porta escolhida, o que pode ser um processo mais complexo.
#	Menor compatibilidade: Alguns dispositivos ou softwares podem ter dificuldades para se conectar a portas não padrão.


Clear-Host
$sitePorta80 = (Get-Website | Where-Object { 
    (Get-WebBinding -name $_.name | Where-Object {
        $_.bindingInformation -match ':80:'
    }) 
}).name

if ($sitePorta80 -eq $null) {
    Write-Host "##vso[task.logissue type=error]--------------------------------------------------------------------------------------------------------"   
    Write-Host "##vso[task.logissue type=error]Nenhum site encontrado na porta 80."
    Write-Host "##vso[task.logissue type=error]--------------------------------------------------------------------------------------------------------"   
    Throw 
}

Write-Host "##vso[task.setvariable variable=SITE_PORTA_80;]$sitePorta80"
Write-Output ('Site porta 80: ' + $sitePorta80)