#Script para remover todos os arquivo de backup gerado pelo delphi
clear
$diretorios = Get-ChildItem C:\Users\antonio.pinheiro\Dropbox\Densenvolvimento\ #|Where-Object {$_.Attributes.Equals("Directory")}
foreach($itens in $diretorios )
{
  $Arquivos = Get-ChildItem  C:\Users\antonio.pinheiro\Dropbox\Densenvolvimento\$itens 
  ForEach($item in $Arquivos)
  {    


      if($item.Extension.Contains("bak"))
      {
         Remove-Item $item.FullName
         echo $("Arquivo " + $item.FullName + " removido")
      }
  }   
}

 