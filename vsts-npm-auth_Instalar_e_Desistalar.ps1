#Conectar seu projeto npm ao Azure Artifacts
#https://learn.microsoft.com/pt-br/azure/devops/artifacts/npm/npmrc?view=azure-devops&tabs=windows

#desinstalar
npm uninstall -g vsts-npm-auth
#npm cache clean --force


#instalar
#npm install -g vsts-npm-auth --registry https://registry.npmjs.com --always-auth false
#Executar
#vsts-npm-auth -config .npmrc