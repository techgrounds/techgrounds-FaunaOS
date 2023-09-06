targetScope = 'subscription'

// -----------------------------------------------
// Parameter declaration
@description('Application components these resources are part of.')
param component string

@description('Enviroment for deployment')
param env string

@description('Current Date for deployment records. Do not overwrite!')
param currentDate string = utcNow('yyyy-MM-dd')

@description('Application product these resource are assigned too')
param product string

@description('Azure region for deployment')
param location string = 'westeurope'

@description('A list of required and optional subnet propeties')
param subnets array

@description('Virtual Network Address Range')
param addressPrefixes array

@description('Dictionary of deployment regions and the shortname')
param locationList object

@description('Custom DNS servers for Virtual Network')
param dnsServers array


// ----------------------------------------------
// Variable declaration
var groupName = '${product}-${component}'
var enviromentName = '${groupName}-${env}-${locationShortName}'
var resourceGroupName = 'rg-${enviromentName}'
var locationShortName = locationList[location]
var tagValues = {
  createdBy: 'AZ CLI'
  enviroment: env
  deploymentDate: currentDate
  product: product
}

// ----------------------------------------------
// Resource declaration

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
  tags: tagValues
}


module VNET 'modules/virtualNetwork.bicep' = {
  scope: resourceGroup
  name: 'vnet-${product}${component}-${env}-${locationShortName}'
  params: {
    addressPrefixes: addressPrefixes
    env: env
    location: location
    tagValues: tagValues
    locationShortName: locationShortName
    dnsServers: dnsServers
    groupName: groupName
    subnets: subnets
  }
}
