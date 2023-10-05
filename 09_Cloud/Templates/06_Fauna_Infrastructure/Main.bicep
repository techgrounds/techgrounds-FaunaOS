// ██████████   ██████████ ███████████  █████          ███████    █████ █████ ██████   ██████ ██████████ ██████   █████ ███████████
// ░░███░░░░███ ░░███░░░░░█░░███░░░░░███░░███         ███░░░░░███ ░░███ ░░███ ░░██████ ██████ ░░███░░░░░█░░██████ ░░███ ░█░░░███░░░█
//  ░███   ░░███ ░███  █ ░  ░███    ░███ ░███        ███     ░░███ ░░███ ███   ░███░█████░███  ░███  █ ░  ░███░███ ░███ ░   ░███  ░ 
//  ░███    ░███ ░██████    ░██████████  ░███       ░███      ░███  ░░█████    ░███░░███ ░███  ░██████    ░███░░███░███     ░███    
//  ░███    ░███ ░███░░█    ░███░░░░░░   ░███       ░███      ░███   ░░███     ░███ ░░░  ░███  ░███░░█    ░███ ░░██████     ░███    
//  ░███    ███  ░███ ░   █ ░███         ░███      █░░███     ███     ░███     ░███      ░███  ░███ ░   █ ░███  ░░█████     ░███    
//  ██████████   ██████████ █████        ███████████ ░░░███████░      █████    █████     █████ ██████████ █████  ░░█████    █████   
// ░░░░░░░░░░   ░░░░░░░░░░ ░░░░░        ░░░░░░░░░░░    ░░░░░░░       ░░░░░    ░░░░░     ░░░░░ ░░░░░░░░░░ ░░░░░    ░░░░░    ░░░░░    
                                                                                                                                 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                                                            
/*

Info:
-
-
-

*/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//  ██████   █████  ██████   █████  ███    ███ ███████ ████████ ███████ ██████  ███████ 
//  ██   ██ ██   ██ ██   ██ ██   ██ ████  ████ ██         ██    ██      ██   ██ ██      
//  ██████  ███████ ██████  ███████ ██ ████ ██ █████      ██    █████   ██████  ███████ 
//  ██      ██   ██ ██   ██ ██   ██ ██  ██  ██ ██         ██    ██      ██   ██      ██ 
//  ██      ██   ██ ██   ██ ██   ██ ██      ██ ███████    ██    ███████ ██   ██ ███████ 

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

// --- Scope ----------------

targetScope = 'subscription'

// -----------------------------------------------------------------------------------------------------------------------------------
// Global Parameters
// -----------------------------------------------------------------------------------------------------------------------------------

@description('Environment for frontend deployment') // Updated description
param env string // Updated parameter name

@description('Azure region for deployment') // Updated description
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


// -----------------------------------------------------------------------------------------------------------------------------------
// Frontend Parameters
// -----------------------------------------------------------------------------------------------------------------------------------

@description('Application components these resources are part of.')
param frontendComponent string

// --- Networking ----------------

@description('A list of required and optional subnet properties for frontend') // Updated description
param frontendSubnets array // Updated parameter name

@description('Virtual Network Address Range for frontend') // Updated description
param frontendAddressPrefixes array // Updated parameter name

@description('Custom DNS servers for Virtual Network in frontend') // Updated description
param frontendDnsServers array // Updated parameter name

@description('Defines what subnet will have a NSG attached to them') // Updated description
param frontendAllowedSubNsg string // Updated parameter name

// --- Compute ----------------


@secure()
param frontendAdminPassword string

param frontendAdminUsername string
param frontendNicDeleteOption string
param frontendOsDiskDeleteOption string
param frontendOsDiskType string
param frontendPipDeleteOption string
param frontendPublicIpAddressSku string
param frontendPublicIpAddressType string
param frontendVmComputerName string
param frontendVmSize string
param frontendVmZone string

// -----------------------------------------------------------------------------------------------------------------------------------
// Backend deployment parameters
// -----------------------------------------------------------------------------------------------------------------------------------

@description('Application components these resources are part of.')
param backendComponent string

// --- Networking ----------------

@description('A list of required and optional subnet properties for frontend') // Updated description
param backendSubnets array // Updated parameter name

@description('Virtual Network Address Range for frontend') // Updated description
param backendAddressPrefixes array // Updated parameter name

@description('Custom DNS servers for Virtual Network in frontend') // Updated description
param backendDnsServers array // Updated parameter name

@description('Defines what subnet will have a NSG attached to them') // Updated description
param backendAllowedSubNsg string // Updated parameter name

// --- Compute ----------------

// -----------------------------------------------------------------------------------------------------------------------------------
// shared deployment parameters
// -----------------------------------------------------------------------------------------------------------------------------------

param kvNumber string 

var keyVaultName = 'kv-${sharedComponent}${env}${locationShortName}${kvNumber}'

var sshKeyName = 'sshkey'

param sharedComponent string

param sharedProduct string // for kv


var sharedResourceGroupName = 'rg-${sharedEnvironmentName}' // Updated variable name
var sharedEnvironmentName = '${sharedGroupName}-${env}-${locationShortName}' // Updated variable name
var sharedGroupName = '${sharedProduct}-${sharedComponent}' // Updated variable name


