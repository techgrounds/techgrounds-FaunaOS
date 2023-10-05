// Main Bicep file

// --- Scope ----------------
targetScope = 'subscription'

// --- Parameters ----------------
param product string
param component string
param env string
param location string
param locationShortName string
param tagValues object

param vnetAddressPrefix string
param subnetAddressPrefix string
param frontendNsgRules object
param components array
param frontendSubnets array
param frontendVmSize string
param frontendVmImage string
param backendNsgRules object
param backendSubnets array
param backendVmSize string
param backendVmImage string

// --- Variables ----------------

var groupName = '${product}-${component}'
var environmentName = '${groupName}-${env}-${locationShortName}'
var resourceGroupName = 'rg-${environmentName}'

// --- Resource Group ----------------
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
  tags: tagValues
}

// ------------------------------------------------------------------------------------------------------------------------------
// Frontend Resource declaration
// ------------------------------------------------------------------------------------------------------------------------------

// --- Networking ----------------

// --- Frontend Network Module ----------------
module frontendNetwork './frontend/frontend-network.bicep' = {
  name: 'frontendNetworkModule'
  params: {
    vnetAddressPrefix: vnetAddressPrefix
    subnetAddressPrefix: subnetAddressPrefix
    nsgRules: frontendNsgRules
    components: components[1]
    subnets: frontendSubnets // New parameter for the loop-based approach
  }
}

// --- Compute ----------------

// --- Frontend Compute Module ----------------
module frontendCompute './frontend/frontend-compute.bicep' = {
  name: 'frontendComputeModule'
  params: {
    vmSize: frontendVmSize
    vmImage: frontendVmImage
    components: components[1]
  }
}

// ------------------------------------------------------------------------------------------------------------------------------
// Backend Resource declaration
// ------------------------------------------------------------------------------------------------------------------------------

// --- Networking ----------------

// --- Backend Network Module ----------------
module backendNetwork './backend/backend-network.bicep' = {
  name: 'backendNetworkModule'
  params: {
    vnetAddressPrefix: vnetAddressPrefix
    subnetAddressPrefix: subnetAddressPrefix
    nsgRules: backendNsgRules
    components: components[2]
    subnets: backendSubnets // New parameter for the loop-based approach
  }
}

// --- Compute ----------------

// --- Backend Compute Module ----------------
module backendCompute './backend/backend-compute.bicep' = {
  name: 'backendComputeModule'
  params: {
    vmSize: backendVmSize
    vmImage: backendVmImage
    components: components[2]
  }
}

// ------------------------------------------------------------------------------------------------------------------------------
// Shared Resource declaration
// ------------------------------------------------------------------------------------------------------------------------------

// --- Data Module ----------------

// --- Shared Data Module ----------------
module sharedData './shared/shared-data.bicep' = {
  name: 'sharedDataModule'
  params: {
    storageAccountSku: 'Standard_LRS'
    keyVaultSku: 'standard'
    components: components[0]
  }
}

// --- Outputs ----------------

// Define any necessary outputs here
output vnetId string = frontendNetwork.outputs.vnetId
output nsgId string = frontendNetwork.outputs.nsgId
output frontendVmId string = frontendCompute.outputs.vmId
output backendVmId string = backendCompute.outputs.vmId
output storageAccountId string = sharedData.outputs.storageAccountId
output keyVaultId string = sharedData.outputs.keyVaultId
