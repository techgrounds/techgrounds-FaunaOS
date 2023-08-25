@description('Specifies the location for resources.')
param location string = 'westeurope'
param storageAccountName string = 'fauna${uniqueString(resourceGroup().id)}'
param appServiceAppName string = 'fauna${uniqueString(resourceGroup().id)}'
param appServicePlanName string =  'fauna${uniqueString(resourceGroup().id)}'

@allowed([
  'nonprod'
  'prod'
])
param environmentType string

var storageAccountSkuName = (environmentType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'
var appServicePlanSkuName = (environmentType == 'prod') ? 'P2V3' : 'F1'


resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
sku: {
  name: storageAccountSkuName
}
kind: 'StorageV2'
properties: {
  accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSkuName
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-09-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

output appServiceAppName string = appServiceAppName
