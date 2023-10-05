// --- Parameters ----------------
param storageAccountSku string
param keyVaultSku string
param components array

// --- Variables ----------------
var storageAccountName = 'stg${components[0]}${environmentName}'
var keyVaultName = 'kv${components[0]}${environmentName}'

// --- Storage Account ----------------
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSku
  }
  // ... other configurations
}

// --- Key Vault ----------------
resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: keyVaultSku
    }
  }
  // ... other configurations
}
