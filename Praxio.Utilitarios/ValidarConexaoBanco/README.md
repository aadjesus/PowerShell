# Script PowerShell que Valida a Conexão com Banco de Dados

Este script PowerShell foi desenvolvido para verificar a se é possível estabelecer uma conexão com um banco de dados Oracle conforme a string de conexão fornecida como parâmetro. 

Ele utiliza a biblioteca `Oracle.ManagedDataAccess.dll` para gerenciar a conexão e executa uma consulta simples (`SELECT * FROM DUAL`) para validar a comunicação com o banco de dados.

## Como Usar
- Execute o script no PowerShell, passando a string de conexão como parâmetro.

```powershell
.\ValidarConexaoBanco.ps1 "Data Source=<IP>:<PORTA>/<SERVICE_NAME>;Persist Security Info=True;User ID=<USUARIO>;Password=<SENHA>"
```
