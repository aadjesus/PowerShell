param (
	[string]$sDir = "C:\BgmRodotec\Globus\src",
	[string]$aDir = "C:\a",
	[string]$bDir = "C:\b",
    [string]$PFilesDir = "C:\Program Files (x86)",
    [string]$branch = "",
    [string]$buildID = "",
    [string]$strOrigin = 'refs/heads/', 
    [string]$zbranch = "",
    [string]$zbuildID = "",

    [string]$IncludeDir = "$sDir\Globus\Utilitarios;$sDir\Globus;$sDir;$PFilesDir\Borland\jcl\source\include",
    [string]$LibDirBgm = "$sDir\Globus\Comum\Units;$sDir\Globus\componentes;$sDir\Globus\componentes7;$sDir\Globus\component\delphi70;$sDir\Globus\componentes\rdprintd7;$sDir\Globus\componentes7\zipmaster;$sDir\Globus\componentes\crystal7vcl4;$sDir\Globus\componentes\jvcbarcode;$sDir\Globus\componentes\exportaqreport\source;$sDir\Globus\componentes\nfe;$sDir\Globus\componentes7\rxlibd7\units;$sDir\Globus\componentes\email;$sDir\Globus\Componentes\MaterEdit;$sDir\Globus\componentes7\sakemail;$sDir\Globus\componentes\barras;$sDir\Globus\Componentes\GLBFilter;$sDir\Globus\componentes\Cargas;$sDir\Globus\componentes\contaspagar;$sDir\Globus\componentes\ContasReceber;$sDir\Globus\Componentes\BarrasNovo\lib32;$sDir\Globus\componentes\emailnovo;$sDir\Globus\Componentes\FormatParam;$sDir\Globus\Componentes\Calendarios;$sDir\Globus\Componentes\Frequencia;$sDir\Globus\Componentes\SelecaoAle;$sDir\Globus\Componentes\BGMXML;$sDir\Globus\Componentes\SynEdit;$sDir\Globus\Componentes7\ZipMaster;$sDir\Globus\Componentes7\ZipMaster\Units;$sDir\Globus\Componentes7\ZipMaster\Units\VCL;$sDir\Globus\Componentes7\CoreLab;$sDir\Globus\Componentes7\CoreLab\Delphi7;$sDir\Globus\Componentes7\CoreLab\DbxOda;$sDir\Globus\Componentes7\GlbReport;$sDir\Globus\Componentes\SynEdit\Packages;$sDir\Globus\Componentes\SynEdit\Source;$sDir\Globus\Componentes\SynEdit\SynGen;$sDir\Globus\Componentes\SynEdit\SynGen\CVS;$sDir\Globus\Componentes\SynEdit\Source\CVS;$sDir\Globus\Componentes\SynEdit\Packages\CVS;$sDir\Globus\Componentes\CTe;$sDir\Globus\Componentes\Systray;$sDir\Globus\Componentes7\ACBr\source\Pascal;$sDir\Globus\Componentes\Apisul;$sDir\Globus\Componentes\Opentech;$sDir\Globus\Componentes\NFSe;$sDir\Globus\Componentes\Carbocloro;$sDir\Globus\Componentes\DSPACK234\src\DSPack;$sDir\Globus\Componentes\DSPACK234\src\DirectX9;$sDir\Globus\Componentes7\RxLibD7;$sDir\Globus\Componentes7\PngComponents\Source\obj;$sDir\Globus\Componentes7\PngComponents\Source\;$sDir\Globus\Utilitarios;$sDir\Globus\Componentes7\VclSkin_D7\Skin",
    [string]$LibDirDelphi = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\Delphi7\Bin;$PFilesDir\Borland\Delphi7\Imports;$PFilesDir\Borland\Delphi7\Projects\Bpl;$PFilesDir\Borland\Delphi7\Source\ToolsAPI;$PFilesDir\Borland\jcl\lib\d7;$PFilesDir\Borland\jvcl\lib\D7;$PFilesDir\Borland\jvcl\common;$PFilesDir\Borland\jvcl\Resources;$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\jcl\source\include;$PFilesDir\Borland\Delphi7\XDBGrid;$PFilesDir\Borland\Delphi7\XDBGrid\Source;$PFilesDir\Borland\Delphi7\Rave5\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Lib\D7;$PFilesDir\Gnostice\eDocEngine VCL\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Source\QR;$PFilesDir\Gnostice\Shared3\Source\Rtl;$PFilesDir\Gnostice\Shared3\Lib\D7;",
	[string]$LibSistemas = "$sDir\Globus\Sistemas\ContasPagar;$sDir\Globus\Sistemas\ContasReceber;$sDir\Globus\Sistemas\BIO;$sDir\Globus\Sistemas\Cargas\AUTOMATIZACAO;$sDir\Globus\SISTEMAS;$sDir\Globus\Sistemas\GGRisco;$sDir\Globus\Sistemas\Cargas;$sDir\Globus\Sistemas\Abastecimento;$sDir\Globus\Sistemas\plantao;$sDir\Globus\Sistemas\ACIDENTES;$sDir\Globus\Sistemas\Arrecadacao;$sDir\Globus\Sistemas\Ativo;$sDir\Globus\Sistemas\Bancos;$sDir\Globus\Sistemas\Componente;$sDir\Globus\Sistemas\Compras;$sDir\Globus\Sistemas\gcc;$sDir\Globus\Sistemas\ContasAPagar;$sDir\Globus\Sistemas\ContasAReceber;$sDir\Globus\Sistemas\Contabilidade;$sDir\Globus\Sistemas\Controle;$sDir\Globus\Sistemas\DESPACHANTE;$sDir\Globus\Sistemas\DVS;$sDir\Globus\Sistemas\Escala;$sDir\Globus\Sistemas\EscalaRodoviaria;$sDir\Globus\Sistemas\EscalaRodoviariaAutomatica;$sDir\Globus\Sistemas\Escrituracao;$sDir\Globus\Sistemas\Estoque;$sDir\Globus\Sistemas\Frequencia;$sDir\Globus\Sistemas\Fretamento;$sDir\Globus\Sistemas\Frota;$sDir\Globus\Sistemas\Folha;$sDir\Globus\Sistemas\Manutencao;$sDir\Globus\Sistemas\Motor;$sDir\Globus\Sistemas\Passes;$sDir\Globus\Sistemas\PVT;$sDir\Globus\Sistemas\Pneus;$sDir\Globus\Sistemas\RecursosHumanos;$sDir\Globus\Sistemas\Retaguarda;$sDir\Globus\Sistemas\Trafego;$sDir\Globus\Sistemas\Terminal;$sDir\Globus\Sistemas\Turismo;$sDir\Globus\Sistemas\comodato;$sDir\Globus\Sistemas\TRR;$sDir\Globus\Sistemas\TratamentoTermico;$sDir\Globus\Sistemas\Terceiros;$sDir\Globus\Sistemas\Venda Bilhetes;$sDir\Globus\Sistemas\Gerador;$sDir\Globus\Sistemas\InfGeoPosicionamento;$sDir\Globus\Sistemas\Cracha\Residentes;$sDir\Globus\Sistemas\EMTU;$sDir\Globus\Sistemas\EMTU;$sDir\Globus\Sistemas\ConsolidadorBE;$sDir\Globus\Sistemas\BEV;",
	[string]$ResourcesDir = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\JVCL\resources;$LibSistemas",
	
	[string]$LibDirFull = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\Delphi7\Bin;$PFilesDir\Borland\Delphi7\Imports;$PFilesDir\Borland\Delphi7\Projects\Bpl;$PFilesDir\Borland\Delphi7\Source\ToolsAPI;$PFilesDir\Gnostice\eDocEngine VCL\Lib\D7;$PFilesDir\Gnostice\eDocEngine VCL\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Source\QR;$PFilesDir\Gnostice\Shared3\Source\Rtl;$PFilesDir\Gnostice\Shared3\Lib\D7;$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\jcl\source\include;$sDir\Globus\componentes;$sDir\Globus\componentes7;$sDir\Globus\component\delphi70;$sDir\Globus\componentes\rdprintd7;$sDir\Globus\componentes7\zipmaster;$sDir\Globus\componentes\crystal7vcl4;$sDir\Globus\componentes\jvcbarcode;$sDir\Globus\componentes\exportaqreport\source;$sDir\Globus\componentes\nfe;$sDir\Globus\componentes7\rxlibd7\units;$sDir\Globus\componentes\email;$sDir\Globus\Componentes\MaterEdit;$sDir\Globus\componentes7\sakemail;$sDir\Globus\componentes\barras;$sDir\Globus\Componentes\GLBFilter;$sDir\Globus\componentes\Cargas;$sDir\Globus\componentes\contaspagar;$sDir\Globus\componentes\ContasReceber;$sDir\Globus\Componentes\BarrasNovo\lib32;$sDir\Globus\componentes\emailnovo;$sDir\Globus\Componentes\FormatParam;$sDir\Globus\Componentes\Calendarios;$sDir\Globus\Componentes\Frequencia;$sDir\Globus\Componentes\SelecaoAle;$sDir\Globus\Componentes\BGMXML;$sDir\Globus\Componentes\SynEdit;$sDir\Globus\Componentes7\ZipMaster;$sDir\Globus\Componentes7\ZipMaster\Units;$sDir\Globus\Componentes7\ZipMaster\Units\VCL;$sDir\Globus\Componentes7\CoreLab;$sDir\Globus\Componentes7\CoreLab\Delphi7;$sDir\Globus\Componentes7\CoreLab\DbxOda;$sDir\Globus\Componentes7\GlbReport;$sDir\Globus\Componentes\SynEdit\Packages;$sDir\Globus\Componentes\SynEdit\Source;$sDir\Globus\Componentes\SynEdit\SynGen;$sDir\Globus\Componentes\SynEdit\SynGen\CVS;$sDir\Globus\Componentes\SynEdit\Source\CVS;$sDir\Globus\Componentes\SynEdit\Packages\CVS;$sDir\Globus\Componentes\CTe;$sDir\Globus\Componentes\Systray;$sDir\Globus\Componentes7\ACBr\source\Pascal;$sDir\Globus\Componentes\Apisul;$sDir\Globus\Componentes\Opentech;$sDir\Globus\Componentes\NFSe;$sDir\Globus\Componentes\Carbocloro;$sDir\Globus\Utilitarios;$sDir\Globus\Comum\Units;$LibSistemas;$PFilesDir\Borland\Delphi7\XDBGrid;$PFilesDir\Borland\Delphi7\XDBGrid\Source;$sDir\Globus\Componentes\DSPACK234\src\DSPack;$sDir\Globus\Componentes\DSPACK234\src\DirectX9;$PFilesDir\Borland\Delphi7\Rave5\Lib;$PFilesDir\Borland\jcl\lib\d7;$PFilesDir\Borland\jvcl\lib\D7;$PFilesDir\Borland\jvcl\common;$PFilesDir\Borland\jvcl\Resources;$sDir\Globus\Componentes7\RxLibD7;$sDir\Globus\Componentes7\PngComponents\Source\obj;$sDir\Globus\Componentes7\PngComponents\Source\;$sDir\Globus\Componentes7\VclSkin_D7\Skin;",
	[string]$ObjectsDir = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\Delphi7\Bin;$PFilesDir\Borland\Delphi7\Imports;$PFilesDir\Borland\Delphi7\Projects\Bpl;$PFilesDir\Borland\Delphi7\Source\ToolsAPI;$PFilesDir\Gnostice\eDocEngine VCL\Lib\D7;$PFilesDir\Gnostice\eDocEngine VCL\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Source\QR;$PFilesDir\Gnostice\Shared3\Source\Rtl;$PFilesDir\Gnostice\Shared3\Lib\D7;$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\jcl\source\include;$sDir\Globus\componentes;$sDir\Globus\componentes7;$sDir\Globus\component\delphi70;$sDir\Globus\componentes\rdprintd7;$sDir\Globus\componentes7\zipmaster;$sDir\Globus\componentes\crystal7vcl4;$sDir\Globus\componentes\jvcbarcode;$sDir\Globus\componentes\exportaqreport\source;$sDir\Globus\componentes\nfe;$sDir\Globus\componentes7\rxlibd7\units;$sDir\Globus\componentes\email;$sDir\Globus\Componentes\MaterEdit;$sDir\Globus\componentes7\sakemail;$sDir\Globus\componentes\barras;$sDir\Globus\Componentes\GLBFilter;$sDir\Globus\componentes\Cargas;$sDir\Globus\componentes\contaspagar;$sDir\Globus\componentes\ContasReceber;$sDir\Globus\Componentes\BarrasNovo\lib32;$sDir\Globus\componentes\emailnovo;$sDir\Globus\Componentes\FormatParam;$sDir\Globus\Componentes\Calendarios;$sDir\Globus\Componentes\Frequencia;$sDir\Globus\Componentes\SelecaoAle;$sDir\Globus\Componentes\BGMXML;$sDir\Globus\Componentes\SynEdit;$sDir\Globus\Componentes7\ZipMaster;$sDir\Globus\Componentes7\ZipMaster\Units;$sDir\Globus\Componentes7\ZipMaster\Units\VCL;$sDir\Globus\Componentes7\CoreLab;$sDir\Globus\Componentes7\CoreLab\Delphi7;$sDir\Globus\Componentes7\CoreLab\DbxOda;$sDir\Globus\Componentes7\GlbReport;$sDir\Globus\Componentes\SynEdit\Packages;$sDir\Globus\Componentes\SynEdit\Source;$sDir\Globus\Componentes\SynEdit\SynGen;$sDir\Globus\Componentes\SynEdit\SynGen\CVS;$sDir\Globus\Componentes\SynEdit\Source\CVS;$sDir\Globus\Componentes\SynEdit\Packages\CVS;$sDir\Globus\Componentes\CTe;$sDir\Globus\Componentes\Systray;$sDir\Globus\Componentes7\ACBr\source\Pascal;$sDir\Globus\Componentes\Apisul;$sDir\Globus\Componentes\Opentech;$sDir\Globus\Componentes\NFSe;$sDir\Globus\Componentes\Carbocloro;$sDir\Globus\Utilitarios;$sDir\Globus\Comum\Units;$LibSistemas;$PFilesDir\Borland\Delphi7\XDBGrid;$PFilesDir\Borland\Delphi7\XDBGrid\Source;$sDir\Globus\Componentes\DSPACK234\src\DSPack;$sDir\Globus\Componentes\DSPACK234\src\DirectX9;$PFilesDir\Borland\Delphi7\Rave5\Lib;$PFilesDir\Borland\jcl\lib\d7;$PFilesDir\Borland\jvcl\lib\D7;$PFilesDir\Borland\jvcl\common;$PFilesDir\Borland\jvcl\Resources;$sDir\Globus\Componentes7\RxLibD7;$sDir\Globus\Componentes7\PngComponents\Source\obj;$sDir\Globus\Componentes7\PngComponents\Source\;$sDir\Globus\Componentes7\VclSkin_D7\Skin;",
	
    [string]$BuildOptions = "-`$A8 -`$B- -`$C+ -`$D+ -`$E- -`$F- -`$G+ -`$H+ -`$I+ -`$J- -`$K- -`$L+ -`$M- -`$N+ -`$O+ -`$P+ -`$Q- -`$R- -`$S- -`$T- -`$U- -`$V+ -`$W- -`$X+ -`$YD -`$Z1 -cg -AWinTypes=Windows;WinProcs=Windows;DbiTypes=BDE;DbiProcs=BDE;DbiErrs=BDE; -B -H+ -W+ -M -`$M16384,1048576 -K`$00400000 -LE""c:\program files (x86)\borland\delphi7\Projects\Bpl"" -LN""c:\program files (x86)\borland\delphi7\Projects\Bpl"" -w-UNSAFE_TYPE -w-UNSAFE_CODE -w-UNSAFE_CAST -w-UNIT_PLATFORM ",

    [boolean]$Reduzido = $false,

    [boolean]$SomentePassageiros = $false,
    [boolean]$SomenteFolha = $false,
    [boolean]$SomenteFinanceiro = $false,
    [boolean]$SomenteOficinas = $false,
    [boolean]$SomenteCargas = $false


 )

