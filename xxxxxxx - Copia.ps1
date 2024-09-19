clear
$arqivoRecriarBanco  = Get-ChildItem "d:\Meus documentos\Downloads\" -Filter RECRIARBANCO.TXT
if ($arqivoRecriarBanco -eq $null) {
    return
}

$arqAppsettingsOrigem = "c:\azagent\A1\AppSettings\Escala.json";

$arquivoJsonOrigem = Get-Content $arqAppsettingsOrigem | Out-String | ConvertFrom-Json  
$defaultConnection = $arquivoJsonOrigem.ConnectionStrings.DefaultConnection
$schemaGlobus = $arquivoJsonOrigem.Parametros.Schemas | where { $_.Chave -eq "Globus" }
$defaultConnection -cmatch "User ID\=(?<UserID>.*);"

$defaultConnection = $defaultConnection -replace $matches.UserID, "ESC27"


Add-Type -Path d:\TMP\Oracle.ManagedDataAccess.dll
$connection = New-Object System.Data.OleDb.OleDbConnection("Provider=OraOLEDB.Oracle.1;" + $defaultConnection);
$connection.open();

if ($connection.State -ne 'Open'){
    return
}

$command = $connection.CreateCommand();
#$command.CommandText = "Select username From dba_Users Where username = upper('"+ $matches.UserID +"')"
#$reader = $command.ExecuteReader();
#if ($reader.HasRows)
#{
#    Write-Host "Excluindo objetos"
#    
#} else 
#{
#    $reader.Close();
    Write-Host "Criando usuário"    
    
    $scriptBanco = ScriptBanco;
           
    $command.CommandType = [System.Data.CommandType]::StoredProcedure;                
    $command.CommandText = [String]::Format($scriptBanco, $matches.UserID);

    Write-Host $command.CommandText

    $command.ExecuteNonQuery();
    
#}

#$connection.Close()

function ScriptBanco()
{
    $retorno = 
        "Declare"+
        "    v_username Varchar2(100);"+
        "    v_cascade  Varchar2(100);"+
        "Begin"+
        "    Begin"+
        "        Select Max(1)"+
        "          Into v_username"+
        "          From Dba_Users"+
        "         Where username = '{0}';"+
        
        "        If v_username = 1 Then"+
        "            Begin"+
        "                For item In (Select *"+
        "                               From all_Objects"+
        "                              Where GENERATED = 'N' "+
        "                                    And owner = '{0}'"+
        "                                    And Not object_type In ('JOB', 'INDEX') "+
        "                              Order By Timestamp Asc)"+
        "                Loop"+
        "                    Begin"+
        "                        v_cascade := '';"+
        "                        If item.object_type = 'TABLE' Then"+
        "                            v_cascade := ' CASCADE CONSTRAINTS';"+
        "                        End If;"+
        "                        Execute Immediate 'DROP  ' || item.object_type || ' ' ||"+
        "                                          item.owner || '.' ||"+
        "                                          item.object_name || v_cascade;"+
        "                    Exception"+
        "                        When Others Then"+
        "                            dbms_output.put_line(item.object_name || ': ' || Sqlerrm);"+
        "                    End;"+
        "                End Loop;"+
        "            End;"+
        "        Else"+
        "            Begin "+
        "                EXECUTE IMMEDIATE 'Create User {0} IDENTIFIED By {0} Default TABLESPACE GLOBUS_TABLE';"+
        "                EXECUTE IMMEDIATE 'GRANT DBA To {0}';"+
        "                EXECUTE IMMEDIATE 'GRANT Connect To {0}';"+
        "                EXECUTE IMMEDIATE 'grant Connect To {0}';"+
        "                EXECUTE IMMEDIATE 'grant dba To {0}';"+
        "                EXECUTE IMMEDIATE 'grant imp_full_database To {0}';"+
        "                EXECUTE IMMEDIATE 'grant Resource To {0}';"+
        "                EXECUTE IMMEDIATE 'grant select_catalog_role To {0}';"+
        "                EXECUTE IMMEDIATE 'grant Create public synonym To {0}';"+
        "                EXECUTE IMMEDIATE 'grant debug Any Procedure To {0}';"+
        "                EXECUTE IMMEDIATE 'grant debug Connect session To {0}';"+
        "                EXECUTE IMMEDIATE 'GRANT Select Any Table To {0}';"+
        "                EXECUTE IMMEDIATE 'grant Insert Any Table To {0}';"+
        "                EXECUTE IMMEDIATE 'grant Update Any Table To {0}';"+
        "                EXECUTE IMMEDIATE 'grant Delete Any Table To {0}';"+
        "                EXECUTE IMMEDIATE 'GRANT Select Any sequence To {0}';"+
        "                EXECUTE IMMEDIATE 'grant Execute Any Procedure To {0}';"+
        "                EXECUTE IMMEDIATE 'grant unlimited tablespace To {0}';"+
        "            End;"+
        "        End If;"+
        "    Exception  "+
        "        When Others Then  "+
        "            dbms_output.put_line(Sqlerrm);"+
        "    End;"+
        "End;";

    return $retorno
}