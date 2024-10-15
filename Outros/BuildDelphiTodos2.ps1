param (
	[string]$sDir = "C:\TFSAgent\_work\3\s",
	[string]$aDir = "C:\TFSAgent\_work\3\a",
	[string]$bDir = "C:\TFSAgent\_work\3\b",
    [string]$PFilesDir = "C:\TFSAgent\BuildTools\Delphi",

    [string]$IncludeDir = "$sDir\_OUTROS_\Utilitarios;$sDir\_OUTROS_;$sDir;$PFilesDir\Borland\jcl\source\include",
    [string]$LibDirBgm = "$sDir\_OUTROS_\Comum\Units;$sDir\_OUTROS_\componentes;$sDir\_OUTROS_\componentes7;$sDir\_OUTROS_\component\delphi70;$sDir\_OUTROS_\componentes\rdprintd7;$sDir\_OUTROS_\componentes7\zipmaster;$sDir\_OUTROS_\componentes\crystal7vcl4;$sDir\_OUTROS_\componentes\jvcbarcode;$sDir\_OUTROS_\componentes\exportaqreport\source;$sDir\_OUTROS_\componentes\nfe;$sDir\_OUTROS_\componentes7\rxlibd7\units;$sDir\_OUTROS_\componentes\email;$sDir\_OUTROS_\Componentes\MaterEdit;$sDir\_OUTROS_\componentes7\sakemail;$sDir\_OUTROS_\componentes\barras;$sDir\_OUTROS_\Componentes\GLBFilter;$sDir\_OUTROS_\componentes\Cargas;$sDir\_OUTROS_\componentes\contaspagar;$sDir\_OUTROS_\componentes\ContasReceber;$sDir\_OUTROS_\Componentes\BarrasNovo\lib32;$sDir\_OUTROS_\componentes\emailnovo;$sDir\_OUTROS_\Componentes\FormatParam;$sDir\_OUTROS_\Componentes\Calendarios;$sDir\_OUTROS_\Componentes\Frequencia;$sDir\_OUTROS_\Componentes\SelecaoAle;$sDir\_OUTROS_\Componentes\BGMXML;$sDir\_OUTROS_\Componentes\SynEdit;$sDir\_OUTROS_\Componentes7\ZipMaster;$sDir\_OUTROS_\Componentes7\ZipMaster\Units;$sDir\_OUTROS_\Componentes7\ZipMaster\Units\VCL;$sDir\_OUTROS_\Componentes7\CoreLab;$sDir\_OUTROS_\Componentes7\CoreLab\Delphi7;$sDir\_OUTROS_\Componentes7\CoreLab\DbxOda;$sDir\_OUTROS_\Componentes7\GlbReport;$sDir\_OUTROS_\Componentes\SynEdit\Packages;$sDir\_OUTROS_\Componentes\SynEdit\Source;$sDir\_OUTROS_\Componentes\SynEdit\SynGen;$sDir\_OUTROS_\Componentes\SynEdit\SynGen\CVS;$sDir\_OUTROS_\Componentes\SynEdit\Source\CVS;$sDir\_OUTROS_\Componentes\SynEdit\Packages\CVS;$sDir\_OUTROS_\Componentes\CTe;$sDir\_OUTROS_\Componentes\Systray;$sDir\_OUTROS_\Componentes7\ACBr\source\Pascal;$sDir\_OUTROS_\Componentes\Apisul;$sDir\_OUTROS_\Componentes\Opentech;$sDir\_OUTROS_\Componentes\NFSe;$sDir\_OUTROS_\Componentes\Carbocloro;$sDir\_OUTROS_\Componentes\DSPACK234\src\DSPack;$sDir\_OUTROS_\Componentes\DSPACK234\src\DirectX9;$sDir\_OUTROS_\Componentes7\RxLibD7;$sDir\_OUTROS_\Componentes7\PngComponents\Source\obj;$sDir\_OUTROS_\Componentes7\PngComponents\Source\;$sDir\_OUTROS_\Utilitarios;$sDir\_OUTROS_\Componentes7\VclSkin_D7\Skin",
    [string]$LibDirDelphi = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\Delphi7\Bin;$PFilesDir\Borland\Delphi7\Imports;$PFilesDir\Borland\Delphi7\Projects\Bpl;$PFilesDir\Borland\Delphi7\Source\ToolsAPI;$PFilesDir\Borland\jcl\lib\d7;$PFilesDir\Borland\jvcl\lib\D7;$PFilesDir\Borland\jvcl\common;$PFilesDir\Borland\jvcl\Resources;$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\jcl\source\include;$PFilesDir\Borland\Delphi7\XDBGrid;$PFilesDir\Borland\Delphi7\XDBGrid\Source;$PFilesDir\Borland\Delphi7\Rave5\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Lib\D7;$PFilesDir\Gnostice\eDocEngine VCL\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Source\QR;$PFilesDir\Gnostice\Shared3\Source\Rtl;$PFilesDir\Gnostice\Shared3\Lib\D7;",
	[string]$LibSistemas = "$sDir\_OUTROS_\Sistemas\ContasPagar;$sDir\_OUTROS_\Sistemas\ContasReceber;$sDir\_OUTROS_\Sistemas\BIO;$sDir\_OUTROS_\Sistemas\Cargas\AUTOMATIZACAO;$sDir\_OUTROS_\SISTEMAS;$sDir\_OUTROS_\Sistemas\GGRisco;$sDir\_OUTROS_\Sistemas\Cargas;$sDir\_OUTROS_\Sistemas\Abastecimento;$sDir\_OUTROS_\Sistemas\plantao;$sDir\_OUTROS_\Sistemas\ACIDENTES;$sDir\_OUTROS_\Sistemas\Arrecadacao;$sDir\_OUTROS_\Sistemas\Ativo;$sDir\_OUTROS_\Sistemas\Bancos;$sDir\_OUTROS_\Sistemas\Componente;$sDir\_OUTROS_\Sistemas\Compras;$sDir\_OUTROS_\Sistemas\gcc;$sDir\_OUTROS_\Sistemas\ContasAPagar;$sDir\_OUTROS_\Sistemas\ContasAReceber;$sDir\_OUTROS_\Sistemas\Contabilidade;$sDir\_OUTROS_\Sistemas\Controle;$sDir\_OUTROS_\Sistemas\DESPACHANTE;$sDir\_OUTROS_\Sistemas\DVS;$sDir\_OUTROS_\Sistemas\Escala;$sDir\_OUTROS_\Sistemas\EscalaRodoviaria;$sDir\_OUTROS_\Sistemas\Escrituracao;$sDir\_OUTROS_\Sistemas\Estoque;$sDir\_OUTROS_\Sistemas\Frequencia;$sDir\_OUTROS_\Sistemas\Fretamento;$sDir\_OUTROS_\Sistemas\Frota;$sDir\_OUTROS_\Sistemas\Folha;$sDir\_OUTROS_\Sistemas\Manutencao;$sDir\_OUTROS_\Sistemas\Motor;$sDir\_OUTROS_\Sistemas\Passes;$sDir\_OUTROS_\Sistemas\PVT;$sDir\_OUTROS_\Sistemas\Pneus;$sDir\_OUTROS_\Sistemas\RecursosHumanos;$sDir\_OUTROS_\Sistemas\Retaguarda;$sDir\_OUTROS_\Sistemas\SEGURANCA;$sDir\_OUTROS_\Sistemas\Trafego;$sDir\_OUTROS_\Sistemas\Terminal;$sDir\_OUTROS_\Sistemas\Turismo;$sDir\_OUTROS_\Sistemas\comodato;$sDir\_OUTROS_\Sistemas\TRR;$sDir\_OUTROS_\Sistemas\TratamentoTermico;$sDir\_OUTROS_\Sistemas\Terceiros;$sDir\_OUTROS_\Sistemas\Venda Bilhetes;$sDir\_OUTROS_\Sistemas\Gerador;$sDir\_OUTROS_\Sistemas\InfGeoPosicionamento;$sDir\_OUTROS_\Sistemas\Cracha\Residentes;$sDir\_OUTROS_\Sistemas\EMTU;",
	[string]$ResourcesDir = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\JVCL\resources;$LibSistemas",
	
	[string]$LibDirFull = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\Delphi7\Bin;$PFilesDir\Borland\Delphi7\Imports;$PFilesDir\Borland\Delphi7\Projects\Bpl;$PFilesDir\Borland\Delphi7\Source\ToolsAPI;$PFilesDir\Gnostice\eDocEngine VCL\Lib\D7;$PFilesDir\Gnostice\eDocEngine VCL\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Source\QR;$PFilesDir\Gnostice\Shared3\Source\Rtl;$PFilesDir\Gnostice\Shared3\Lib\D7;$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\jcl\source\include;$sDir\_OUTROS_\componentes;$sDir\_OUTROS_\componentes7;$sDir\_OUTROS_\component\delphi70;$sDir\_OUTROS_\componentes\rdprintd7;$sDir\_OUTROS_\componentes7\zipmaster;$sDir\_OUTROS_\componentes\crystal7vcl4;$sDir\_OUTROS_\componentes\jvcbarcode;$sDir\_OUTROS_\componentes\exportaqreport\source;$sDir\_OUTROS_\componentes\nfe;$sDir\_OUTROS_\componentes7\rxlibd7\units;$sDir\_OUTROS_\componentes\email;$sDir\_OUTROS_\Componentes\MaterEdit;$sDir\_OUTROS_\componentes7\sakemail;$sDir\_OUTROS_\componentes\barras;$sDir\_OUTROS_\Componentes\GLBFilter;$sDir\_OUTROS_\componentes\Cargas;$sDir\_OUTROS_\componentes\contaspagar;$sDir\_OUTROS_\componentes\ContasReceber;$sDir\_OUTROS_\Componentes\BarrasNovo\lib32;$sDir\_OUTROS_\componentes\emailnovo;$sDir\_OUTROS_\Componentes\FormatParam;$sDir\_OUTROS_\Componentes\Calendarios;$sDir\_OUTROS_\Componentes\Frequencia;$sDir\_OUTROS_\Componentes\SelecaoAle;$sDir\_OUTROS_\Componentes\BGMXML;$sDir\_OUTROS_\Componentes\SynEdit;$sDir\_OUTROS_\Componentes7\ZipMaster;$sDir\_OUTROS_\Componentes7\ZipMaster\Units;$sDir\_OUTROS_\Componentes7\ZipMaster\Units\VCL;$sDir\_OUTROS_\Componentes7\CoreLab;$sDir\_OUTROS_\Componentes7\CoreLab\Delphi7;$sDir\_OUTROS_\Componentes7\CoreLab\DbxOda;$sDir\_OUTROS_\Componentes7\GlbReport;$sDir\_OUTROS_\Componentes\SynEdit\Packages;$sDir\_OUTROS_\Componentes\SynEdit\Source;$sDir\_OUTROS_\Componentes\SynEdit\SynGen;$sDir\_OUTROS_\Componentes\SynEdit\SynGen\CVS;$sDir\_OUTROS_\Componentes\SynEdit\Source\CVS;$sDir\_OUTROS_\Componentes\SynEdit\Packages\CVS;$sDir\_OUTROS_\Componentes\CTe;$sDir\_OUTROS_\Componentes\Systray;$sDir\_OUTROS_\Componentes7\ACBr\source\Pascal;$sDir\_OUTROS_\Componentes\Apisul;$sDir\_OUTROS_\Componentes\Opentech;$sDir\_OUTROS_\Componentes\NFSe;$sDir\_OUTROS_\Componentes\Carbocloro;$sDir\_OUTROS_\Utilitarios;$sDir\_OUTROS_\Comum\Units;$LibSistemas;$PFilesDir\Borland\Delphi7\XDBGrid;$PFilesDir\Borland\Delphi7\XDBGrid\Source;$sDir\_OUTROS_\Componentes\DSPACK234\src\DSPack;$sDir\_OUTROS_\Componentes\DSPACK234\src\DirectX9;$PFilesDir\Borland\Delphi7\Rave5\Lib;$PFilesDir\Borland\jcl\lib\d7;$PFilesDir\Borland\jvcl\lib\D7;$PFilesDir\Borland\jvcl\common;$PFilesDir\Borland\jvcl\Resources;$sDir\_OUTROS_\Componentes7\RxLibD7;$sDir\_OUTROS_\Componentes7\PngComponents\Source\obj;$sDir\_OUTROS_\Componentes7\PngComponents\Source\;$sDir\_OUTROS_\Componentes7\VclSkin_D7\Skin;",
	[string]$ObjectsDir = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\Delphi7\Bin;$PFilesDir\Borland\Delphi7\Imports;$PFilesDir\Borland\Delphi7\Projects\Bpl;$PFilesDir\Borland\Delphi7\Source\ToolsAPI;$PFilesDir\Gnostice\eDocEngine VCL\Lib\D7;$PFilesDir\Gnostice\eDocEngine VCL\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Source\QR;$PFilesDir\Gnostice\Shared3\Source\Rtl;$PFilesDir\Gnostice\Shared3\Lib\D7;$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\jcl\source\include;$sDir\_OUTROS_\componentes;$sDir\_OUTROS_\componentes7;$sDir\_OUTROS_\component\delphi70;$sDir\_OUTROS_\componentes\rdprintd7;$sDir\_OUTROS_\componentes7\zipmaster;$sDir\_OUTROS_\componentes\crystal7vcl4;$sDir\_OUTROS_\componentes\jvcbarcode;$sDir\_OUTROS_\componentes\exportaqreport\source;$sDir\_OUTROS_\componentes\nfe;$sDir\_OUTROS_\componentes7\rxlibd7\units;$sDir\_OUTROS_\componentes\email;$sDir\_OUTROS_\Componentes\MaterEdit;$sDir\_OUTROS_\componentes7\sakemail;$sDir\_OUTROS_\componentes\barras;$sDir\_OUTROS_\Componentes\GLBFilter;$sDir\_OUTROS_\componentes\Cargas;$sDir\_OUTROS_\componentes\contaspagar;$sDir\_OUTROS_\componentes\ContasReceber;$sDir\_OUTROS_\Componentes\BarrasNovo\lib32;$sDir\_OUTROS_\componentes\emailnovo;$sDir\_OUTROS_\Componentes\FormatParam;$sDir\_OUTROS_\Componentes\Calendarios;$sDir\_OUTROS_\Componentes\Frequencia;$sDir\_OUTROS_\Componentes\SelecaoAle;$sDir\_OUTROS_\Componentes\BGMXML;$sDir\_OUTROS_\Componentes\SynEdit;$sDir\_OUTROS_\Componentes7\ZipMaster;$sDir\_OUTROS_\Componentes7\ZipMaster\Units;$sDir\_OUTROS_\Componentes7\ZipMaster\Units\VCL;$sDir\_OUTROS_\Componentes7\CoreLab;$sDir\_OUTROS_\Componentes7\CoreLab\Delphi7;$sDir\_OUTROS_\Componentes7\CoreLab\DbxOda;$sDir\_OUTROS_\Componentes7\GlbReport;$sDir\_OUTROS_\Componentes\SynEdit\Packages;$sDir\_OUTROS_\Componentes\SynEdit\Source;$sDir\_OUTROS_\Componentes\SynEdit\SynGen;$sDir\_OUTROS_\Componentes\SynEdit\SynGen\CVS;$sDir\_OUTROS_\Componentes\SynEdit\Source\CVS;$sDir\_OUTROS_\Componentes\SynEdit\Packages\CVS;$sDir\_OUTROS_\Componentes\CTe;$sDir\_OUTROS_\Componentes\Systray;$sDir\_OUTROS_\Componentes7\ACBr\source\Pascal;$sDir\_OUTROS_\Componentes\Apisul;$sDir\_OUTROS_\Componentes\Opentech;$sDir\_OUTROS_\Componentes\NFSe;$sDir\_OUTROS_\Componentes\Carbocloro;$sDir\_OUTROS_\Utilitarios;$sDir\_OUTROS_\Comum\Units;$LibSistemas;$PFilesDir\Borland\Delphi7\XDBGrid;$PFilesDir\Borland\Delphi7\XDBGrid\Source;$sDir\_OUTROS_\Componentes\DSPACK234\src\DSPack;$sDir\_OUTROS_\Componentes\DSPACK234\src\DirectX9;$PFilesDir\Borland\Delphi7\Rave5\Lib;$PFilesDir\Borland\jcl\lib\d7;$PFilesDir\Borland\jvcl\lib\D7;$PFilesDir\Borland\jvcl\common;$PFilesDir\Borland\jvcl\Resources;$sDir\_OUTROS_\Componentes7\RxLibD7;$sDir\_OUTROS_\Componentes7\PngComponents\Source\obj;$sDir\_OUTROS_\Componentes7\PngComponents\Source\;$sDir\_OUTROS_\Componentes7\VclSkin_D7\Skin;",
	
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
$DataHora = "Edit1.Text := '$now';" | Out-File -NoNewline -Encoding "Ascii" "$sDir\_OUTROS_\Sistemas\DataHora.txt"

$now=Get-Date -format "dd/MM/yyyy HH:mm:ss"

Write-Host "$now - Iniciando projetos"

$i = BuildProjeto -ProjectName Arrecadacao.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Arrecadacao" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Arrecadacao"
$i = BuildProjeto -ProjectName AgendaImpAutomatica.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Arrecadacao" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Arrecadacao"
$i = BuildProjeto -ProjectName BilhetagemEletronica.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Arrecadacao\BilhetagemMetra" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Arrecadacao\BilhetagemMETRA"
$i = BuildProjeto -ProjectName ImportacaoFilipeta.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Arrecadacao\ImportacaoFILIPETA" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Arrecadacao"
$i = BuildProjeto -ProjectName PRJ_PRODATA.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Arrecadacao\PRJ_PRODATA" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Arrecadacao\PRJ_PRODATA"
$i = BuildProjeto -ProjectName Coeficientes.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Coeficientes" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Coeficientes"
$i = BuildProjeto -ProjectName CNC.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Conciliacao" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Conciliacao"
$i = BuildProjeto -ProjectName EMTU.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\EMTU" -ReleaseDir "$aDir\_OUTROS_\Sistemas\EMTU"
$i = BuildProjeto -ProjectName Escala.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Escala" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Escala"
$i = BuildProjeto -ProjectName EscalaRodoviaria.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\EscalaRodoviaria" -ReleaseDir "$aDir\_OUTROS_\Sistemas\EscalaRodoviaria"
$i = BuildProjeto -ProjectName InfGeoPosicionamento.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\InfGeoPosicionamento" -ReleaseDir "$aDir\_OUTROS_\Sistemas\InfGeoPosicionamento"
$i = BuildProjeto -ProjectName Passes.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Passes" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Passes"
$i = BuildProjeto -ProjectName Plantao.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Plantao" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Plantao"
$i = BuildProjeto -ProjectName AppService_SaidaRecolAuto.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Plantao\AppService_SaidaRecolAuto" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Plantao\AppService_SaidaRecolAuto"
$i = BuildProjeto -ProjectName PVT.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\PVT" -ReleaseDir "$aDir\_OUTROS_\Sistemas\PVT"
$i = BuildProjeto -ProjectName Retaguarda.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Retaguarda" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Retaguarda"
$i = BuildProjeto -ProjectName ImpMaquina.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Retaguarda\RETImportacaoMaquina" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Retaguarda"
$i = BuildProjeto -ProjectName SAF.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Sistema Anti-Fraude"  -ReleaseDir "$aDir\_OUTROS_\Sistemas\Sistema Anti-Fraude"
$i = BuildProjeto -ProjectName Trafego.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Trafego" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Trafego"
$i = BuildProjeto -ProjectName Turismo.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Turismo" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Turismo"
$i = BuildProjeto -ProjectName VendaBilhetes.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Venda Bilhetes" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Venda Bilhetes"
$i = BuildProjeto -ProjectName BaixaAutomaticaReservasComBoletos.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Venda Bilhetes" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Venda Bilhetes"
$i = BuildProjeto -ProjectName ControlaProgLeitora.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Venda Bilhetes" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Venda Bilhetes"
$i = BuildProjeto -ProjectName LeitoraDeBilhetes.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Venda Bilhetes" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Venda Bilhetes"
$i = BuildProjeto -ProjectName Cargas.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cargas" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Cargas"
$i = BuildProjeto -ProjectName TRR.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\TRR" -ReleaseDir "$aDir\_OUTROS_\Sistemas\TRR"
$i = BuildProjeto -ProjectName CargasWeb.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cargas_WEB\CGI-BIN" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Cargas_WEB\CGI-BIN"
$i = BuildProjeto -ProjectName GGRisco.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\GGRisco" -ReleaseDir "$aDir\_OUTROS_\Sistemas\GGRisco"
$i = BuildProjeto -ProjectName Terceiros.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Terceiros" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Terceiros"
$i = BuildProjeto -ProjectName Ativo.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Ativo" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Ativo"
$i = BuildProjeto -ProjectName Atualizacao.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Atualizacao" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Atualizacao"
$i = BuildProjeto -ProjectName ControleBancario.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Bancos" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Bancos"
$i = BuildProjeto -ProjectName Contabilidade.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Contabilidade" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Contabilidade"
$i = BuildProjeto -ProjectName CPagar.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\ContasPagar" -ReleaseDir "$aDir\_OUTROS_\Sistemas\ContasPagar"
$i = BuildProjeto -ProjectName CReceber.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\ContasReceber" -ReleaseDir "$aDir\_OUTROS_\Sistemas\ContasReceber"
$i = BuildProjeto -ProjectName Controle.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Controle" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Controle"
$i = BuildProjeto -ProjectName CTR_GravaArqINI.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Controle" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Controle"
$i = BuildProjeto -ProjectName Escrituracao.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Escrituracao" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Escrituracao"
$i = BuildProjeto -ProjectName PortalDeAcessoAo_OUTROS_.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\MENU" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Menu"
$i = BuildProjeto -ProjectName Folha.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Folha" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Folha"
$i = BuildProjeto -ProjectName Frequencia.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Frequencia" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Frequencia"
$i = BuildProjeto -ProjectName RecursosHumanos.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\RecursosHumanos" -ReleaseDir "$aDir\_OUTROS_\Sistemas\RecursosHumanos"
$i = BuildProjeto -ProjectName Terminal.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Terminal" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Terminal"
$i = BuildProjeto -ProjectName Cracha.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cracha" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Cracha"
$i = BuildProjeto -ProjectName CVI.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\ConversaoImportacao" -ReleaseDir "$aDir\_OUTROS_\Sistemas\ConversaoImportacao"
$i = BuildProjeto -ProjectName CVE.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\ConversaoExportacao" -ReleaseDir "$aDir\_OUTROS_\Sistemas\ConversaoExportacao"
$i = BuildProjeto -ProjectName Cracha_ParametrosClient.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cracha\Residentes" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Cracha\Residentes"
$i = BuildProjeto -ProjectName Cracha_ColetorClient.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cracha\Residentes" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Cracha\Residentes"
$i = BuildProjeto -ProjectName Cracha_ParametrosServer.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cracha\Residentes" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Cracha\Residentes"
$i = BuildProjeto -ProjectName Cracha_ColetorServer.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cracha\Residentes" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Cracha\Residentes"
$i = BuildProjeto -ProjectName Abastecimento.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Abastecimento" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Abastecimento"
$i = BuildProjeto -ProjectName Acidentes.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Acidentes" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Acidentes"
$i = BuildProjeto -ProjectName Componente.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Componente" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Componente"
$i = BuildProjeto -ProjectName Compras.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Compras" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Compras"
$i = BuildProjeto -ProjectName DVS.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\DVS" -ReleaseDir "$aDir\_OUTROS_\Sistemas\DVS"
$i = BuildProjeto -ProjectName Estoque.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Estoque" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Estoque"
$i = BuildProjeto -ProjectName Frota.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Frota" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Frota"
$i = BuildProjeto -ProjectName Manutencao.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Manutencao" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Manutencao"
$i = BuildProjeto -ProjectName Motor.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Motor" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Motor"
$i = BuildProjeto -ProjectName Pneus.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Pneus" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Pneus"
$i = BuildProjeto -ProjectName Tratamento.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\TratamentoTermico" -ReleaseDir "$aDir\_OUTROS_\Sistemas\TratamentoTermico"
$i = BuildProjeto -ProjectName Fretamento.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Fretamento" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Fretamento"
$i = BuildProjeto -ProjectName _OUTROS_Report.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\_OUTROS_Report" -ReleaseDir "$aDir\_OUTROS_\Sistemas\_OUTROS_Report"
$i = BuildProjeto -ProjectName BIO.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\BIO" -ReleaseDir "$aDir\_OUTROS_\Sistemas\BIO"
$i = BuildProjeto -ProjectName Estatistica.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Estatistica" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Estatistica"
$i = BuildProjeto -ProjectName GCC.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\GCC" -ReleaseDir "$aDir\_OUTROS_\Sistemas\GCC"
$i = BuildProjeto -ProjectName Frequencia_RelogioAutomatico.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Frequencia\Residentes" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Frequencia\Residentes"
$i = BuildProjeto -ProjectName CargasAutomatizacao.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cargas\Automatizacao" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Cargas\Automatizacao"
$i = BuildProjeto -ProjectName Seguranca.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Seguranca" -ReleaseDir "$aDir\_OUTROS_\Sistemas\Seguranca"

$now=Get-Date -format "dd/MM/yyyy HH:mm"

Write-Host "$now - Projetos finalizados. Aguardando ASPack..."

While (Get-Job -State "Running")
{
  Start-Sleep 10
}

# Getting the information back from the jobs
Get-Job | Receive-Job