$arrPassageiros = "Acidentes.dpr","Arrecadacao.dpr","AgendaImpAutomatica.dpr","BilhetagemEletronica.dpr","ImportacaoFilipeta.dpr","VerificaConexao.dpr","PRJ_PRODATA.dpr","Coeficientes.dpr","CNC.dpr","DVS.dpr","Escala.dpr","EscalaRodoviaria.dpr","EscalaRodoviariaAutomatica.dpr","Fretamento.dpr","InfGeoPosicionamento.dpr","Passes.dpr","Plantao.dpr","AppService_SaidaRecolAuto.dpr","PVT.dpr","Retaguarda.dpr","ImpMaquina.dpr","SAF.dpr","Trafego.dpr","Turismo.dpr","VendaBilhetes.dpr","BaixaAutomaticaReservasComBoletos.dpr","ControlaProgLeitora.dpr","LeitoraDeBilhetes.dpr","RDA.dpr","CSB.dpr"
$arrPassageirosReduzido = "Acidentes.dpr","Arrecadacao.dpr","AgendaImpAutomatica.dpr","DVS.dpr","Escala.dpr","EscalaRodoviaria.dpr","EscalaRodoviariaAutomatica.dpr","Fretamento.dpr","Plantao.dpr","PVT.dpr","Retaguarda.dpr","ImpMaquina.dpr","SAF.dpr","Trafego.dpr","Turismo.dpr","VendaBilhetes.dpr","CSB.dpr"
$arrFolha = "Folha.dpr","Frequencia.dpr","RecursosHumanos.dpr","Terminal.dpr","Cracha.dpr","CVI.dpr","CVE.dpr","Cracha_ParametrosClient.dpr","Cracha_ColetorClient.dpr","Cracha_ParametrosServer.dpr","Cracha_ColetorServer.dpr","Frequencia_RelogioAutomatico.dpr","BEV.dpr"
$arrFolhaReduzido = "Folha.dpr","Frequencia.dpr","RecursosHumanos.dpr","Terminal.dpr","Frequencia_RelogioAutomatico.dpr"
$arrFinanceiro = "Ativo.dpr","Atualizacao.dpr","ControleBancario.dpr","Contabilidade.dpr","CPagar.dpr","CReceber.dpr","Controle.dpr","CTR_GravaArqINI.dpr","Escrituracao.dpr","PortalDeAcessoAoGlobus.dpr","Estatistica.dpr","GCC.dpr","ServicoEmail.dpr"
$arrFinanceiroReduzido = "Ativo.dpr","ControleBancario.dpr","Contabilidade.dpr","CPagar.dpr","CReceber.dpr","Escrituracao.dpr","GCC.dpr"
$arrOficinas = "Abastecimento.dpr","Componente.dpr","Compras.dpr","Estoque.dpr","Frota.dpr","Manutencao.dpr","Motor.dpr","Pneus.dpr","Tratamento.dpr","GlobusReport.dpr"
$arrOficinasReduzido = "Abastecimento.dpr","Componente.dpr","Compras.dpr","Estoque.dpr","Frota.dpr","Manutencao.dpr","Motor.dpr","Pneus.dpr","Tratamento.dpr" 
$arrCargas = "Cargas.dpr","TRR.dpr","CargasWeb.dpr","GGRisco.dpr","Terceiros.dpr","BIO.dpr","CargasAutomatizacao.dpr"
$arrCargasReduzido = "Cargas.dpr","TRR.dpr","CargasAutomatizacao.dpr" 

