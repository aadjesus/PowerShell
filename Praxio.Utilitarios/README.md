#Descrição do Repositório:

Este repositório contém a branch master, que serve como base para o desenvolvimento. 

Ao clonar o repositório, crie uma nova branch com um nome descritivo que reflita o utilitário ou recurso que será adicionado.

#Exemplo:

Se você for incluir o arquivo `Oracle.ManagedDataAccess.dll` para testar a conexão com o banco de dados, crie uma branch com o nome TestarConexaoBanco. 

Isso ajudará a manter o controle das alterações e a identificar facilmente o propósito de cada branch.

#Instruções:

1. Clone o repositório:

```
git clone https://praxio@dev.azure.com/praxio/Fusea/_git/Praxio.Utilitarios
```

2. Crie uma nova branch com um nome descritivo:
```
git checkout -b TestarConexaoBanco
```
3. Adicione o arquivo `Oracle.ManagedDataAccess.dll` na pasta.

4. Commit e push das alterações:
```
git add .
git commit -m "Adicionada DLL e testes de conexão com o banco de dados"
git push origin TestarConexaoBanco
```    	

#Importante:

Sempre crie branches descritivas para facilitar a identificação e o gerenciamento das funcionalidades desenvolvidas.

Atualise o README.md da branch criada com as instruções necessárias para a utilização do utilitário adicionado.