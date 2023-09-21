/*

param location string
param AdminSecretName string

param KeyvaultName string

@secure()
param Adminpassword string

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  location: location
  name: KeyvaultName
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: tenant().tenantId
  }
  resource secretName 'secrets@2023-02-01' = {
    name: 'sshkey'
    properties: {
    value: Adminpassword
   }
  }
}

*/