$BreakOnError =$true

function ObterTotalProjetos () {
        	
	if ($Reduzido -Or $SomentePassageiros -Or $SomenteFolha -Or $SomenteFinanceiro -Or $SomenteOficinas -Or $SomenteCargas)
	{

    	if ($SomentePassageiros) {
		  if ($Reduzido)
		  {
		    $retorno += $arrPassageirosReduzido.Count
		  }
		  else
		  {
    	    $retorno += $arrPassageiros.Count
		  }
    	}
		
    	if ($SomenteFolha) {
		  if ($Reduzido)
		  {
		    $retorno += $arrFolhaReduzido.Count
		  }
		  else
		  {
    	    $retorno += $arrFolha.Count
		  }        
    	}
		
    	if ($SomenteFinanceiro) {
		  if ($Reduzido)
		  {
		    $retorno += $arrFinanceiroReduzido.Count
		  }
		  else
		  {
    	    $retorno += $arrFinanceiro.Count
		  }  
		
    	}
		
    	if ($SomenteOficinas) {
		  if ($Reduzido)
		  {
		    $retorno += $arrOficinasReduzido.Count
		  }
		  else
		  {
    	    $retorno += $arrOficinas.Count
		  }  
    	}
				
    	if ($SomenteCargas) {
		  if ($Reduzido)
		  {
		    $retorno += $arrCargasReduzido.Count
		  }
		  else
		  {
    	    $retorno += $arrCargas.Count
		  } 		  	
    	}
		
		if (($Reduzido) -And (-not($SomentePassageiros -Or $SomenteFolha -Or $SomenteFinanceiro -Or $SomenteOficinas -Or $SomenteCargas))) {
			  $arrBuild = $arrCargasReduzido + $arrOficinasReduzido + $arrFinanceiroReduzido + $arrFolhaReduzido + $arrPassageirosReduzido
			  $retorno += $arrBuild.Count	  		  
		  }	
	}
	else{
	   $retorno =  $arrPassageiros.Count +	$arrFolha.Count + $arrFinanceiro.Count + $arrOficinas.Count + $arrCargas.Count 
	}

    return $retorno
}

