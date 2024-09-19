#echo "##vso[task.setvariable variable=foo;]bar"
clear
Write-Host "Procurando arquivos" 
$arqivoRecriarBanco  = Get-ChildItem c:\azagent\A1\AppSettings -Filter RECRIARBANCO.TXT
$appSettings         = Get-ChildItem c:\azagent\A1\AppSettings -Filter Gps.json

if ($arqivoRecriarBanco -eq $null -or
    $appSettings -eq $null) {
    Write-Host "Arquivo(s) RECRIARBANCO.TXT ou AppSettings.json não encontrado(s)." 
    return
}


Try {	
    	
    $appSettingsJson = Get-Content $appSettings.PSPath  | Out-String | ConvertFrom-Json  
    $defaultConnection = $appSettingsJson.ConnectionStrings.DefaultConnection
    $schemaGlobus = $appSettingsJson.Parametros.Schemas | where { $_.Chave -eq "Globus" }
    $defaultConnection -cmatch "User ID\=(?<UserID>.*);"    
    $defaultConnection = $defaultConnection -replace $matches.UserID, "ESC27"

    Write-Host "Criando ou excluindo objetos do schema:"$matches.UserID"com usuário 'ESC27'."

    Add-Type -Path d:\TMP\Oracle.ManagedDataAccess.dll
    $connection = New-Object System.Data.OleDb.OleDbConnection("Provider=OraOLEDB.Oracle.1;" + $defaultConnection);
    $connection.open();    
    if ($connection.State -ne 'Open') {
        return
    }    
    
    $command = $connection.CreateCommand();
    $command.CommandText = [String]::Format(
        "    Select object_type, object_name"+ 
        "      From All_Users a" +
        " LEFT JOIN all_Objects b ON a.username = b.owner AND Not object_type In ('JOB', 'INDEX')" +
        "     WHERE a.username = '{0}' Order By Timestamp Asc", $matches.UserID.ToUpper()) 
    $reader=$command.ExecuteReader()
   
    if ($reader.HasRows) {
        while ($reader.Read() -and $reader[0].ToString() -ne '') {
            $complemento = "";
            If ($reader[0].ToString() -eq 'TABLE') {
                $complemento = ' CASCADE CONSTRAINTS';
            }  
            elseIf ($reader[0].ToString() -eq 'TYPE') {
                $complemento = ' force';
            } 

            $command = $connection.CreateCommand();
            $command.CommandText = [String]::Format("DROP {0} {1}.{2} {3} ",$reader[0], $matches.UserID.ToUpper(), $reader[1], $complemento)                         
            Write-Host "Executando: " $command.CommandText
            $command.ExecuteNonQuery();
        }
    }
    else {
        $comandos = (
            'Create User {0} IDENTIFIED By {0} Default TABLESPACE GLOBUS_TABLE',
            'GRANT DBA To {0}',
            'GRANT Connect To {0}',
            'grant Connect To {0}',
            'grant dba To {0}',
            'grant imp_full_database To {0}',
            'grant Resource To {0}',
            'grant select_catalog_role To {0}',
            'grant Create public synonym To {0}',
            'grant debug Any Procedure To {0}',
            'grant debug Connect session To {0}',
            'GRANT Select Any Table To {0}',
            'grant Insert Any Table To {0}',
            'grant Update Any Table To {0}',
            'grant Delete Any Table To {0}',
            'GRANT Select Any sequence To {0}',
            'grant Execute Any Procedure To {0}',
            'grant unlimited tablespace To {0}');
        foreach($comando in $comandos) {        
            $command = $connection.CreateCommand();
            $command.CommandText = [String]::Format($comando ,$matches.UserID.ToUpper());
            Write-Host "Executando: " $command.CommandText
            $command.ExecuteNonQuery();
        }
    }

    #$connection.Close()
}
catch  [Exception] {  
   write-host $_.Exception.Message; 
}