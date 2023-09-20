targetScope = 'subscription'

// --------------------------------------------------
// Global Parameter Declaration
// --------------------------------------------------

@description('Environment for frontend deployment') // Updated description
param env string // Updated parameter name

@description('Azure region for frontend deployment') // Updated description
param location string // Updated parameter name

@description('Current Date for deployment records. Do not overwrite!')
param currentDate string = utcNow('yyyy-MM-dd')

@description('NewGuid creates a unique string with every deployment then substring takes the first 4 characters')
param UniqueId string = newGuid()
param UniqueValue string = substring(UniqueId, 0, 4)

@description('Application product these resources are assigned to')
param product string

@description('Dictionary of deployment regions and their short names')
param locationList object

@description('Current Tenant Id & Object Id to be used in deployment')
param tenantId string
param objectId string

// ---
// Frontend deployment parameters
// --- Component

@description('Application components these resources are part of.')
param frontendComponent string

// --- Networking

@description('A list of required and optional subnet properties for frontend') // Updated description
param frontendSubnets array // Updated parameter name

@description('Virtual Network Address Range for frontend') // Updated description
param frontendAddressPrefixes array // Updated parameter name

@description('Custom DNS servers for Virtual Network in frontend') // Updated description
param frontendDnsServers array // Updated parameter name

@description('Defines what subnet will have a NSG attached to them') // Updated description
param frontendAllowedSubNsg string // Updated parameter name


// ----------------
// Backend deployment parameters
// ---- Component

@description('Application components these resources are part of.')
param backendComponent string

// --- Networking

@description('A list of required and optional subnet properties for frontend') // Updated description
param backendSubnets array // Updated parameter name

@description('Virtual Network Address Range for frontend') // Updated description
param backendAddressPrefixes array // Updated parameter name

@description('Custom DNS servers for Virtual Network in frontend') // Updated description
param backendDnsServers array // Updated parameter name

@description('Defines what subnet will have a NSG attached to them') // Updated description
param backendAllowedSubNsg string // Updated parameter name

// ----------------
// shared deployment parameters
// ---- Component

@description('Application components these resources are part of.')
param sharedComponent string

@description('Properties for key vault deployment')
param keyVaultProperties object

// ----------------
// Global Variable declaration
// ----------------

var locationShortName = locationList[location]

var tagValues = {
  createdBy: 'AZ CLI'
  environment: env // Updated variable name
  deploymentDate: currentDate
  product: product
}


// -------------------------
// Frontend Variable declaration
// --- 


var frontendResourceGroupName = 'rg-${frontendEnvironmentName}' // Updated variable name
var frontendEnvironmentName = '${frontendGroupName}-${env}-${locationShortName}' // Updated variable name
var frontendGroupName = '${product}-${frontendComponent}' // Updated variable name

// -------------------------
// Backend Variable declaration
// --- 

var backendResourceGroupName = 'rg-${backendEnvironmentName}' // Updated variable name
var backendEnvironmentName = '${backendGroupName}-${env}-${locationShortName}' // Updated variable name
var backendGroupName = '${product}-${backendComponent}' // Updated variable name

// -------------------------
// Shared Variable declaration
// --- 

var sharedResourceGroupName = 'rg-${sharedEnvironmentName}' // Updated variable name
var sharedEnvironmentName = '${sharedGroupName}-${env}-${locationShortName}' // Updated variable name
var sharedGroupName = '${product}-${sharedComponent}' // Updated variable name
var keyVaultName = 'kv-${product}${sharedComponent}${env}${locationShortName}${UniqueValue}I'
// ...
// ------------------------------------------------
// Frontend Resource declaration
// ------------------------------------------------

resource frontendResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: frontendResourceGroupName // Updated variable name
  location: location // Updated variable name
  tags: tagValues // Updated variable name
}

module frontendVirtualNetwork '00_Frontend/frontend-network.bicep' = {
  scope: frontendResourceGroup
  name: 'vnet-${product}-${frontendComponent}-${env}-${locationShortName}-dp' // Updated module name
  params: {
    frontendAddressPrefixes: frontendAddressPrefixes // Updated parameter name
    env: env // Updated parameter name
    location: location // Updated parameter name
    tagValues: tagValues // Updated parameter name
    locationShortName: locationShortName // Updated parameter name
    frontendDnsServers: frontendDnsServers // Updated parameter name
    frontendGroupName: frontendGroupName // Updated variable name
    frontendSubnets: frontendSubnets // Updated parameter name
    frontendAllowedSubNsg: frontendAllowedSubNsg // Updated parameter name
  }
}

// ...

resource backendResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: backendResourceGroupName // Updated variable name
  location: location // Updated variable name
  tags: tagValues // Updated variable name
}


module backendVirtualNetwork '01_Backend/backend-network.bicep' = {
  scope: backendResourceGroup
  name: 'vnet-${product}-${backendComponent}-${env}-${locationShortName}-dp' // Updated module name
  params: {
    backendAddressPrefixes: backendAddressPrefixes // Updated parameter name
    env: env // Updated parameter name
    location: location // Updated parameter name
    tagValues: tagValues // Updated parameter name
    locationShortName: locationShortName // Updated parameter name
    backendDnsServers: backendDnsServers // Updated parameter name
    backendGroupName: backendGroupName // Updated variable name
    backendSubnets: backendSubnets // Updated parameter name
    backendAllowedSubNsg: backendAllowedSubNsg // Updated parameter name
    backendComponent: backendComponent
  }
}

resource sharedResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: sharedResourceGroupName // Updated variable name
  location: location // Updated variable name
  tags: tagValues // Updated variable name
}


module keyVault '02_Shared/keyVault.bicep' = {
  name: 'kv${sharedEnvironmentName}-dp'
  scope: resourceGroup(sharedResourceGroupName)
  dependsOn: [sharedResourceGroup]  
  params: {
    keyVault: keyVaultProperties
    location: location 
    /*
    locationShortName: locationShortName
    env: env 
    virtualNetworkId: backendVirtualNetwork.outputs.backendVirtualNetworkId
    */
    keyVaultName: keyVaultName
    tenantId: tenantId

    tagValues: tagValues
    objectId: objectId
    backendSubnetId: backendVirtualNetwork.outputs.backendSubnetId
  }
  
}

output tenantId string = tenantId
output objectId string = objectId
output UniqueValue string = UniqueValue