function RetornarProjetos() {
        $arrBuild = @()

        if ($SomentePassageiros) {
		  if ($Reduzido)
		  {
			$arrBuild += $arrPassageirosReduzido
		  }
		  else
		  {
			$arrBuild += $arrPassageiros
		  }
    	}
		
    	if ($SomenteFolha) {
		  if ($Reduzido)
		  {
			$arrBuild +=  $arrFolhaReduzido
		  }
		  else
		  {
			$arrBuild += $arrFolha
		  }        
    	}
		
    	if ($SomenteFinanceiro) {
		  if ($Reduzido)
		  {
			$arrBuild += $arrFinanceiroReduzido
		  }
		  else
		  {
			$arrBuild += $arrFinanceiro
		  }  
		
    	}
		
    	if ($SomenteOficinas) {
		  if ($Reduzido)
		  {
			$arrBuild += $arrOficinasReduzido
		  }
		  else
		  {
    	   
			$arrBuild += $arrOficinas
		  }  
    	}
				
    	if ($SomenteCargas) {
		  if ($Reduzido)
		  {		    
			$arrBuild += $arrCargasReduzido
		  }
		  else
		  {
			$arrBuild += $arrCargas
		  } 		  	
    	}
		
		if (($Reduzido) -And (-not($SomentePassageiros -Or $SomenteFolha -Or $SomenteFinanceiro -Or $SomenteOficinas -Or $SomenteCargas))) {
			  $arrBuild = $arrCargasReduzido + $arrOficinasReduzido + $arrFinanceiroReduzido + $arrFolhaReduzido + $arrPassageirosReduzido  
		  }	

        return $arrBuild

}

