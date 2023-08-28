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
param action string = 'create'

var storageAccountSkuName = (environmentType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'
var appServicePlanSkuName = (environmentType == 'prod') ? 'P2V3' : 'F1'


resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = if (action == 'create') {
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

resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = if (action == 'create') {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSkuName
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-09-01' = if (action == 'create') {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

module appService 'modules/appService.bicep' = if (action == 'create') {
  name: 'appService'
  params: {
    location: location
    appServiceAppName: appServiceAppName
    environmentType: environmentType
  }
} 

module deleteModule 'modules/deleteModule.bicep' =  if (action == 'delete') {
  name: 'deleteResourcesModule' 
  params: {

  }
}


output appServiceAppHostName string = appService.outputs.appServiceAppHostName
