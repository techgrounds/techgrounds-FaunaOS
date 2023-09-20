param sharedKeyvaultName string
param AdminSecretName string
@secure()
param Adminpassword string


resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: sharedKeyvaultName
  resource secretName 'secrets' = {
    name: AdminSecretName
    properties: {
    value: Adminpassword
   }
  }
}

output keyVaultId string = keyVault.id
output keyVaultSecretValue string = keyVault.properties.vaultUri