// --- Data ----------------

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//  ██    ██  █████  ██████  ██  █████  ██████  ██      ███████ ███████ 
//  ██    ██ ██   ██ ██   ██ ██ ██   ██ ██   ██ ██      ██      ██      
//  ██    ██ ███████ ██████  ██ ███████ ██████  ██      █████   ███████ 
//   ██  ██  ██   ██ ██   ██ ██ ██   ██ ██   ██ ██      ██           ██ 
//    ████   ██   ██ ██   ██ ██ ██   ██ ██████  ███████ ███████ ███████ 

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//  ██████  ███████ ███████  ██████  ██    ██ ██████   ██████ ███████ ███████ 
//  ██   ██ ██      ██      ██    ██ ██    ██ ██   ██ ██      ██      ██      
//  ██████  █████   ███████ ██    ██ ██    ██ ██████  ██      █████   ███████ 
//  ██   ██ ██           ██ ██    ██ ██    ██ ██   ██ ██      ██           ██ 
//  ██   ██ ███████ ███████  ██████   ██████  ██   ██  ██████ ███████ ███████           

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// ------------------------------------------------------------------------------------------------------------------------------
// Frontend Resource declaration
// ------------------------------------------------------------------------------------------------------------------------------

resource frontendResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: frontendResourceGroupName // Updated variable name
  location: location // Updated variable name
  tags: tagValues // Updated variable name
}

// --- Networking ----------------
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

// --- Compute ----------------


module frontendCompute '00_Frontend/frontend-compute.bicep' = {
  name: 'vm-${frontendComponent}-${env}-${locationShortName}-compute' // Updated module name
  dependsOn: [frontendVirtualNetwork]
  scope: frontendResourceGroup
  params: {
    location: location // Updated variable name
    env: env
    frontendAdminPassword: frontendAdminPassword
    frontendAdminUsername: frontendAdminUsername
    frontendComponent: frontendComponent
    frontendNicDeleteOption: frontendNicDeleteOption
    frontendOsDiskDeleteOption: frontendOsDiskDeleteOption
    frontendOsDiskType: frontendOsDiskType
    frontendPipDeleteOption:  frontendPipDeleteOption
    frontendPublicIpAddressSku:  frontendPublicIpAddressSku
    frontendPublicIpAddressType: frontendPublicIpAddressType
    frontendVmComputerName: frontendVmComputerName
    frontendVmSize: frontendVmSize
    frontendVmZone: frontendVmZone
    locationList: locationList
    product: product
    sharedResourceGroupName: sharedResourceGroupName
    sshKeyName: sshKeyName

    }
}
// ...

// ------------------------------------------------------------------------------------------------------------------------------
// Backend Resource declaration
// ------------------------------------------------------------------------------------------------------------------------------

resource backendResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: backendResourceGroupName // Updated variable name
  location: location // Updated variable name
  tags: tagValues // Updated variable name
}

// --- Networking ----------------

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

// --- Compute ----------------

// ------------------------------------------------------------------------------------------------------------------------------
// Shared Resource declaration
// ------------------------------------------------------------------------------------------------------------------------------


// --- Encrypted ----------------

resource sharedRG 'Microsoft.Resources/resourceGroups@2023-07-01' existing = {
  name: sharedResourceGroupName
}


param keyVaultProperties object

module kv '02_Shared/keyVault.bicep' = {
  name: 'kvSubAllowed'
  scope: sharedRG
  params:{
    location: location
    allowedSubnets: []
    frontendSubnetId: frontendVirtualNetwork.outputs.frontendSubnetId
    keyVault: keyVaultProperties
    keyVaultName: keyVaultName
    objectId: objectId
    sshKeyName: sshKeyName
    tagValues: tagValues

      }
    }





/*

@description('Properties for key vault deployment')
param keyVaultProperties object


module keyVault '02_Shared/keyVault.bicep' = {
  name: 'kv-${backendEnvironmentName}-dp' // Updated module name
  scope: frontendResourceGroup
  params: {
    keyVault: keyVaultProperties
    location: location
    tagValues: tagValues
    objectId: objectId
    backendSubnetId: backendVirtualNetwork.outputs.backendSubnetId
    sshKeyName: sshKeyName
    env: env
    locationShortName: locationShortName
    sharedComponent: sharedComponent
    UniqueValue: UniqueValue
  }
}



module secret '02_Shared/kv-Secret.bicep' = {
  name: 'sec-${frontendGroupName}-ssh' // Updated module name
  scope: resourceGroup(frontendResourceGroupName)
  dependsOn: [keyVault]
  params: {
// hier was je gebleven je was bezig met de secret value bij de ssh van de VM te krijgen nadat die wordt aangemaakt in de keyvault, het kan komen door de resourcegroup
  }
}

*/

// --- Storage ----------------

// --- Backup ----------------

// --- Recovery ----------------

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//   ██████  ██    ██ ████████ ██████  ██    ██ ████████ ███████ 
//  ██    ██ ██    ██    ██    ██   ██ ██    ██    ██    ██      
//  ██    ██ ██    ██    ██    ██████  ██    ██    ██    ███████ 
//  ██    ██ ██    ██    ██    ██      ██    ██    ██         ██ 
//   ██████   ██████     ██    ██       ██████     ██    ███████ 
                                                              
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

output tenantId string = tenantId
output objectId string = objectId
output UniqueValue string = UniqueValue
output frontendVirtualMachineName string = frontendCompute.name
