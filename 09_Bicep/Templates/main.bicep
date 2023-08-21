param location string = 'westeurope'

module main 'main.bicep' = {
  name: 'main'
  params: {
    location: westeurope
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'faunabiceplaunchstorage'
  location: 'westeurope'
sku: {
  name: 'Standard_LRS'
}
kind: 'StorageV2'
properties: {
  accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: 'faunabicepappstarterplan'
  location: 'westeurope'
  sku: {
    name: 'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-09-01' = {
  name: 'faunabicepapplaunch'
  location: 'westeurope'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
