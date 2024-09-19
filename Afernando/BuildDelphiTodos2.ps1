param (
	[string]$sDir = "C:\TFSAgent\_work\3\s",
	[string]$aDir = "C:\TFSAgent\_work\3\a",
	[string]$bDir = "C:\TFSAgent\_work\3\b",
    [string]$PFilesDir = "C:\TFSAgent\BuildTools\Delphi",

    [string]$IncludeDir = "$sDir\Globus\Utilitarios;$sDir\Globus;$sDir;$PFilesDir\Borland\jcl\source\include",
    [string]$LibDirBgm = "$sDir\Globus\Comum\Units;$sDir\Globus\componentes;$sDir\Globus\componentes7;$sDir\Globus\component\delphi70;$sDir\Globus\componentes\rdprintd7;$sDir\Globus\componentes7\zipmaster;$sDir\Globus\componentes\crystal7vcl4;$sDir\Globus\componentes\jvcbarcode;$sDir\Globus\componentes\exportaqreport\source;$sDir\Globus\componentes\nfe;$sDir\Globus\componentes7\rxlibd7\units;$sDir\Globus\componentes\email;$sDir\Globus\Componentes\MaterEdit;$sDir\Globus\componentes7\sakemail;$sDir\Globus\componentes\barras;$sDir\Globus\Componentes\GLBFilter;$sDir\Globus\componentes\Cargas;$sDir\Globus\componentes\contaspagar;$sDir\Globus\componentes\ContasReceber;$sDir\Globus\Componentes\BarrasNovo\lib32;$sDir\Globus\componentes\emailnovo;$sDir\Globus\Componentes\FormatParam;$sDir\Globus\Componentes\Calendarios;$sDir\Globus\Componentes\Frequencia;$sDir\Globus\Componentes\SelecaoAle;$sDir\Globus\Componentes\BGMXML;$sDir\Globus\Componentes\SynEdit;$sDir\Globus\Componentes7\ZipMaster;$sDir\Globus\Componentes7\ZipMaster\Units;$sDir\Globus\Componentes7\ZipMaster\Units\VCL;$sDir\Globus\Componentes7\CoreLab;$sDir\Globus\Componentes7\CoreLab\Delphi7;$sDir\Globus\Componentes7\CoreLab\DbxOda;$sDir\Globus\Componentes7\GlbReport;$sDir\Globus\Componentes\SynEdit\Packages;$sDir\Globus\Componentes\SynEdit\Source;$sDir\Globus\Componentes\SynEdit\SynGen;$sDir\Globus\Componentes\SynEdit\SynGen\CVS;$sDir\Globus\Componentes\SynEdit\Source\CVS;$sDir\Globus\Componentes\SynEdit\Packages\CVS;$sDir\Globus\Componentes\CTe;$sDir\Globus\Componentes\Systray;$sDir\Globus\Componentes7\ACBr\source\Pascal;$sDir\Globus\Componentes\Apisul;$sDir\Globus\Componentes\Opentech;$sDir\Globus\Componentes\NFSe;$sDir\Globus\Componentes\Carbocloro;$sDir\Globus\Componentes\DSPACK234\src\DSPack;$sDir\Globus\Componentes\DSPACK234\src\DirectX9;$sDir\Globus\Componentes7\RxLibD7;$sDir\Globus\Componentes7\PngComponents\Source\obj;$sDir\Globus\Componentes7\PngComponents\Source\;$sDir\Globus\Utilitarios;$sDir\Globus\Componentes7\VclSkin_D7\Skin",
    [string]$LibDirDelphi = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\Delphi7\Bin;$PFilesDir\Borland\Delphi7\Imports;$PFilesDir\Borland\Delphi7\Projects\Bpl;$PFilesDir\Borland\Delphi7\Source\ToolsAPI;$PFilesDir\Borland\jcl\lib\d7;$PFilesDir\Borland\jvcl\lib\D7;$PFilesDir\Borland\jvcl\common;$PFilesDir\Borland\jvcl\Resources;$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\jcl\source\include;$PFilesDir\Borland\Delphi7\XDBGrid;$PFilesDir\Borland\Delphi7\XDBGrid\Source;$PFilesDir\Borland\Delphi7\Rave5\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Lib\D7;$PFilesDir\Gnostice\eDocEngine VCL\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Source\QR;$PFilesDir\Gnostice\Shared3\Source\Rtl;$PFilesDir\Gnostice\Shared3\Lib\D7;",
	[string]$LibSistemas = "$sDir\Globus\Sistemas\ContasPagar;$sDir\Globus\Sistemas\ContasReceber;$sDir\Globus\Sistemas\BIO;$sDir\Globus\Sistemas\Cargas\AUTOMATIZACAO;$sDir\Globus\SISTEMAS;$sDir\Globus\Sistemas\GGRisco;$sDir\Globus\Sistemas\Cargas;$sDir\Globus\Sistemas\Abastecimento;$sDir\Globus\Sistemas\plantao;$sDir\Globus\Sistemas\ACIDENTES;$sDir\Globus\Sistemas\Arrecadacao;$sDir\Globus\Sistemas\Ativo;$sDir\Globus\Sistemas\Bancos;$sDir\Globus\Sistemas\Componente;$sDir\Globus\Sistemas\Compras;$sDir\Globus\Sistemas\gcc;$sDir\Globus\Sistemas\ContasAPagar;$sDir\Globus\Sistemas\ContasAReceber;$sDir\Globus\Sistemas\Contabilidade;$sDir\Globus\Sistemas\Controle;$sDir\Globus\Sistemas\DESPACHANTE;$sDir\Globus\Sistemas\DVS;$sDir\Globus\Sistemas\Escala;$sDir\Globus\Sistemas\EscalaRodoviaria;$sDir\Globus\Sistemas\Escrituracao;$sDir\Globus\Sistemas\Estoque;$sDir\Globus\Sistemas\Frequencia;$sDir\Globus\Sistemas\Fretamento;$sDir\Globus\Sistemas\Frota;$sDir\Globus\Sistemas\Folha;$sDir\Globus\Sistemas\Manutencao;$sDir\Globus\Sistemas\Motor;$sDir\Globus\Sistemas\Passes;$sDir\Globus\Sistemas\PVT;$sDir\Globus\Sistemas\Pneus;$sDir\Globus\Sistemas\RecursosHumanos;$sDir\Globus\Sistemas\Retaguarda;$sDir\Globus\Sistemas\SEGURANCA;$sDir\Globus\Sistemas\Trafego;$sDir\Globus\Sistemas\Terminal;$sDir\Globus\Sistemas\Turismo;$sDir\Globus\Sistemas\comodato;$sDir\Globus\Sistemas\TRR;$sDir\Globus\Sistemas\TratamentoTermico;$sDir\Globus\Sistemas\Terceiros;$sDir\Globus\Sistemas\Venda Bilhetes;$sDir\Globus\Sistemas\Gerador;$sDir\Globus\Sistemas\InfGeoPosicionamento;$sDir\Globus\Sistemas\Cracha\Residentes;$sDir\Globus\Sistemas\EMTU;",
	[string]$ResourcesDir = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\JVCL\resources;$LibSistemas",
	
	[string]$LibDirFull = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\Delphi7\Bin;$PFilesDir\Borland\Delphi7\Imports;$PFilesDir\Borland\Delphi7\Projects\Bpl;$PFilesDir\Borland\Delphi7\Source\ToolsAPI;$PFilesDir\Gnostice\eDocEngine VCL\Lib\D7;$PFilesDir\Gnostice\eDocEngine VCL\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Source\QR;$PFilesDir\Gnostice\Shared3\Source\Rtl;$PFilesDir\Gnostice\Shared3\Lib\D7;$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\jcl\source\include;$sDir\Globus\componentes;$sDir\Globus\componentes7;$sDir\Globus\component\delphi70;$sDir\Globus\componentes\rdprintd7;$sDir\Globus\componentes7\zipmaster;$sDir\Globus\componentes\crystal7vcl4;$sDir\Globus\componentes\jvcbarcode;$sDir\Globus\componentes\exportaqreport\source;$sDir\Globus\componentes\nfe;$sDir\Globus\componentes7\rxlibd7\units;$sDir\Globus\componentes\email;$sDir\Globus\Componentes\MaterEdit;$sDir\Globus\componentes7\sakemail;$sDir\Globus\componentes\barras;$sDir\Globus\Componentes\GLBFilter;$sDir\Globus\componentes\Cargas;$sDir\Globus\componentes\contaspagar;$sDir\Globus\componentes\ContasReceber;$sDir\Globus\Componentes\BarrasNovo\lib32;$sDir\Globus\componentes\emailnovo;$sDir\Globus\Componentes\FormatParam;$sDir\Globus\Componentes\Calendarios;$sDir\Globus\Componentes\Frequencia;$sDir\Globus\Componentes\SelecaoAle;$sDir\Globus\Componentes\BGMXML;$sDir\Globus\Componentes\SynEdit;$sDir\Globus\Componentes7\ZipMaster;$sDir\Globus\Componentes7\ZipMaster\Units;$sDir\Globus\Componentes7\ZipMaster\Units\VCL;$sDir\Globus\Componentes7\CoreLab;$sDir\Globus\Componentes7\CoreLab\Delphi7;$sDir\Globus\Componentes7\CoreLab\DbxOda;$sDir\Globus\Componentes7\GlbReport;$sDir\Globus\Componentes\SynEdit\Packages;$sDir\Globus\Componentes\SynEdit\Source;$sDir\Globus\Componentes\SynEdit\SynGen;$sDir\Globus\Componentes\SynEdit\SynGen\CVS;$sDir\Globus\Componentes\SynEdit\Source\CVS;$sDir\Globus\Componentes\SynEdit\Packages\CVS;$sDir\Globus\Componentes\CTe;$sDir\Globus\Componentes\Systray;$sDir\Globus\Componentes7\ACBr\source\Pascal;$sDir\Globus\Componentes\Apisul;$sDir\Globus\Componentes\Opentech;$sDir\Globus\Componentes\NFSe;$sDir\Globus\Componentes\Carbocloro;$sDir\Globus\Utilitarios;$sDir\Globus\Comum\Units;$LibSistemas;$PFilesDir\Borland\Delphi7\XDBGrid;$PFilesDir\Borland\Delphi7\XDBGrid\Source;$sDir\Globus\Componentes\DSPACK234\src\DSPack;$sDir\Globus\Componentes\DSPACK234\src\DirectX9;$PFilesDir\Borland\Delphi7\Rave5\Lib;$PFilesDir\Borland\jcl\lib\d7;$PFilesDir\Borland\jvcl\lib\D7;$PFilesDir\Borland\jvcl\common;$PFilesDir\Borland\jvcl\Resources;$sDir\Globus\Componentes7\RxLibD7;$sDir\Globus\Componentes7\PngComponents\Source\obj;$sDir\Globus\Componentes7\PngComponents\Source\;$sDir\Globus\Componentes7\VclSkin_D7\Skin;",
	[string]$ObjectsDir = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\Delphi7\Bin;$PFilesDir\Borland\Delphi7\Imports;$PFilesDir\Borland\Delphi7\Projects\Bpl;$PFilesDir\Borland\Delphi7\Source\ToolsAPI;$PFilesDir\Gnostice\eDocEngine VCL\Lib\D7;$PFilesDir\Gnostice\eDocEngine VCL\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Source\QR;$PFilesDir\Gnostice\Shared3\Source\Rtl;$PFilesDir\Gnostice\Shared3\Lib\D7;$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\jcl\source\include;$sDir\Globus\componentes;$sDir\Globus\componentes7;$sDir\Globus\component\delphi70;$sDir\Globus\componentes\rdprintd7;$sDir\Globus\componentes7\zipmaster;$sDir\Globus\componentes\crystal7vcl4;$sDir\Globus\componentes\jvcbarcode;$sDir\Globus\componentes\exportaqreport\source;$sDir\Globus\componentes\nfe;$sDir\Globus\componentes7\rxlibd7\units;$sDir\Globus\componentes\email;$sDir\Globus\Componentes\MaterEdit;$sDir\Globus\componentes7\sakemail;$sDir\Globus\componentes\barras;$sDir\Globus\Componentes\GLBFilter;$sDir\Globus\componentes\Cargas;$sDir\Globus\componentes\contaspagar;$sDir\Globus\componentes\ContasReceber;$sDir\Globus\Componentes\BarrasNovo\lib32;$sDir\Globus\componentes\emailnovo;$sDir\Globus\Componentes\FormatParam;$sDir\Globus\Componentes\Calendarios;$sDir\Globus\Componentes\Frequencia;$sDir\Globus\Componentes\SelecaoAle;$sDir\Globus\Componentes\BGMXML;$sDir\Globus\Componentes\SynEdit;$sDir\Globus\Componentes7\ZipMaster;$sDir\Globus\Componentes7\ZipMaster\Units;$sDir\Globus\Componentes7\ZipMaster\Units\VCL;$sDir\Globus\Componentes7\CoreLab;$sDir\Globus\Componentes7\CoreLab\Delphi7;$sDir\Globus\Componentes7\CoreLab\DbxOda;$sDir\Globus\Componentes7\GlbReport;$sDir\Globus\Componentes\SynEdit\Packages;$sDir\Globus\Componentes\SynEdit\Source;$sDir\Globus\Componentes\SynEdit\SynGen;$sDir\Globus\Componentes\SynEdit\SynGen\CVS;$sDir\Globus\Componentes\SynEdit\Source\CVS;$sDir\Globus\Componentes\SynEdit\Packages\CVS;$sDir\Globus\Componentes\CTe;$sDir\Globus\Componentes\Systray;$sDir\Globus\Componentes7\ACBr\source\Pascal;$sDir\Globus\Componentes\Apisul;$sDir\Globus\Componentes\Opentech;$sDir\Globus\Componentes\NFSe;$sDir\Globus\Componentes\Carbocloro;$sDir\Globus\Utilitarios;$sDir\Globus\Comum\Units;$LibSistemas;$PFilesDir\Borland\Delphi7\XDBGrid;$PFilesDir\Borland\Delphi7\XDBGrid\Source;$sDir\Globus\Componentes\DSPACK234\src\DSPack;$sDir\Globus\Componentes\DSPACK234\src\DirectX9;$PFilesDir\Borland\Delphi7\Rave5\Lib;$PFilesDir\Borland\jcl\lib\d7;$PFilesDir\Borland\jvcl\lib\D7;$PFilesDir\Borland\jvcl\common;$PFilesDir\Borland\jvcl\Resources;$sDir\Globus\Componentes7\RxLibD7;$sDir\Globus\Componentes7\PngComponents\Source\obj;$sDir\Globus\Componentes7\PngComponents\Source\;$sDir\Globus\Componentes7\VclSkin_D7\Skin;",
	
    [string]$BuildOptions = "-`$A8 -`$B- -`$C+ -`$D+ -`$E- -`$F- -`$G+ -`$H+ -`$I+ -`$J- -`$K- -`$L+ -`$M- -`$N+ -`$O+ -`$P+ -`$Q- -`$R- -`$S- -`$T- -`$U- -`$V+ -`$W- -`$X+ -`$YD -`$Z1 -cg -AWinTypes=Windows;WinProcs=Windows;DbiTypes=BDE;DbiProcs=BDE;DbiErrs=BDE; -B -H+ -W+ -M -`$M16384,1048576 -K`$00400000 -LE""c:\program files (x86)\borland\delphi7\Projects\Bpl"" -LN""c:\program files (x86)\borland\delphi7\Projects\Bpl"" -w-UNSAFE_TYPE -w-UNSAFE_CODE -w-UNSAFE_CAST -w-UNIT_PLATFORM "
 )

