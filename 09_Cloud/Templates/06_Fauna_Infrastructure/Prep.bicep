targetScope = 'subscription'

param product string
param env string
param kvNumber string
param location string
param locationList object

@description('Current Date for deployment records. Do not overwrite!')
param currentDate string = utcNow('yyyy-MM-dd')

@description('Current Tenant Id & Object Id to be used in deployment')
param objectId string

@description('Properties for key vault deployment')
param keyVaultProperties object

var keyVaultName = 'kv-${sharedComponent}${env}${locationShortName}${kvNumber}'

var sshKeyName = 'ssh-${sharedComponent}${env}${locationShortName}kv-${kvNumber}' // Updated variable name

var sharedResourceGroupName = 'rg-${sharedEnvironmentName}' // Updated variable name
var sharedEnvironmentName = '${sharedGroupName}-${env}-${locationShortName}' // Updated variable name
var sharedGroupName = '${product}-${sharedComponent}' // Updated variable name

var locationShortName = locationList[location]

var tagValues = {
  createdBy: 'AZ CLI'
  environment: env // Updated variable name
  deploymentDate: currentDate
  product: product
}


@description('Application components these resources are part of.')
param sharedComponent string


resource sharedResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: sharedResourceGroupName 
  location: location 
  tags: tagValues 
}

param fronetendSubnetId string

module keyvault '02_Shared/keyVault.bicep' = {
  scope: sharedResourceGroup
  name: keyVaultName
  params: {
    allowedSubnets: []
    frontendSubnetId: fronetendSubnetId
    objectId: objectId
    keyVaultName: keyVaultName
    sshKeyName: sshKeyName
    location: location
    keyVault: keyVaultProperties
    tagValues: tagValues
  }
}
