# Script PowerShell de Verificação e Atualização de Versão

Este script PowerShell foi desenvolvido para verificar a versão de um artefato informado no arquivo `versoes.json` e determinar se será possível atualizar ou instalar a aplicação. Ele é especialmente útil em pipelines de CI/CD para gerenciar versões de artefatos de forma automatizada.

## Funcionalidades

1. **Identificação do Artefato e Versão:**
   - O script recebe como argumento o nome do artefato `<NOME>` e verifica as variáveis de ambiente relacionadas ao pipeline (como `RELEASE_ARTIFACTS_<NOME>_DEFINITIONNAME` e `RELEASE_ARTIFACTS_<NOME>_BUILDNUMBER`) para identificar o nome e a versão do artefato.
   - Caso as variáveis específicas não estejam disponíveis, ele utiliza as variáveis padrão do pipeline (`BUILD_DEFINITIONNAME` e `BUILD_BUILDNUMBER`).

2. **Manipulação do Arquivo `versoes.json`:**
   - O arquivo `versoes.json`, localizado no diretório `$Env:AGENT_ROOTDIRECTORY`, armazena as versões instaladas dos artefatos.
   - Se o arquivo não existir, ele será criado automaticamente.

3. **Verificação da Versão Atual:**
   - O script lê o arquivo `versoes.json` para verificar se o artefato já possui uma versão registrada.
   - Com base na comparação entre a versão atual e a versão do artefato fornecida:
     - **Versão já instalada:** Se a versão atual for igual à versão do artefato, o script define a variável de pipeline `ATUALIZAR` como `"Nao"`.
     - **Instalação inicial:** Se o artefato não estiver registrado no arquivo, ele será adicionado com a versão fornecida.
     - **Atualização necessária:** Se a versão atual for diferente da versão do artefato, o script atualiza o registro no arquivo.

4. **Saída de Logs:**
   - O script gera logs detalhados no formato de avisos (`##[warning]`) para facilitar o acompanhamento durante a execução do pipeline.

## Estrutura do Arquivo `versoes.json`

O arquivo `versoes.json` segue o formato abaixo:

```json
{
    "Praxio.Modulo.API": "1.0.0",
    "Praxio.Modulo.UI": "2.1.3"
}