$BreakOnError =$true

[int]$TotalProjetos = 69
[int]$Count = 0

$scriptBlock = {
	param ($Exe)
	$AspackDir = "C:\Program Files (x86)\ASPack"
	
    $pinfo = New-Object System.Diagnostics.ProcessStartInfo
    $pinfo.WorkingDirectory = "$AspackDir\"
    $pinfo.FileName = "$AspackDir\ASPack.exe"
    $pinfo.RedirectStandardError = $true
    $pinfo.RedirectStandardOutput = $true
    $pinfo.UseShellExecute = $false
    $pinfo.Arguments = """$Exe"" /U /B- /S"
    $p = New-Object System.Diagnostics.Process
    $p.StartInfo = $pinfo
    $p.Start() | Out-Null

    $stdout = $p.StandardOutput.ReadToEnd()
    $stderr = $p.StandardError.ReadToEnd()
    $now=Get-Date -format "dd-MM-yyyy HH:mm:ss"

    If ($p.ExitCode -gt 0) {
        #Throw?
        If ($BreakOnError -eq $true) {
            Write-Host "$now - Ocorreu um erro ao empacotar o executável $Exe. Verifique os logs para maiores detalhes"
            Write-Host "$now - stdout: $stdout"
            throw 
        } else {
            Write-Host "$now - Ocorreu um erro ao compilar o executável $Exe. Verifique os logs para maiores detalhes"
            Write-Host "$now - stdout: $stdout"
            #Write-Host "$now - stderr: $stderr"
        }
    } else {
		
        Write-Host "$now - Compactação (ASPack) do modulo $Exe concluida com sucesso! "
    }
    
}

function BuildProjeto ($ProjectName, $ProjectDir, $ReleaseDir)
{
	Try{
		New-Item "$ReleaseDir" -type directory -force > $null
	}
	
	Catch{
	  Write-Host "$now - Ocorreu um erro ao criar o diretorio: $ReleaseDir "
	  Write-Host "$now - stdout: $_.Exception"
	}
	
	$ExeName = "$ReleaseDir\$ProjectName" -replace ".dpr", '.exe'
     
    $UnitDir = "$bDir\$ProjectName"  -replace ".dpr", ''
    
    Try{
		New-Item "$UnitDir" -type directory -force > $null
	}
	
	Catch{}
    

    $a = "$BuildOptions $ProjectName -E""$ReleaseDir"" -U""$LibDirFull;$UnitDir;"" -N""$UnitDir"" -R""$ResourcesDir;"" -O""$ObjectsDir"" -I""$IncludeDir;"""

	Try{
		$pinfo = New-Object System.Diagnostics.ProcessStartInfo
		$pinfo.WorkingDirectory = $ProjectDir
		$pinfo.FileName = "$PFilesDir\Borland\Delphi7\bin\dcc32"
		$pinfo.RedirectStandardError = $true
		$pinfo.RedirectStandardOutput = $true
		$pinfo.UseShellExecute = $false
		$pinfo.Arguments = "$a"
		$p = New-Object System.Diagnostics.Process
		$p.StartInfo = $pinfo
		$p.Start() | Out-Null
	}
	
	Catch{
	  Write-Host "$now - Ocorreu um erro ao iniciar o processo dcc32: $ProjectDir "
	  Write-Host "$now - stdout: $_.Exception"
	}
    $stdout = $p.StandardOutput.ReadToEnd()
    $stderr = $p.StandardError.ReadToEnd()
    $now=Get-Date -format "dd-MM-yyyy HH:mm:ss"

    If ($p.ExitCode -gt 0) {
        #Throw?
        If ($BreakOnError -eq $true) {
            Write-Host "$now - Ocorreu um erro ao compilar o projeto $ProjectName. Verifique os logs para maiores detalhes"
            Write-Host "$now - stdout: $stdout"
            throw 
        } else {
            Write-Host "$now - Ocorreu um erro ao compilar o projeto $ProjectName. Verifique os logs para maiores detalhes"
            Write-Host "$now - stdout: $stdout"
            #Write-Host "$now - stderr: $stderr"
        }
    } else {
		$script:Count += 1
		Write-Host "$now - Compilação do modulo $ProjectName concluida com sucesso! ($script:Count de $TotalProjetos)"
		Start-Job -ScriptBlock $scriptBlock -ArgumentList @($ExeName)
        
    }
    $p.ExitCode
}


