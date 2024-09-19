param (
$sistemas = (
    "ARR;ARR;Arrecadacao",
    "FLP;FRQ;Frequencia",
    "MAN;ABA;Abastecimento",
    "FIN;ATF;Ativo",
    "FIN;BCO;Bancos",
    "CGS;CGS;Cargas",
    "ARR;CNC;Conciliacao",
    "FIN;CPG;ContasPagar",
    "MAN;CPN;Componente",
    "MAN;CPR;Compras",
    "FLP;CRA;Cracha",
    "FIN;CRC;ContasReceber", 
    "FIN;CTB;Contabilidade",
    "CGS;CTE;Terceiros",
    "FIN;CTR;Controle",
    "MAN;DVS;DVS",
    "ARR;EMTU;EMTU",
    "ARR;ESC;Escala",
    "FIN;ESF;Escrituracao",
    "MAN;EST;Estoque",
    "FLP;FLP;Folha",
    "FLP;FRE;Fretamento",
    "MAN;FRT;Frota",
    "CGS;GCC;GCC",
    "CGS;CTE;Terceiros",
    "CGS;GRD;GGRisco",
    "CGS;CTE;Terceiros",
    "CTR;GRP;GlobusReport",
    "CGS;CTE;Terceiros",
    "MAN;IGP;InfGeoPosicionamento",
    "MAN;MAN;Manutencao",
    "MAN;MOT;Motor",
    "ARR;PAS;Passes",
    "ARR;IGP;InfGeoPosicionamento",
    "ARR;PLT;Plantao",
    "MAN;PNE;Pneus",
    "FIN;PRT;Menu",
    "ARR;PVT;PVT",
    "ARR;RET;Retaguarda",
    "ARR;ROD;EscalaRodoviaria",
    "ARR;SAF;Sistema Anti-fraude",
    "FLP;SRH;RecursosHumanos",
    "FLP;TER;Terminal",
    "ARR;TRF;Trafego",
    "TRR;TRR;TRR",
    "CGS;TTM;TratamentoTermico",
    "ARR;TUR;Turismo",
    "ARR;VBE;Venda Bilhetes",
    "ARR;RDA;EscalaDiariaAutomatica",
    "ARR;Coeficientes;Coeficientes",
    "ARR;Prj_Prodata;Prj_Prodata"
    )
<#"Arrecadacao.dpr",
  "AgendaImpAutomatica.dpr",
  "BilhetagemEletronica.dpr",
  "ImportacaoFilipeta.dpr",
  "PRJ_PRODATA.dpr",
  "Coeficientes.dpr",
  "CNC.dpr","EMTU.dpr",
  "Escala.dpr",
  "EscalaRodoviaria.dpr",
  "EscalaRodoviariaAutomatica.dpr",
  "InfGeoPosicionamento.dpr",
  "Passes.dpr",
  "Plantao.dpr",
  "AppService_SaidaRecolAuto.dpr",
  "PVT.dpr",
  "Retaguarda.dpr",
  "ImpMaquina.dpr",
  "SAF.dpr",
  "Trafego.dpr",
  "Turismo.dpr",
  "VendaBilhetes.dpr",
  "BaixaAutomaticaReservasComBoletos.dpr",
  "ControlaProgLeitora.dpr",
  "LeitoraDeBilhetes.dpr",
  "RDA.dpr"
#>
)

$exclusoes = ("PRJ_PRODATA.EXE","BILHETAGEMELETRONICA.EXE")
$compactarSemPasta = ("Coeficientes","Prj_Prodata")

$pastaDLLs = "C:\BgmRodotec\Globus\src\Globus\Sistemas"
$sDir = "\\dc01\Build\Globus\master\"
[string]$sDirDest = "c:\Trabalho\ArquivosCompactados\Globus"
[string]$files = ""

function Inicia() {    

    cls
    
    $folder = Get-ChildItem $sDir | where { $_.PSisContainer } | Sort CreationTime -Descending | Select -First 1
    #$folder = "Globus_20161221.12"

    $sDir = $sDir + $folder

    if ($sDir -ne "") {
        CopiaArquivos    
        Finaliza
    }

}

function ProcessaModulos() {
    foreach($sistema in $sistemas) {
        
    }

}

