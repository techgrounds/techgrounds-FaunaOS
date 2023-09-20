param env string
param location string
param product string
param component string

var locationShortName = substring(location, 0, 4)
var storageAccountName = 'st${product}${component}${env}${locationShortName}sa'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
  } 
    }

output storageAccountId string = storageAccount.id

// ------