$now=Get-Date -format "dd/MM/yyyy HH:mm"

Write-Host "$now - Inicio do Build"
Write-Host ""

Write-Host "$now - Criando DataHora.txt"
$DataHora = "Edit1.Text := '$now';" | Out-File -NoNewline -Encoding "Ascii" "$sDir\Globus\Sistemas\DataHora.txt"

$now=Get-Date -format "dd/MM/yyyy HH:mm:ss"

Write-Host "$now - Iniciando projetos"

$i = BuildProjeto -ProjectName Arrecadacao.dpr -ProjectDir "$sDir\Globus\Sistemas\Arrecadacao" -ReleaseDir "$aDir\Globus\Sistemas\Arrecadacao"
$i = BuildProjeto -ProjectName AgendaImpAutomatica.dpr -ProjectDir "$sDir\Globus\Sistemas\Arrecadacao" -ReleaseDir "$aDir\Globus\Sistemas\Arrecadacao"
$i = BuildProjeto -ProjectName BilhetagemEletronica.dpr -ProjectDir "$sDir\Globus\Sistemas\Arrecadacao\BilhetagemMetra" -ReleaseDir "$aDir\Globus\Sistemas\Arrecadacao\BilhetagemMETRA"
$i = BuildProjeto -ProjectName ImportacaoFilipeta.dpr -ProjectDir "$sDir\Globus\Sistemas\Arrecadacao\ImportacaoFILIPETA" -ReleaseDir "$aDir\Globus\Sistemas\Arrecadacao"
$i = BuildProjeto -ProjectName PRJ_PRODATA.dpr -ProjectDir "$sDir\Globus\Sistemas\Arrecadacao\PRJ_PRODATA" -ReleaseDir "$aDir\Globus\Sistemas\Arrecadacao\PRJ_PRODATA"
$i = BuildProjeto -ProjectName Coeficientes.dpr -ProjectDir "$sDir\Globus\Sistemas\Coeficientes" -ReleaseDir "$aDir\Globus\Sistemas\Coeficientes"
$i = BuildProjeto -ProjectName CNC.dpr -ProjectDir "$sDir\Globus\Sistemas\Conciliacao" -ReleaseDir "$aDir\Globus\Sistemas\Conciliacao"
$i = BuildProjeto -ProjectName EMTU.dpr -ProjectDir "$sDir\Globus\Sistemas\EMTU" -ReleaseDir "$aDir\Globus\Sistemas\EMTU"
$i = BuildProjeto -ProjectName Escala.dpr -ProjectDir "$sDir\Globus\Sistemas\Escala" -ReleaseDir "$aDir\Globus\Sistemas\Escala"
$i = BuildProjeto -ProjectName EscalaRodoviaria.dpr -ProjectDir "$sDir\Globus\Sistemas\EscalaRodoviaria" -ReleaseDir "$aDir\Globus\Sistemas\EscalaRodoviaria"
$i = BuildProjeto -ProjectName InfGeoPosicionamento.dpr -ProjectDir "$sDir\Globus\Sistemas\InfGeoPosicionamento" -ReleaseDir "$aDir\Globus\Sistemas\InfGeoPosicionamento"
$i = BuildProjeto -ProjectName Passes.dpr -ProjectDir "$sDir\Globus\Sistemas\Passes" -ReleaseDir "$aDir\Globus\Sistemas\Passes"
$i = BuildProjeto -ProjectName Plantao.dpr -ProjectDir "$sDir\Globus\Sistemas\Plantao" -ReleaseDir "$aDir\Globus\Sistemas\Plantao"
$i = BuildProjeto -ProjectName AppService_SaidaRecolAuto.dpr -ProjectDir "$sDir\Globus\Sistemas\Plantao\AppService_SaidaRecolAuto" -ReleaseDir "$aDir\Globus\Sistemas\Plantao\AppService_SaidaRecolAuto"
$i = BuildProjeto -ProjectName PVT.dpr -ProjectDir "$sDir\Globus\Sistemas\PVT" -ReleaseDir "$aDir\Globus\Sistemas\PVT"
$i = BuildProjeto -ProjectName Retaguarda.dpr -ProjectDir "$sDir\Globus\Sistemas\Retaguarda" -ReleaseDir "$aDir\Globus\Sistemas\Retaguarda"
$i = BuildProjeto -ProjectName ImpMaquina.dpr -ProjectDir "$sDir\Globus\Sistemas\Retaguarda\RETImportacaoMaquina" -ReleaseDir "$aDir\Globus\Sistemas\Retaguarda"
$i = BuildProjeto -ProjectName SAF.dpr -ProjectDir "$sDir\Globus\Sistemas\Sistema Anti-Fraude"  -ReleaseDir "$aDir\Globus\Sistemas\Sistema Anti-Fraude"
$i = BuildProjeto -ProjectName Trafego.dpr -ProjectDir "$sDir\Globus\Sistemas\Trafego" -ReleaseDir "$aDir\Globus\Sistemas\Trafego"
$i = BuildProjeto -ProjectName Turismo.dpr -ProjectDir "$sDir\Globus\Sistemas\Turismo" -ReleaseDir "$aDir\Globus\Sistemas\Turismo"
$i = BuildProjeto -ProjectName VendaBilhetes.dpr -ProjectDir "$sDir\Globus\Sistemas\Venda Bilhetes" -ReleaseDir "$aDir\Globus\Sistemas\Venda Bilhetes"
$i = BuildProjeto -ProjectName BaixaAutomaticaReservasComBoletos.dpr -ProjectDir "$sDir\Globus\Sistemas\Venda Bilhetes" -ReleaseDir "$aDir\Globus\Sistemas\Venda Bilhetes"
$i = BuildProjeto -ProjectName ControlaProgLeitora.dpr -ProjectDir "$sDir\Globus\Sistemas\Venda Bilhetes" -ReleaseDir "$aDir\Globus\Sistemas\Venda Bilhetes"
$i = BuildProjeto -ProjectName LeitoraDeBilhetes.dpr -ProjectDir "$sDir\Globus\Sistemas\Venda Bilhetes" -ReleaseDir "$aDir\Globus\Sistemas\Venda Bilhetes"
$i = BuildProjeto -ProjectName Cargas.dpr -ProjectDir "$sDir\Globus\Sistemas\Cargas" -ReleaseDir "$aDir\Globus\Sistemas\Cargas"
$i = BuildProjeto -ProjectName TRR.dpr -ProjectDir "$sDir\Globus\Sistemas\TRR" -ReleaseDir "$aDir\Globus\Sistemas\TRR"
$i = BuildProjeto -ProjectName CargasWeb.dpr -ProjectDir "$sDir\Globus\Sistemas\Cargas_WEB\CGI-BIN" -ReleaseDir "$aDir\Globus\Sistemas\Cargas_WEB\CGI-BIN"
$i = BuildProjeto -ProjectName GGRisco.dpr -ProjectDir "$sDir\Globus\Sistemas\GGRisco" -ReleaseDir "$aDir\Globus\Sistemas\GGRisco"
$i = BuildProjeto -ProjectName Terceiros.dpr -ProjectDir "$sDir\Globus\Sistemas\Terceiros" -ReleaseDir "$aDir\Globus\Sistemas\Terceiros"
$i = BuildProjeto -ProjectName Ativo.dpr -ProjectDir "$sDir\Globus\Sistemas\Ativo" -ReleaseDir "$aDir\Globus\Sistemas\Ativo"
$i = BuildProjeto -ProjectName Atualizacao.dpr -ProjectDir "$sDir\Globus\Sistemas\Atualizacao" -ReleaseDir "$aDir\Globus\Sistemas\Atualizacao"
$i = BuildProjeto -ProjectName ControleBancario.dpr -ProjectDir "$sDir\Globus\Sistemas\Bancos" -ReleaseDir "$aDir\Globus\Sistemas\Bancos"
$i = BuildProjeto -ProjectName Contabilidade.dpr -ProjectDir "$sDir\Globus\Sistemas\Contabilidade" -ReleaseDir "$aDir\Globus\Sistemas\Contabilidade"
$i = BuildProjeto -ProjectName CPagar.dpr -ProjectDir "$sDir\Globus\Sistemas\ContasPagar" -ReleaseDir "$aDir\Globus\Sistemas\ContasPagar"
$i = BuildProjeto -ProjectName CReceber.dpr -ProjectDir "$sDir\Globus\Sistemas\ContasReceber" -ReleaseDir "$aDir\Globus\Sistemas\ContasReceber"
$i = BuildProjeto -ProjectName Controle.dpr -ProjectDir "$sDir\Globus\Sistemas\Controle" -ReleaseDir "$aDir\Globus\Sistemas\Controle"
$i = BuildProjeto -ProjectName CTR_GravaArqINI.dpr -ProjectDir "$sDir\Globus\Sistemas\Controle" -ReleaseDir "$aDir\Globus\Sistemas\Controle"
$i = BuildProjeto -ProjectName Escrituracao.dpr -ProjectDir "$sDir\Globus\Sistemas\Escrituracao" -ReleaseDir "$aDir\Globus\Sistemas\Escrituracao"
$i = BuildProjeto -ProjectName PortalDeAcessoAoGlobus.dpr -ProjectDir "$sDir\Globus\Sistemas\MENU" -ReleaseDir "$aDir\Globus\Sistemas\Menu"
$i = BuildProjeto -ProjectName Folha.dpr -ProjectDir "$sDir\Globus\Sistemas\Folha" -ReleaseDir "$aDir\Globus\Sistemas\Folha"
$i = BuildProjeto -ProjectName Frequencia.dpr -ProjectDir "$sDir\Globus\Sistemas\Frequencia" -ReleaseDir "$aDir\Globus\Sistemas\Frequencia"
$i = BuildProjeto -ProjectName RecursosHumanos.dpr -ProjectDir "$sDir\Globus\Sistemas\RecursosHumanos" -ReleaseDir "$aDir\Globus\Sistemas\RecursosHumanos"
$i = BuildProjeto -ProjectName Terminal.dpr -ProjectDir "$sDir\Globus\Sistemas\Terminal" -ReleaseDir "$aDir\Globus\Sistemas\Terminal"
$i = BuildProjeto -ProjectName Cracha.dpr -ProjectDir "$sDir\Globus\Sistemas\Cracha" -ReleaseDir "$aDir\Globus\Sistemas\Cracha"
$i = BuildProjeto -ProjectName CVI.dpr -ProjectDir "$sDir\Globus\Sistemas\ConversaoImportacao" -ReleaseDir "$aDir\Globus\Sistemas\ConversaoImportacao"
$i = BuildProjeto -ProjectName CVE.dpr -ProjectDir "$sDir\Globus\Sistemas\ConversaoExportacao" -ReleaseDir "$aDir\Globus\Sistemas\ConversaoExportacao"
$i = BuildProjeto -ProjectName Cracha_ParametrosClient.dpr -ProjectDir "$sDir\Globus\Sistemas\Cracha\Residentes" -ReleaseDir "$aDir\Globus\Sistemas\Cracha\Residentes"
$i = BuildProjeto -ProjectName Cracha_ColetorClient.dpr -ProjectDir "$sDir\Globus\Sistemas\Cracha\Residentes" -ReleaseDir "$aDir\Globus\Sistemas\Cracha\Residentes"
$i = BuildProjeto -ProjectName Cracha_ParametrosServer.dpr -ProjectDir "$sDir\Globus\Sistemas\Cracha\Residentes" -ReleaseDir "$aDir\Globus\Sistemas\Cracha\Residentes"
$i = BuildProjeto -ProjectName Cracha_ColetorServer.dpr -ProjectDir "$sDir\Globus\Sistemas\Cracha\Residentes" -ReleaseDir "$aDir\Globus\Sistemas\Cracha\Residentes"
$i = BuildProjeto -ProjectName Abastecimento.dpr -ProjectDir "$sDir\Globus\Sistemas\Abastecimento" -ReleaseDir "$aDir\Globus\Sistemas\Abastecimento"
$i = BuildProjeto -ProjectName Acidentes.dpr -ProjectDir "$sDir\Globus\Sistemas\Acidentes" -ReleaseDir "$aDir\Globus\Sistemas\Acidentes"
$i = BuildProjeto -ProjectName Componente.dpr -ProjectDir "$sDir\Globus\Sistemas\Componente" -ReleaseDir "$aDir\Globus\Sistemas\Componente"
$i = BuildProjeto -ProjectName Compras.dpr -ProjectDir "$sDir\Globus\Sistemas\Compras" -ReleaseDir "$aDir\Globus\Sistemas\Compras"
$i = BuildProjeto -ProjectName DVS.dpr -ProjectDir "$sDir\Globus\Sistemas\DVS" -ReleaseDir "$aDir\Globus\Sistemas\DVS"
$i = BuildProjeto -ProjectName Estoque.dpr -ProjectDir "$sDir\Globus\Sistemas\Estoque" -ReleaseDir "$aDir\Globus\Sistemas\Estoque"
$i = BuildProjeto -ProjectName Frota.dpr -ProjectDir "$sDir\Globus\Sistemas\Frota" -ReleaseDir "$aDir\Globus\Sistemas\Frota"
$i = BuildProjeto -ProjectName Manutencao.dpr -ProjectDir "$sDir\Globus\Sistemas\Manutencao" -ReleaseDir "$aDir\Globus\Sistemas\Manutencao"
$i = BuildProjeto -ProjectName Motor.dpr -ProjectDir "$sDir\Globus\Sistemas\Motor" -ReleaseDir "$aDir\Globus\Sistemas\Motor"
$i = BuildProjeto -ProjectName Pneus.dpr -ProjectDir "$sDir\Globus\Sistemas\Pneus" -ReleaseDir "$aDir\Globus\Sistemas\Pneus"
$i = BuildProjeto -ProjectName Tratamento.dpr -ProjectDir "$sDir\Globus\Sistemas\TratamentoTermico" -ReleaseDir "$aDir\Globus\Sistemas\TratamentoTermico"
$i = BuildProjeto -ProjectName Fretamento.dpr -ProjectDir "$sDir\Globus\Sistemas\Fretamento" -ReleaseDir "$aDir\Globus\Sistemas\Fretamento"
$i = BuildProjeto -ProjectName GlobusReport.dpr -ProjectDir "$sDir\Globus\Sistemas\GlobusReport" -ReleaseDir "$aDir\Globus\Sistemas\GlobusReport"
$i = BuildProjeto -ProjectName BIO.dpr -ProjectDir "$sDir\Globus\Sistemas\BIO" -ReleaseDir "$aDir\Globus\Sistemas\BIO"
$i = BuildProjeto -ProjectName Estatistica.dpr -ProjectDir "$sDir\Globus\Sistemas\Estatistica" -ReleaseDir "$aDir\Globus\Sistemas\Estatistica"
$i = BuildProjeto -ProjectName GCC.dpr -ProjectDir "$sDir\Globus\Sistemas\GCC" -ReleaseDir "$aDir\Globus\Sistemas\GCC"
$i = BuildProjeto -ProjectName Frequencia_RelogioAutomatico.dpr -ProjectDir "$sDir\Globus\Sistemas\Frequencia\Residentes" -ReleaseDir "$aDir\Globus\Sistemas\Frequencia\Residentes"
$i = BuildProjeto -ProjectName CargasAutomatizacao.dpr -ProjectDir "$sDir\Globus\Sistemas\Cargas\Automatizacao" -ReleaseDir "$aDir\Globus\Sistemas\Cargas\Automatizacao"
$i = BuildProjeto -ProjectName Seguranca.dpr -ProjectDir "$sDir\Globus\Sistemas\Seguranca" -ReleaseDir "$aDir\Globus\Sistemas\Seguranca"

$now=Get-Date -format "dd/MM/yyyy HH:mm"

Write-Host "$now - Projetos finalizados. Aguardando ASPack..."

While (Get-Job -State "Running")
{
  Start-Sleep 10
}

# Getting the information back from the jobs
Get-Job | Receive-Job