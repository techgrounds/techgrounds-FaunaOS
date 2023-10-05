/*
@secure()
param secretValue string

param keyVaultName string


resource keyVaults 'Microsoft.KeyVault/vaults@2021-04-01-preview' existing = {
  name: keyVaultName
}


resource secrets 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  name: 'sec-${keyVaultName}'
  parent: keyVaults
  properties: {
    contentType: 'ssh-public-key'
    value: secretValue
      attributes: {
        enabled: true
      }}}


  resource sshKeySecret 'Microsoft.KeyVault/vaults/secrets@2021-04-01-preview' = {
  name: 'mySshKeySecret' // Replace with your desired name
  parent: keyVaults
  properties: {
    contentType: 'application/octet-stream'
    value: base64(concat('-----BEGIN OPENSSH PRIVATE KEY-----\n', fileToString('mykey'), '\n-----END OPENSSH PRIVATE KEY-----\n'))
  }
}
*/