function CopiaArquivos() {
    
    foreach($sistema in $sistemas) {

        $setor,$sigla,$modulo = $sistema.Split(';')

        if ($setor -ne "ARR") {
            continue}

        Write-Host 

        Write-Host "Setor / sigla / módulo " $setor / $sigla / $modulo

        if ($sigla -eq "Prj_Prodata") {
            CopiaPrjProdata
        } else {
            $files = Get-ChildItem "$sDir\Sistemas\$modulo" -Recurse | Where-Object{($_.FullName -like '*.exe' -or $_.FullName -like '*.rpt' -or $_.FullName -like '*.rav')};
        }

        foreach($file in $files) {

            if (($sigla -eq "ARR") -and ($exclusoes -contains  $file.Name)) {
                continue}
        
            $newDir = $file.FullName
            $newDir = $newDir.replace("$sDir", "$sDirDest")
            $newDir = $newDir.replace($file.Name, "")     

            Write-Host "Copiando" $file.Name "para" $newDir "...";

            $newFile = $newDir+$file.Name

            if (Test-Path $newDir) {
                Copy-Item -Path $file.FullName -Destination $newFile
            } else {
                New-Item -Path $newDir -ItemType directory -Force
                Copy-Item -Path $file.FullName -Destination $newDir
            }
        }

        CopiaDLLs

        CopiaAdicionais

        CompactaArquivos

        ApagaArquivosTemporarios
    }
}

function CopiaDLLs() {

    $dlls = Get-ChildItem "$pastaDLLs\$modulo" | Where-Object{($_.FullName -like '*.dll')};

    foreach($dll in $dlls) {

        $diretorioDestino = $dll.FullName

        $diretorioDestino = $diretorioDestino.Replace("$pastaDLLs", "$sDirDest\Sistemas")

        $diretorioDestino = $diretorioDestino.Replace($dll.Name, "")

        $dllDestino = $diretorioDestino+$dll.Name

        Copy-Item -Path $dll.FullName -Destination $diretorioDestino -Force

    }
}

function CopiaAdicionais() {

    switch($sigla) {
        'RET' { Retaguarda }
        'EMTU' { EMTU }
        'PLT' { Plantao }
        default {
        }
    }   
}

function CopiaPrjProdata() {
    $filesProdata = Get-ChildItem "$sDir\Sistemas\Arrecadacao\$modulo" -Recurse;

    foreach($fileProdata in $filesProdata) {

        $newDir = $file.FullName
        $newDir = $newDir.replace("$sDir", "$sDirDest")
        $newDir = $newDir.replace($file.Name, "")     

        Write-Host "Copiando" $file.Name "para" $newDir "...";

        $newFile = $newDir+$file.Name

        if (Test-Path $newDir) {
            Copy-Item -Path $file.FullName -Destination $newFile
        } else {
            New-Item -Path $newDir -ItemType directory -Force
            Copy-Item -Path $file.FullName -Destination $newDir
        }
    }    
}

function CompactaArquivos() {
    Write-Host
    Write-Host "Criando arquivo zip..."

    if ($compactarSemPasta -contains $sigla) {
        Compress-Archive -Path "C:\Trabalho\ArquivosCompactados\$modulo" -DestinationPath "C:\Trabalho\ArquivosCompactados\$sigla.zip" -Force
    } else {        
        Compress-Archive -Path "C:\Trabalho\ArquivosCompactados\Globus" -DestinationPath "C:\Trabalho\ArquivosCompactados\$sigla.zip" -Force
    }
}

function ApagaArquivosTemporarios() {

    Write-Host "Apagando arquivos temporários ..."
    Remove-Item $sDirDest -Recurse -Force
}

function Finaliza() {
    start "http://intranet.portaldocliente.net/Ticket/NovoTicketAnalista"
}

function EMTU() {
    
    $scripts = Get-ChildItem -Path "$sDir\Sistemas\EMTU\Scripts"

    foreach($script in $scripts) {
        
        $newDir = $script.FullName
        $newDir = $newDir.replace("$sDir", "$sDirDest")
        $newDir = $newDir.replace($script.Name, "")     

        Write-Host "Copiando" $script.Name "para" $newDir "...";

        $newFile = $newDir+$sDirDest.Name

        if (Test-Path $newDir) {
            Copy-Item -Path $script.FullName -Destination $newFile
        } else {
            New-Item -Path $newDir -ItemType directory -Force
            Copy-Item -Path $script.FullName -Destination $newDir
        }
    }    
}

function Plantao() {

    $origem = "$sDir\Sistemas\Plantao\AppService_SaidaRecolAuto\AppService_SaidaRecolAuto.exe"
    $destino = $sDirDest + "\Sistemas\Plantao\AppService_SaidaRecolAuto\AppService_SaidaRecolAuto.exe"

    if (Test-Path $destino) {
        Copy-item -Path $origem -Destination $destino
    } else {
        New-Item -Path $destino -ItemType directory -Force
        Copy-Item -Path $origem.FullName -Destination $destino
    }

}

function Retaguarda() {

    $origem = "$sDir\Sistemas\Arrecadacao\AgendaImpAutomatica.exe"
    $destino = $sDirDest + "\Sistemas\Arrecadacao\AgendaImpAutomatica.exe"
    $folderDestAux = $sDirDest + "\Sistemas\Arrecadacao\"

    if (Test-Path $destino) {
        Copy-item -Path $origem -Destination $destino
    } else {
        New-Item -Path $folderDestAux -ItemType directory -Force
        Copy-Item -Path $origem -Destination $destino
    }
}

Inicia