[int]$TotalProjetos = ObterTotalProjetos 

$Projetos = RetornarProjetos

[int]$Count = 0

function ObterDiretorioDestino ()
{
    if ($branch -eq '') 
    {
        return "$aDir\Globus\Sistemas"
    } else {
        Write-Host $branch
        $branchName = $branch

        CreateDirectories -branchName $branchName | Out-Null

        $isHotfix = IsHotfix -branchName $branchName
        $isFeature = IsFeature -branchName $branchName
        $isClient = IsClient -branchName $branchName
        $isMaster = IsMaster -branchName $branchName
        $isDevelop = IsDevelop -branchName $branchName

        if ($isHotfix) {
            Write-Host 'É hotfix'
        } 


        if ($isClient) {
            Write-Host 'É cliente especifico'
            $code = GetClientCode  -branchName $branchName
            $name = GetClientName  -branchName $branchName

            Write-Host $code
            Write-Host $Name
        } 

        if ($isFeature) {
            Write-Host 'É feature'
        } 

        if ($isMaster) {
            Write-Host 'É master'
        } 

        if ($isDevelop) {
            Write-Host 'É develop'
        }   
        
        $ndir =  $aDir + '\' + $branchName.Replace($strOrigin, '')  + '\' + $buildID
        
        Write-Host $ndir
        return $ndir
    }
}

function IsHotfix ([string]$branchName) 
{
    $branchName.Replace($strOrigin, '').StartsWith('hotfix',"CurrentCultureIgnoreCase")
}

function IsFeature ([string]$branchName) 
{
    $branchName.Replace($strOrigin, '').StartsWith('feature',"CurrentCultureIgnoreCase")
}


function IsClient([string]$branchName) 
{
    $branchName.Replace($strOrigin, '').StartsWith('Clientes',"CurrentCultureIgnoreCase")
}

function IsMaster([string]$branchName) 
{
    $branchName.Replace($strOrigin, '').StartsWith('master',"CurrentCultureIgnoreCase")
}

function IsDevelop([string]$branchName) 
{
    $branchName.Replace($strOrigin, '').StartsWith('develop',"CurrentCultureIgnoreCase")
}

function GetClientCode ([string] $branchName) 
{
    $arr = $branchName.Split('/');

    $name = $arr[$arr.Count -1]

    return $name.Substring($name.IndexOf('_') + 1)
}

function GetClientName ([string] $branchName) 
{
    $arr = $branchName.Split('/');

    $name = $arr[$arr.Count -1]

    return $name.Substring(0, $name.IndexOf('_'))
}

function GetBranchName ([string] $branchName) 
{
    $arr = $branchName.Split('/');

    $name = $arr[$arr.Count -1]

    return $name
}

function CreateDirectories ([string] $branchName) 
{
    $Dir = $aDir + '\' + $branchName.Replace($strOrigin, '')
    
    New-Item $Dir -type directory -force

}

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
    if ($Reduzido -Or $SomentePassageiros -Or $SomenteFolha -Or $SomenteFinanceiro -Or $SomenteOficinas -Or $SomenteCargas) {
        if ($Projetos -notcontains $ProjectName) {
            return
        }   
        
    }
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
    #$stderr = $p.StandardError.ReadToEnd()
    $now=Get-Date -format "dd-MM-yyyy HH:mm:ss"
	$script:Count += 1
    If ($p.ExitCode -gt 0) {
	 
        #Throw?
        If ($BreakOnError -eq $true) {            
			#Write-Host "$now - stdout: $stdout"
			Write-Host "$now - Ocorreu um erro ao compilar o projeto $ProjectName. Verifique os logs para maiores detalhes! ($script:Count de $TotalProjetos)"           
			#Throw("xxxxxxxxxxx")
        } else {            
            #Write-Host "$now - stdout: $stdout"			
			Write-Host "$now - Ocorreu um erro ao compilar o projeto $ProjectName. Verifique os logs para maiores detalhes! ($script:Count de $TotalProjetos)"
        }
    } else {
	 
		Write-Host "$now - Compilação $ProjectName concluída! ($script:Count de $TotalProjetos)"
		 Start-Job -ScriptBlock $scriptBlock -ArgumentList @($ExeName)
        
    }
    $p.ExitCode
}


