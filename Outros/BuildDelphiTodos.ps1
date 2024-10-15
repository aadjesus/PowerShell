param (
	[string]$sDir = "C:\_OUTROS_EMP_\_OUTROS_\src",
	[string]$aDir = "C:\a",
	[string]$bDir = "C:\b",
    [string]$PFilesDir = "C:\Program Files (x86)",
    [string]$branch = "",
    [string]$buildID = "",
    [string]$strOrigin = 'refs/heads/', 
    [string]$zbranch = "",
    [string]$zbuildID = "",

    [string]$IncludeDir = "$sDir\_OUTROS_\Utilitarios;$sDir\_OUTROS_;$sDir;$PFilesDir\Borland\jcl\source\include",
    [string]$LibDirBgm = "$sDir\_OUTROS_\Comum\Units;$sDir\_OUTROS_\componentes;$sDir\_OUTROS_\componentes7;$sDir\_OUTROS_\component\delphi70;$sDir\_OUTROS_\componentes\rdprintd7;$sDir\_OUTROS_\componentes7\zipmaster;$sDir\_OUTROS_\componentes\crystal7vcl4;$sDir\_OUTROS_\componentes\jvcbarcode;$sDir\_OUTROS_\componentes\exportaqreport\source;$sDir\_OUTROS_\componentes\nfe;$sDir\_OUTROS_\componentes7\rxlibd7\units;$sDir\_OUTROS_\componentes\email;$sDir\_OUTROS_\Componentes\MaterEdit;$sDir\_OUTROS_\componentes7\sakemail;$sDir\_OUTROS_\componentes\barras;$sDir\_OUTROS_\Componentes\GLBFilter;$sDir\_OUTROS_\componentes\Cargas;$sDir\_OUTROS_\componentes\contaspagar;$sDir\_OUTROS_\componentes\ContasReceber;$sDir\_OUTROS_\Componentes\BarrasNovo\lib32;$sDir\_OUTROS_\componentes\emailnovo;$sDir\_OUTROS_\Componentes\FormatParam;$sDir\_OUTROS_\Componentes\Calendarios;$sDir\_OUTROS_\Componentes\Frequencia;$sDir\_OUTROS_\Componentes\SelecaoAle;$sDir\_OUTROS_\Componentes\BGMXML;$sDir\_OUTROS_\Componentes\SynEdit;$sDir\_OUTROS_\Componentes7\ZipMaster;$sDir\_OUTROS_\Componentes7\ZipMaster\Units;$sDir\_OUTROS_\Componentes7\ZipMaster\Units\VCL;$sDir\_OUTROS_\Componentes7\CoreLab;$sDir\_OUTROS_\Componentes7\CoreLab\Delphi7;$sDir\_OUTROS_\Componentes7\CoreLab\DbxOda;$sDir\_OUTROS_\Componentes7\GlbReport;$sDir\_OUTROS_\Componentes\SynEdit\Packages;$sDir\_OUTROS_\Componentes\SynEdit\Source;$sDir\_OUTROS_\Componentes\SynEdit\SynGen;$sDir\_OUTROS_\Componentes\SynEdit\SynGen\CVS;$sDir\_OUTROS_\Componentes\SynEdit\Source\CVS;$sDir\_OUTROS_\Componentes\SynEdit\Packages\CVS;$sDir\_OUTROS_\Componentes\CTe;$sDir\_OUTROS_\Componentes\Systray;$sDir\_OUTROS_\Componentes7\ACBr\source\Pascal;$sDir\_OUTROS_\Componentes\Apisul;$sDir\_OUTROS_\Componentes\Opentech;$sDir\_OUTROS_\Componentes\NFSe;$sDir\_OUTROS_\Componentes\Carbocloro;$sDir\_OUTROS_\Componentes\DSPACK234\src\DSPack;$sDir\_OUTROS_\Componentes\DSPACK234\src\DirectX9;$sDir\_OUTROS_\Componentes7\RxLibD7;$sDir\_OUTROS_\Componentes7\PngComponents\Source\obj;$sDir\_OUTROS_\Componentes7\PngComponents\Source\;$sDir\_OUTROS_\Utilitarios;$sDir\_OUTROS_\Componentes7\VclSkin_D7\Skin",
    [string]$LibDirDelphi = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\Delphi7\Bin;$PFilesDir\Borland\Delphi7\Imports;$PFilesDir\Borland\Delphi7\Projects\Bpl;$PFilesDir\Borland\Delphi7\Source\ToolsAPI;$PFilesDir\Borland\jcl\lib\d7;$PFilesDir\Borland\jvcl\lib\D7;$PFilesDir\Borland\jvcl\common;$PFilesDir\Borland\jvcl\Resources;$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\jcl\source\include;$PFilesDir\Borland\Delphi7\XDBGrid;$PFilesDir\Borland\Delphi7\XDBGrid\Source;$PFilesDir\Borland\Delphi7\Rave5\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Lib\D7;$PFilesDir\Gnostice\eDocEngine VCL\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Source\QR;$PFilesDir\Gnostice\Shared3\Source\Rtl;$PFilesDir\Gnostice\Shared3\Lib\D7;",
	[string]$LibSistemas = "$sDir\_OUTROS_\Sistemas\ContasPagar;$sDir\_OUTROS_\Sistemas\ContasReceber;$sDir\_OUTROS_\Sistemas\BIO;$sDir\_OUTROS_\Sistemas\Cargas\AUTOMATIZACAO;$sDir\_OUTROS_\SISTEMAS;$sDir\_OUTROS_\Sistemas\GGRisco;$sDir\_OUTROS_\Sistemas\Cargas;$sDir\_OUTROS_\Sistemas\Abastecimento;$sDir\_OUTROS_\Sistemas\plantao;$sDir\_OUTROS_\Sistemas\ACIDENTES;$sDir\_OUTROS_\Sistemas\Arrecadacao;$sDir\_OUTROS_\Sistemas\Ativo;$sDir\_OUTROS_\Sistemas\Bancos;$sDir\_OUTROS_\Sistemas\Componente;$sDir\_OUTROS_\Sistemas\Compras;$sDir\_OUTROS_\Sistemas\gcc;$sDir\_OUTROS_\Sistemas\ContasAPagar;$sDir\_OUTROS_\Sistemas\ContasAReceber;$sDir\_OUTROS_\Sistemas\Contabilidade;$sDir\_OUTROS_\Sistemas\Controle;$sDir\_OUTROS_\Sistemas\DESPACHANTE;$sDir\_OUTROS_\Sistemas\DVS;$sDir\_OUTROS_\Sistemas\Escala;$sDir\_OUTROS_\Sistemas\EscalaRodoviaria;$sDir\_OUTROS_\Sistemas\EscalaRodoviariaAutomatica;$sDir\_OUTROS_\Sistemas\Escrituracao;$sDir\_OUTROS_\Sistemas\Estoque;$sDir\_OUTROS_\Sistemas\Frequencia;$sDir\_OUTROS_\Sistemas\Fretamento;$sDir\_OUTROS_\Sistemas\Frota;$sDir\_OUTROS_\Sistemas\Folha;$sDir\_OUTROS_\Sistemas\Manutencao;$sDir\_OUTROS_\Sistemas\Motor;$sDir\_OUTROS_\Sistemas\Passes;$sDir\_OUTROS_\Sistemas\PVT;$sDir\_OUTROS_\Sistemas\Pneus;$sDir\_OUTROS_\Sistemas\RecursosHumanos;$sDir\_OUTROS_\Sistemas\Retaguarda;$sDir\_OUTROS_\Sistemas\Trafego;$sDir\_OUTROS_\Sistemas\Terminal;$sDir\_OUTROS_\Sistemas\Turismo;$sDir\_OUTROS_\Sistemas\comodato;$sDir\_OUTROS_\Sistemas\TRR;$sDir\_OUTROS_\Sistemas\TratamentoTermico;$sDir\_OUTROS_\Sistemas\Terceiros;$sDir\_OUTROS_\Sistemas\Venda Bilhetes;$sDir\_OUTROS_\Sistemas\Gerador;$sDir\_OUTROS_\Sistemas\InfGeoPosicionamento;$sDir\_OUTROS_\Sistemas\Cracha\Residentes;$sDir\_OUTROS_\Sistemas\EMTU;$sDir\_OUTROS_\Sistemas\EMTU;$sDir\_OUTROS_\Sistemas\ConsolidadorBE;$sDir\_OUTROS_\Sistemas\BEV;",
	[string]$ResourcesDir = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\JVCL\resources;$LibSistemas",
	
	[string]$LibDirFull = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\Delphi7\Bin;$PFilesDir\Borland\Delphi7\Imports;$PFilesDir\Borland\Delphi7\Projects\Bpl;$PFilesDir\Borland\Delphi7\Source\ToolsAPI;$PFilesDir\Gnostice\eDocEngine VCL\Lib\D7;$PFilesDir\Gnostice\eDocEngine VCL\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Source\QR;$PFilesDir\Gnostice\Shared3\Source\Rtl;$PFilesDir\Gnostice\Shared3\Lib\D7;$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\jcl\source\include;$sDir\_OUTROS_\componentes;$sDir\_OUTROS_\componentes7;$sDir\_OUTROS_\component\delphi70;$sDir\_OUTROS_\componentes\rdprintd7;$sDir\_OUTROS_\componentes7\zipmaster;$sDir\_OUTROS_\componentes\crystal7vcl4;$sDir\_OUTROS_\componentes\jvcbarcode;$sDir\_OUTROS_\componentes\exportaqreport\source;$sDir\_OUTROS_\componentes\nfe;$sDir\_OUTROS_\componentes7\rxlibd7\units;$sDir\_OUTROS_\componentes\email;$sDir\_OUTROS_\Componentes\MaterEdit;$sDir\_OUTROS_\componentes7\sakemail;$sDir\_OUTROS_\componentes\barras;$sDir\_OUTROS_\Componentes\GLBFilter;$sDir\_OUTROS_\componentes\Cargas;$sDir\_OUTROS_\componentes\contaspagar;$sDir\_OUTROS_\componentes\ContasReceber;$sDir\_OUTROS_\Componentes\BarrasNovo\lib32;$sDir\_OUTROS_\componentes\emailnovo;$sDir\_OUTROS_\Componentes\FormatParam;$sDir\_OUTROS_\Componentes\Calendarios;$sDir\_OUTROS_\Componentes\Frequencia;$sDir\_OUTROS_\Componentes\SelecaoAle;$sDir\_OUTROS_\Componentes\BGMXML;$sDir\_OUTROS_\Componentes\SynEdit;$sDir\_OUTROS_\Componentes7\ZipMaster;$sDir\_OUTROS_\Componentes7\ZipMaster\Units;$sDir\_OUTROS_\Componentes7\ZipMaster\Units\VCL;$sDir\_OUTROS_\Componentes7\CoreLab;$sDir\_OUTROS_\Componentes7\CoreLab\Delphi7;$sDir\_OUTROS_\Componentes7\CoreLab\DbxOda;$sDir\_OUTROS_\Componentes7\GlbReport;$sDir\_OUTROS_\Componentes\SynEdit\Packages;$sDir\_OUTROS_\Componentes\SynEdit\Source;$sDir\_OUTROS_\Componentes\SynEdit\SynGen;$sDir\_OUTROS_\Componentes\SynEdit\SynGen\CVS;$sDir\_OUTROS_\Componentes\SynEdit\Source\CVS;$sDir\_OUTROS_\Componentes\SynEdit\Packages\CVS;$sDir\_OUTROS_\Componentes\CTe;$sDir\_OUTROS_\Componentes\Systray;$sDir\_OUTROS_\Componentes7\ACBr\source\Pascal;$sDir\_OUTROS_\Componentes\Apisul;$sDir\_OUTROS_\Componentes\Opentech;$sDir\_OUTROS_\Componentes\NFSe;$sDir\_OUTROS_\Componentes\Carbocloro;$sDir\_OUTROS_\Utilitarios;$sDir\_OUTROS_\Comum\Units;$LibSistemas;$PFilesDir\Borland\Delphi7\XDBGrid;$PFilesDir\Borland\Delphi7\XDBGrid\Source;$sDir\_OUTROS_\Componentes\DSPACK234\src\DSPack;$sDir\_OUTROS_\Componentes\DSPACK234\src\DirectX9;$PFilesDir\Borland\Delphi7\Rave5\Lib;$PFilesDir\Borland\jcl\lib\d7;$PFilesDir\Borland\jvcl\lib\D7;$PFilesDir\Borland\jvcl\common;$PFilesDir\Borland\jvcl\Resources;$sDir\_OUTROS_\Componentes7\RxLibD7;$sDir\_OUTROS_\Componentes7\PngComponents\Source\obj;$sDir\_OUTROS_\Componentes7\PngComponents\Source\;$sDir\_OUTROS_\Componentes7\VclSkin_D7\Skin;",
	[string]$ObjectsDir = "$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\Delphi7\Bin;$PFilesDir\Borland\Delphi7\Imports;$PFilesDir\Borland\Delphi7\Projects\Bpl;$PFilesDir\Borland\Delphi7\Source\ToolsAPI;$PFilesDir\Gnostice\eDocEngine VCL\Lib\D7;$PFilesDir\Gnostice\eDocEngine VCL\Lib;$PFilesDir\Gnostice\eDocEngine VCL\Source\QR;$PFilesDir\Gnostice\Shared3\Source\Rtl;$PFilesDir\Gnostice\Shared3\Lib\D7;$PFilesDir\Borland\Delphi7\Lib;$PFilesDir\Borland\jcl\source\include;$sDir\_OUTROS_\componentes;$sDir\_OUTROS_\componentes7;$sDir\_OUTROS_\component\delphi70;$sDir\_OUTROS_\componentes\rdprintd7;$sDir\_OUTROS_\componentes7\zipmaster;$sDir\_OUTROS_\componentes\crystal7vcl4;$sDir\_OUTROS_\componentes\jvcbarcode;$sDir\_OUTROS_\componentes\exportaqreport\source;$sDir\_OUTROS_\componentes\nfe;$sDir\_OUTROS_\componentes7\rxlibd7\units;$sDir\_OUTROS_\componentes\email;$sDir\_OUTROS_\Componentes\MaterEdit;$sDir\_OUTROS_\componentes7\sakemail;$sDir\_OUTROS_\componentes\barras;$sDir\_OUTROS_\Componentes\GLBFilter;$sDir\_OUTROS_\componentes\Cargas;$sDir\_OUTROS_\componentes\contaspagar;$sDir\_OUTROS_\componentes\ContasReceber;$sDir\_OUTROS_\Componentes\BarrasNovo\lib32;$sDir\_OUTROS_\componentes\emailnovo;$sDir\_OUTROS_\Componentes\FormatParam;$sDir\_OUTROS_\Componentes\Calendarios;$sDir\_OUTROS_\Componentes\Frequencia;$sDir\_OUTROS_\Componentes\SelecaoAle;$sDir\_OUTROS_\Componentes\BGMXML;$sDir\_OUTROS_\Componentes\SynEdit;$sDir\_OUTROS_\Componentes7\ZipMaster;$sDir\_OUTROS_\Componentes7\ZipMaster\Units;$sDir\_OUTROS_\Componentes7\ZipMaster\Units\VCL;$sDir\_OUTROS_\Componentes7\CoreLab;$sDir\_OUTROS_\Componentes7\CoreLab\Delphi7;$sDir\_OUTROS_\Componentes7\CoreLab\DbxOda;$sDir\_OUTROS_\Componentes7\GlbReport;$sDir\_OUTROS_\Componentes\SynEdit\Packages;$sDir\_OUTROS_\Componentes\SynEdit\Source;$sDir\_OUTROS_\Componentes\SynEdit\SynGen;$sDir\_OUTROS_\Componentes\SynEdit\SynGen\CVS;$sDir\_OUTROS_\Componentes\SynEdit\Source\CVS;$sDir\_OUTROS_\Componentes\SynEdit\Packages\CVS;$sDir\_OUTROS_\Componentes\CTe;$sDir\_OUTROS_\Componentes\Systray;$sDir\_OUTROS_\Componentes7\ACBr\source\Pascal;$sDir\_OUTROS_\Componentes\Apisul;$sDir\_OUTROS_\Componentes\Opentech;$sDir\_OUTROS_\Componentes\NFSe;$sDir\_OUTROS_\Componentes\Carbocloro;$sDir\_OUTROS_\Utilitarios;$sDir\_OUTROS_\Comum\Units;$LibSistemas;$PFilesDir\Borland\Delphi7\XDBGrid;$PFilesDir\Borland\Delphi7\XDBGrid\Source;$sDir\_OUTROS_\Componentes\DSPACK234\src\DSPack;$sDir\_OUTROS_\Componentes\DSPACK234\src\DirectX9;$PFilesDir\Borland\Delphi7\Rave5\Lib;$PFilesDir\Borland\jcl\lib\d7;$PFilesDir\Borland\jvcl\lib\D7;$PFilesDir\Borland\jvcl\common;$PFilesDir\Borland\jvcl\Resources;$sDir\_OUTROS_\Componentes7\RxLibD7;$sDir\_OUTROS_\Componentes7\PngComponents\Source\obj;$sDir\_OUTROS_\Componentes7\PngComponents\Source\;$sDir\_OUTROS_\Componentes7\VclSkin_D7\Skin;",
	
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
$arrFinanceiro = "Ativo.dpr","Atualizacao.dpr","ControleBancario.dpr","Contabilidade.dpr","CPagar.dpr","CReceber.dpr","Controle.dpr","CTR_GravaArqINI.dpr","Escrituracao.dpr","PortalDeAcessoAo_OUTROS_.dpr","Estatistica.dpr","GCC.dpr","ServicoEmail.dpr"
$arrFinanceiroReduzido = "Ativo.dpr","ControleBancario.dpr","Contabilidade.dpr","CPagar.dpr","CReceber.dpr","Escrituracao.dpr","GCC.dpr"
$arrOficinas = "Abastecimento.dpr","Componente.dpr","Compras.dpr","Estoque.dpr","Frota.dpr","Manutencao.dpr","Motor.dpr","Pneus.dpr","Tratamento.dpr","_OUTROS_Report.dpr"
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
        return "$aDir\_OUTROS_\Sistemas"
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
$DataHora = "Edit1.Text := '$now';" | Out-File -NoNewline -Encoding "Ascii" "$sDir\_OUTROS_\Sistemas\DataHora.txt"

$branchAmbInterno = $zbranch.Replace($strOrigin, '')

Write-Host "$now - Criando NomeBuildInterno.txt"
$NomeBuildInterno = " If (vcUsuarioManagerComSenhaUm) Then
                         frmMenuPrincipal.Caption := frmMenuPrincipal.Caption + ' - Branch: $branchAmbInterno / Build: $zbuildID'; "  | Out-File -NoNewline -Encoding "Ascii" "$sDir\_OUTROS_\Sistemas\NomeBuildInterno.txt"

$now=Get-Date -format "dd/MM/yyyy HH:mm:ss"

Write-Host "$now - Iniciando projetos"

$rDir = ObterDiretorioDestino

Write-Host "$now - ReleaseDir: $rDir"

$i = BuildProjeto -ProjectName Abastecimento.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Abastecimento" -ReleaseDir "$rDir\Abastecimento"
$i = BuildProjeto -ProjectName Acidentes.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Acidentes" -ReleaseDir "$rDir\Acidentes"
$i = BuildProjeto -ProjectName AgendaImpAutomatica.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Arrecadacao" -ReleaseDir "$rDir\Arrecadacao"
$i = BuildProjeto -ProjectName AppService_SaidaRecolAuto.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Plantao\AppService_SaidaRecolAuto" -ReleaseDir "$rDir\Plantao\AppService_SaidaRecolAuto"
$i = BuildProjeto -ProjectName Arrecadacao.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Arrecadacao" -ReleaseDir "$rDir\Arrecadacao"
$i = BuildProjeto -ProjectName Ativo.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Ativo" -ReleaseDir "$rDir\Ativo"
$i = BuildProjeto -ProjectName Atualizacao.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Atualizacao" -ReleaseDir "$rDir\Atualizacao"
$i = BuildProjeto -ProjectName ServicoEmail.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\ServicoEmail" -ReleaseDir "$rDir\ServicoEmail"
$i = BuildProjeto -ProjectName BaixaAutomaticaReservasComBoletos.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Venda Bilhetes" -ReleaseDir "$rDir\Venda Bilhetes"
$i = BuildProjeto -ProjectName BilhetagemEletronica.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Arrecadacao\BilhetagemMetra" -ReleaseDir "$rDir\Arrecadacao\BilhetagemMETRA"
$i = BuildProjeto -ProjectName BIO.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\BIO" -ReleaseDir "$rDir\BIO"
$i = BuildProjeto -ProjectName Cargas.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cargas" -ReleaseDir "$rDir\Cargas"
$i = BuildProjeto -ProjectName CargasAutomatizacao.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cargas\Automatizacao" -ReleaseDir "$rDir\Cargas\Automatizacao"
$i = BuildProjeto -ProjectName CargasWeb.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cargas_WEB\CGI-BIN" -ReleaseDir "$rDir\Cargas_WEB\CGI-BIN"
$i = BuildProjeto -ProjectName CNC.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Conciliacao" -ReleaseDir "$rDir\Conciliacao"
$i = BuildProjeto -ProjectName Coeficientes.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Coeficientes" -ReleaseDir "$rDir\Coeficientes"
$i = BuildProjeto -ProjectName Componente.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Componente" -ReleaseDir "$rDir\Componente"
$i = BuildProjeto -ProjectName Compras.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Compras" -ReleaseDir "$rDir\Compras"
$i = BuildProjeto -ProjectName Contabilidade.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Contabilidade" -ReleaseDir "$rDir\Contabilidade"
$i = BuildProjeto -ProjectName ControlaProgLeitora.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Venda Bilhetes" -ReleaseDir "$rDir\Venda Bilhetes"
$i = BuildProjeto -ProjectName Controle.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Controle" -ReleaseDir "$rDir\Controle"
$i = BuildProjeto -ProjectName ControleBancario.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Bancos" -ReleaseDir "$rDir\Bancos"
$i = BuildProjeto -ProjectName CPagar.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\ContasPagar" -ReleaseDir "$rDir\ContasPagar"
$i = BuildProjeto -ProjectName Cracha.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cracha" -ReleaseDir "$rDir\Cracha"
$i = BuildProjeto -ProjectName Cracha_ColetorClient.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cracha\Residentes" -ReleaseDir "$rDir\Cracha\Residentes"
$i = BuildProjeto -ProjectName Cracha_ColetorServer.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cracha\Residentes" -ReleaseDir "$rDir\Cracha\Residentes"
$i = BuildProjeto -ProjectName Cracha_ParametrosClient.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cracha\Residentes" -ReleaseDir "$rDir\Cracha\Residentes"
$i = BuildProjeto -ProjectName Cracha_ParametrosServer.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Cracha\Residentes" -ReleaseDir "$rDir\Cracha\Residentes"
$i = BuildProjeto -ProjectName CReceber.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\ContasReceber" -ReleaseDir "$rDir\ContasReceber"
$i = BuildProjeto -ProjectName CTR_GravaArqINI.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Controle" -ReleaseDir "$rDir\Controle"
$i = BuildProjeto -ProjectName CVE.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\ConversaoExportacao" -ReleaseDir "$rDir\ConversaoExportacao"
$i = BuildProjeto -ProjectName CVI.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\ConversaoImportacao" -ReleaseDir "$rDir\ConversaoImportacao"
$i = BuildProjeto -ProjectName DVS.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\DVS" -ReleaseDir "$rDir\DVS"
#$i = BuildProjeto -ProjectName EMTU.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\EMTU" -ReleaseDir "$rDir\EMTU"
$i = BuildProjeto -ProjectName Escala.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Escala" -ReleaseDir "$rDir\Escala"
$i = BuildProjeto -ProjectName EscalaRodoviaria.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\EscalaRodoviaria" -ReleaseDir "$rDir\EscalaRodoviaria"
$i = BuildProjeto -ProjectName EscalaRodoviariaAutomatica.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\EscalaRodoviariaAutomatica" -ReleaseDir "$rDir\EscalaRodoviariaAutomatica"
$i = BuildProjeto -ProjectName Csb.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\ConsolidadorBE" -ReleaseDir "$rDir\ConsolidadorBE"
$i = BuildProjeto -ProjectName Escrituracao.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Escrituracao" -ReleaseDir "$rDir\Escrituracao"
$i = BuildProjeto -ProjectName Estatistica.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Estatistica" -ReleaseDir "$rDir\Estatistica"
$i = BuildProjeto -ProjectName Estoque.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Estoque" -ReleaseDir "$rDir\Estoque"
$i = BuildProjeto -ProjectName Folha.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Folha" -ReleaseDir "$rDir\Folha"
$i = BuildProjeto -ProjectName Frequencia.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Frequencia" -ReleaseDir "$rDir\Frequencia"
$i = BuildProjeto -ProjectName Frequencia_RelogioAutomatico.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Frequencia\Residentes" -ReleaseDir "$rDir\Frequencia\Residentes"
$i = BuildProjeto -ProjectName Fretamento.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Fretamento" -ReleaseDir "$rDir\Fretamento"
$i = BuildProjeto -ProjectName Frota.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Frota" -ReleaseDir "$rDir\Frota"
$i = BuildProjeto -ProjectName GCC.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\GCC" -ReleaseDir "$rDir\GCC"
$i = BuildProjeto -ProjectName GGRisco.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\GGRisco" -ReleaseDir "$rDir\GGRisco"
$i = BuildProjeto -ProjectName _OUTROS_Report.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\_OUTROS_Report" -ReleaseDir "$rDir\_OUTROS_Report"
$i = BuildProjeto -ProjectName ImpMaquina.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Retaguarda\RETImportacaoMaquina" -ReleaseDir "$rDir\Retaguarda"
$i = BuildProjeto -ProjectName ImportacaoFilipeta.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Arrecadacao\ImportacaoFILIPETA" -ReleaseDir "$rDir\Arrecadacao"
$i = BuildProjeto -ProjectName VerificaConexao.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Arrecadacao\ImportacaoFILIPETA\VerificaConexao" -ReleaseDir "$rDir\Arrecadacao"
$i = BuildProjeto -ProjectName InfGeoPosicionamento.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\InfGeoPosicionamento" -ReleaseDir "$rDir\InfGeoPosicionamento"
$i = BuildProjeto -ProjectName LeitoraDeBilhetes.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Venda Bilhetes" -ReleaseDir "$rDir\Venda Bilhetes"
$i = BuildProjeto -ProjectName Manutencao.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Manutencao" -ReleaseDir "$rDir\Manutencao"
$i = BuildProjeto -ProjectName Motor.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Motor" -ReleaseDir "$rDir\Motor"
$i = BuildProjeto -ProjectName Passes.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Passes" -ReleaseDir "$rDir\Passes"
$i = BuildProjeto -ProjectName Plantao.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Plantao" -ReleaseDir "$rDir\Plantao"
$i = BuildProjeto -ProjectName Pneus.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Pneus" -ReleaseDir "$rDir\Pneus"
$i = BuildProjeto -ProjectName PortalDeAcessoAo_OUTROS_.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\MENU" -ReleaseDir "$rDir\Menu"
$i = BuildProjeto -ProjectName PRJ_PRODATA.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Arrecadacao\PRJ_PRODATA" -ReleaseDir "$rDir\Arrecadacao\PRJ_PRODATA"
$i = BuildProjeto -ProjectName PVT.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\PVT" -ReleaseDir "$rDir\PVT"
$i = BuildProjeto -ProjectName RecursosHumanos.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\RecursosHumanos" -ReleaseDir "$rDir\RecursosHumanos"
$i = BuildProjeto -ProjectName Retaguarda.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Retaguarda" -ReleaseDir "$rDir\Retaguarda"
$i = BuildProjeto -ProjectName SAF.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Sistema Anti-Fraude"  -ReleaseDir "$rDir\Sistema Anti-Fraude"
$i = BuildProjeto -ProjectName Terceiros.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Terceiros" -ReleaseDir "$rDir\Terceiros"
$i = BuildProjeto -ProjectName Terminal.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Terminal" -ReleaseDir "$rDir\Terminal"
$i = BuildProjeto -ProjectName Trafego.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Trafego" -ReleaseDir "$rDir\Trafego"
$i = BuildProjeto -ProjectName Tratamento.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\TratamentoTermico" -ReleaseDir "$rDir\TratamentoTermico"
$i = BuildProjeto -ProjectName TRR.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\TRR" -ReleaseDir "$rDir\TRR"
$i = BuildProjeto -ProjectName Turismo.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Turismo" -ReleaseDir "$rDir\Turismo"
$i = BuildProjeto -ProjectName VendaBilhetes.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\Venda Bilhetes" -ReleaseDir "$rDir\Venda Bilhetes"
$i = BuildProjeto -ProjectName BEV.dpr -ProjectDir "$sDir\_OUTROS_\Sistemas\BEV" -ReleaseDir "$rDir\BEV"


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