$now=Get-Date -format "dd/MM/yyyy HH:mm"

Write-Host "$now - Inicio do Build"
Write-Host ""

Write-Host "$now - Criando DataHora.txt"
$DataHora = "Edit1.Text := '$now';" | Out-File -NoNewline -Encoding "Ascii" "$sDir\Globus\Sistemas\DataHora.txt"

$branchAmbInterno = $zbranch.Replace($strOrigin, '')

Write-Host "$now - Criando NomeBuildInterno.txt"
$NomeBuildInterno = " If (vcUsuarioManagerComSenhaUm) Then
                         frmMenuPrincipal.Caption := frmMenuPrincipal.Caption + ' - Branch: $branchAmbInterno / Build: $zbuildID'; "  | Out-File -NoNewline -Encoding "Ascii" "$sDir\Globus\Sistemas\NomeBuildInterno.txt"

$now=Get-Date -format "dd/MM/yyyy HH:mm:ss"

Write-Host "$now - Iniciando projetos"

$rDir = ObterDiretorioDestino

Write-Host "$now - ReleaseDir: $rDir"

$i = BuildProjeto -ProjectName Abastecimento.dpr -ProjectDir "$sDir\Globus\Sistemas\Abastecimento" -ReleaseDir "$rDir\Abastecimento"
$i = BuildProjeto -ProjectName Acidentes.dpr -ProjectDir "$sDir\Globus\Sistemas\Acidentes" -ReleaseDir "$rDir\Acidentes"
$i = BuildProjeto -ProjectName AgendaImpAutomatica.dpr -ProjectDir "$sDir\Globus\Sistemas\Arrecadacao" -ReleaseDir "$rDir\Arrecadacao"
$i = BuildProjeto -ProjectName AppService_SaidaRecolAuto.dpr -ProjectDir "$sDir\Globus\Sistemas\Plantao\AppService_SaidaRecolAuto" -ReleaseDir "$rDir\Plantao\AppService_SaidaRecolAuto"
$i = BuildProjeto -ProjectName Arrecadacao.dpr -ProjectDir "$sDir\Globus\Sistemas\Arrecadacao" -ReleaseDir "$rDir\Arrecadacao"
$i = BuildProjeto -ProjectName Ativo.dpr -ProjectDir "$sDir\Globus\Sistemas\Ativo" -ReleaseDir "$rDir\Ativo"
$i = BuildProjeto -ProjectName Atualizacao.dpr -ProjectDir "$sDir\Globus\Sistemas\Atualizacao" -ReleaseDir "$rDir\Atualizacao"
$i = BuildProjeto -ProjectName ServicoEmail.dpr -ProjectDir "$sDir\Globus\Sistemas\ServicoEmail" -ReleaseDir "$rDir\ServicoEmail"
$i = BuildProjeto -ProjectName BaixaAutomaticaReservasComBoletos.dpr -ProjectDir "$sDir\Globus\Sistemas\Venda Bilhetes" -ReleaseDir "$rDir\Venda Bilhetes"
$i = BuildProjeto -ProjectName BilhetagemEletronica.dpr -ProjectDir "$sDir\Globus\Sistemas\Arrecadacao\BilhetagemMetra" -ReleaseDir "$rDir\Arrecadacao\BilhetagemMETRA"
$i = BuildProjeto -ProjectName BIO.dpr -ProjectDir "$sDir\Globus\Sistemas\BIO" -ReleaseDir "$rDir\BIO"
$i = BuildProjeto -ProjectName Cargas.dpr -ProjectDir "$sDir\Globus\Sistemas\Cargas" -ReleaseDir "$rDir\Cargas"
$i = BuildProjeto -ProjectName CargasAutomatizacao.dpr -ProjectDir "$sDir\Globus\Sistemas\Cargas\Automatizacao" -ReleaseDir "$rDir\Cargas\Automatizacao"
$i = BuildProjeto -ProjectName CargasWeb.dpr -ProjectDir "$sDir\Globus\Sistemas\Cargas_WEB\CGI-BIN" -ReleaseDir "$rDir\Cargas_WEB\CGI-BIN"
$i = BuildProjeto -ProjectName CNC.dpr -ProjectDir "$sDir\Globus\Sistemas\Conciliacao" -ReleaseDir "$rDir\Conciliacao"
$i = BuildProjeto -ProjectName Coeficientes.dpr -ProjectDir "$sDir\Globus\Sistemas\Coeficientes" -ReleaseDir "$rDir\Coeficientes"
$i = BuildProjeto -ProjectName Componente.dpr -ProjectDir "$sDir\Globus\Sistemas\Componente" -ReleaseDir "$rDir\Componente"
$i = BuildProjeto -ProjectName Compras.dpr -ProjectDir "$sDir\Globus\Sistemas\Compras" -ReleaseDir "$rDir\Compras"
$i = BuildProjeto -ProjectName Contabilidade.dpr -ProjectDir "$sDir\Globus\Sistemas\Contabilidade" -ReleaseDir "$rDir\Contabilidade"
$i = BuildProjeto -ProjectName ControlaProgLeitora.dpr -ProjectDir "$sDir\Globus\Sistemas\Venda Bilhetes" -ReleaseDir "$rDir\Venda Bilhetes"
$i = BuildProjeto -ProjectName Controle.dpr -ProjectDir "$sDir\Globus\Sistemas\Controle" -ReleaseDir "$rDir\Controle"
$i = BuildProjeto -ProjectName ControleBancario.dpr -ProjectDir "$sDir\Globus\Sistemas\Bancos" -ReleaseDir "$rDir\Bancos"
$i = BuildProjeto -ProjectName CPagar.dpr -ProjectDir "$sDir\Globus\Sistemas\ContasPagar" -ReleaseDir "$rDir\ContasPagar"
$i = BuildProjeto -ProjectName Cracha.dpr -ProjectDir "$sDir\Globus\Sistemas\Cracha" -ReleaseDir "$rDir\Cracha"
$i = BuildProjeto -ProjectName Cracha_ColetorClient.dpr -ProjectDir "$sDir\Globus\Sistemas\Cracha\Residentes" -ReleaseDir "$rDir\Cracha\Residentes"
$i = BuildProjeto -ProjectName Cracha_ColetorServer.dpr -ProjectDir "$sDir\Globus\Sistemas\Cracha\Residentes" -ReleaseDir "$rDir\Cracha\Residentes"
$i = BuildProjeto -ProjectName Cracha_ParametrosClient.dpr -ProjectDir "$sDir\Globus\Sistemas\Cracha\Residentes" -ReleaseDir "$rDir\Cracha\Residentes"
$i = BuildProjeto -ProjectName Cracha_ParametrosServer.dpr -ProjectDir "$sDir\Globus\Sistemas\Cracha\Residentes" -ReleaseDir "$rDir\Cracha\Residentes"
$i = BuildProjeto -ProjectName CReceber.dpr -ProjectDir "$sDir\Globus\Sistemas\ContasReceber" -ReleaseDir "$rDir\ContasReceber"
$i = BuildProjeto -ProjectName CTR_GravaArqINI.dpr -ProjectDir "$sDir\Globus\Sistemas\Controle" -ReleaseDir "$rDir\Controle"
$i = BuildProjeto -ProjectName CVE.dpr -ProjectDir "$sDir\Globus\Sistemas\ConversaoExportacao" -ReleaseDir "$rDir\ConversaoExportacao"
$i = BuildProjeto -ProjectName CVI.dpr -ProjectDir "$sDir\Globus\Sistemas\ConversaoImportacao" -ReleaseDir "$rDir\ConversaoImportacao"
$i = BuildProjeto -ProjectName DVS.dpr -ProjectDir "$sDir\Globus\Sistemas\DVS" -ReleaseDir "$rDir\DVS"
#$i = BuildProjeto -ProjectName EMTU.dpr -ProjectDir "$sDir\Globus\Sistemas\EMTU" -ReleaseDir "$rDir\EMTU"
$i = BuildProjeto -ProjectName Escala.dpr -ProjectDir "$sDir\Globus\Sistemas\Escala" -ReleaseDir "$rDir\Escala"
$i = BuildProjeto -ProjectName EscalaRodoviaria.dpr -ProjectDir "$sDir\Globus\Sistemas\EscalaRodoviaria" -ReleaseDir "$rDir\EscalaRodoviaria"
$i = BuildProjeto -ProjectName EscalaRodoviariaAutomatica.dpr -ProjectDir "$sDir\Globus\Sistemas\EscalaRodoviariaAutomatica" -ReleaseDir "$rDir\EscalaRodoviariaAutomatica"
$i = BuildProjeto -ProjectName Csb.dpr -ProjectDir "$sDir\Globus\Sistemas\ConsolidadorBE" -ReleaseDir "$rDir\ConsolidadorBE"
$i = BuildProjeto -ProjectName Escrituracao.dpr -ProjectDir "$sDir\Globus\Sistemas\Escrituracao" -ReleaseDir "$rDir\Escrituracao"
$i = BuildProjeto -ProjectName Estatistica.dpr -ProjectDir "$sDir\Globus\Sistemas\Estatistica" -ReleaseDir "$rDir\Estatistica"
$i = BuildProjeto -ProjectName Estoque.dpr -ProjectDir "$sDir\Globus\Sistemas\Estoque" -ReleaseDir "$rDir\Estoque"
$i = BuildProjeto -ProjectName Folha.dpr -ProjectDir "$sDir\Globus\Sistemas\Folha" -ReleaseDir "$rDir\Folha"
$i = BuildProjeto -ProjectName Frequencia.dpr -ProjectDir "$sDir\Globus\Sistemas\Frequencia" -ReleaseDir "$rDir\Frequencia"
$i = BuildProjeto -ProjectName Frequencia_RelogioAutomatico.dpr -ProjectDir "$sDir\Globus\Sistemas\Frequencia\Residentes" -ReleaseDir "$rDir\Frequencia\Residentes"
$i = BuildProjeto -ProjectName Fretamento.dpr -ProjectDir "$sDir\Globus\Sistemas\Fretamento" -ReleaseDir "$rDir\Fretamento"
$i = BuildProjeto -ProjectName Frota.dpr -ProjectDir "$sDir\Globus\Sistemas\Frota" -ReleaseDir "$rDir\Frota"
$i = BuildProjeto -ProjectName GCC.dpr -ProjectDir "$sDir\Globus\Sistemas\GCC" -ReleaseDir "$rDir\GCC"
$i = BuildProjeto -ProjectName GGRisco.dpr -ProjectDir "$sDir\Globus\Sistemas\GGRisco" -ReleaseDir "$rDir\GGRisco"
$i = BuildProjeto -ProjectName GlobusReport.dpr -ProjectDir "$sDir\Globus\Sistemas\GlobusReport" -ReleaseDir "$rDir\GlobusReport"
$i = BuildProjeto -ProjectName ImpMaquina.dpr -ProjectDir "$sDir\Globus\Sistemas\Retaguarda\RETImportacaoMaquina" -ReleaseDir "$rDir\Retaguarda"
$i = BuildProjeto -ProjectName ImportacaoFilipeta.dpr -ProjectDir "$sDir\Globus\Sistemas\Arrecadacao\ImportacaoFILIPETA" -ReleaseDir "$rDir\Arrecadacao"
$i = BuildProjeto -ProjectName VerificaConexao.dpr -ProjectDir "$sDir\Globus\Sistemas\Arrecadacao\ImportacaoFILIPETA\VerificaConexao" -ReleaseDir "$rDir\Arrecadacao"
$i = BuildProjeto -ProjectName InfGeoPosicionamento.dpr -ProjectDir "$sDir\Globus\Sistemas\InfGeoPosicionamento" -ReleaseDir "$rDir\InfGeoPosicionamento"
$i = BuildProjeto -ProjectName LeitoraDeBilhetes.dpr -ProjectDir "$sDir\Globus\Sistemas\Venda Bilhetes" -ReleaseDir "$rDir\Venda Bilhetes"
$i = BuildProjeto -ProjectName Manutencao.dpr -ProjectDir "$sDir\Globus\Sistemas\Manutencao" -ReleaseDir "$rDir\Manutencao"
$i = BuildProjeto -ProjectName Motor.dpr -ProjectDir "$sDir\Globus\Sistemas\Motor" -ReleaseDir "$rDir\Motor"
$i = BuildProjeto -ProjectName Passes.dpr -ProjectDir "$sDir\Globus\Sistemas\Passes" -ReleaseDir "$rDir\Passes"
$i = BuildProjeto -ProjectName Plantao.dpr -ProjectDir "$sDir\Globus\Sistemas\Plantao" -ReleaseDir "$rDir\Plantao"
$i = BuildProjeto -ProjectName Pneus.dpr -ProjectDir "$sDir\Globus\Sistemas\Pneus" -ReleaseDir "$rDir\Pneus"
$i = BuildProjeto -ProjectName PortalDeAcessoAoGlobus.dpr -ProjectDir "$sDir\Globus\Sistemas\MENU" -ReleaseDir "$rDir\Menu"
$i = BuildProjeto -ProjectName PRJ_PRODATA.dpr -ProjectDir "$sDir\Globus\Sistemas\Arrecadacao\PRJ_PRODATA" -ReleaseDir "$rDir\Arrecadacao\PRJ_PRODATA"
$i = BuildProjeto -ProjectName PVT.dpr -ProjectDir "$sDir\Globus\Sistemas\PVT" -ReleaseDir "$rDir\PVT"
$i = BuildProjeto -ProjectName RecursosHumanos.dpr -ProjectDir "$sDir\Globus\Sistemas\RecursosHumanos" -ReleaseDir "$rDir\RecursosHumanos"
$i = BuildProjeto -ProjectName Retaguarda.dpr -ProjectDir "$sDir\Globus\Sistemas\Retaguarda" -ReleaseDir "$rDir\Retaguarda"
$i = BuildProjeto -ProjectName SAF.dpr -ProjectDir "$sDir\Globus\Sistemas\Sistema Anti-Fraude"  -ReleaseDir "$rDir\Sistema Anti-Fraude"
$i = BuildProjeto -ProjectName Terceiros.dpr -ProjectDir "$sDir\Globus\Sistemas\Terceiros" -ReleaseDir "$rDir\Terceiros"
$i = BuildProjeto -ProjectName Terminal.dpr -ProjectDir "$sDir\Globus\Sistemas\Terminal" -ReleaseDir "$rDir\Terminal"
$i = BuildProjeto -ProjectName Trafego.dpr -ProjectDir "$sDir\Globus\Sistemas\Trafego" -ReleaseDir "$rDir\Trafego"
$i = BuildProjeto -ProjectName Tratamento.dpr -ProjectDir "$sDir\Globus\Sistemas\TratamentoTermico" -ReleaseDir "$rDir\TratamentoTermico"
$i = BuildProjeto -ProjectName TRR.dpr -ProjectDir "$sDir\Globus\Sistemas\TRR" -ReleaseDir "$rDir\TRR"
$i = BuildProjeto -ProjectName Turismo.dpr -ProjectDir "$sDir\Globus\Sistemas\Turismo" -ReleaseDir "$rDir\Turismo"
$i = BuildProjeto -ProjectName VendaBilhetes.dpr -ProjectDir "$sDir\Globus\Sistemas\Venda Bilhetes" -ReleaseDir "$rDir\Venda Bilhetes"
$i = BuildProjeto -ProjectName BEV.dpr -ProjectDir "$sDir\Globus\Sistemas\BEV" -ReleaseDir "$rDir\BEV"


$now=Get-Date -format "dd/MM/yyyy HH:mm"

Write-Host "$now - Projetos finalizados. Aguardando ASPack..."

While (Get-Job -State "Running")
{
  Start-Sleep 10
}

# Getting the information back from the jobs
Get-Job | Receive-Job

$now=Get-Date -format "dd/MM/yyyy HH:mm"

Write-Host "$now - Finalizado processo de build"
