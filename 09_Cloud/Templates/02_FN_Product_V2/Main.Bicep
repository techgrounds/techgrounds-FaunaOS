targetScope = 'subscription'

// --------------------------------------------------
// Parameter declaration
// --------------------------------------------------

@description('Application components these resources are part of.')
param component string

@description('Environment for deployment')
param env string

@description('Current Date for deployment records. Do not overwrite!')
param currentDate string = utcNow('yyyy-MM-dd')

@description('NewGuid creates a unique string with every deployment then substring takes the first 4 characters')
param UniqueId string = newGuid()
param UniqueValue string = substring(UniqueId, 0, 4)

@description('Application product these resource are assigned too')
param product string

@description('Azure region for deployment')
param location string

@description('A list of required and optional subnet properties')
param subnets array

@description('Virtual Network Address Range')
param addressPrefixes array

@description('Dictionary of deployment regions and the short name')
param locationList object

@description('Custom DNS servers for Virtual Network')
param dnsServers array

@description('Defines what subnet will have an NSG attached to them')
param allowedSubNsg string

@description('Properties for key vault deployment')
param keyVaultProperties object

@description('Current Tenant Id & Object Id to be used in deployment')
param tenantId string
param objectId string

@description('Type of public IP allocation for the VM.')
param publicIpAddressType string

@description('SKU for the public IP address.')
param publicIpAddressSku string

@description('Option for deleting the public IP address.')
param pipDeleteOption string

@description('Name of the virtual machine.')
param virtualMachineComputerName2 string

@description('Type of OS disk for the VM.')
param osDiskType string

@description('Option for deleting the OS disk.')
param osDiskDeleteOption string

@description('Size of the virtual machine.')
param virtualMachineSize string

@description('Option for deleting the network interface.')
param nicDeleteOption string

@description('Admin username for the virtual machine.')
param adminUsername string

@description('Availability zone for the virtual machine.')
param virtualMachine2Zone string

@description('Admin password for the virtual machine.')
@secure()
param adminPassword string

param moduleGroup array = [
  'front'
  'back'
]

param vmOs array = [
  'linux'
  'windows'
  
]


// // --------------------------------------------------
// Variable declaration
// --------------------------------------------------

var groupName = '${product}-${component}'
var environmentName = '${groupName}-${env}-${locationShortName}'
var resourceGroupNameFront = 'rg-${environmentName}-${moduleGroup[0]}'
var resourceGroupNameBack = 'rg-${environmentName}-${moduleGroup[1]}'
var locationShortName = locationList[location]
var keyVaultName = 'kv-${product}${component}${env}${locationShortName}${UniqueValue}I'

var tagValues = {
  createdBy: 'AZ CLI'
  environment: env
  deploymentDate: currentDate
  product: product
}

// --------------------------------------------------
// Resource group declarations
// --------------------------------------------------


resource resourceGroupFront 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupNameFront
  location: location
  tags: tagValues

}

resource resourceGroupBack 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupNameBack
  location: location
  tags: tagValues
}



output resourceGroupFrontId string = resourceGroupFront.id
output resourceGroupBackId string = resourceGroupBack.id


// -- output declarations --



// --------------------------------------------------
// Resource declarations
// --------------------------------------------------

module virtualNetworkFront'./Modules/Frontend/webVnet.bicep' = {
  scope: resourceGroup(resourceGroupNameFront)
  name: 'vnet-${product}-${component}-${env}-${locationShortName}-dp'
  dependsOn: [resourceGroupFront]
  params: {
    addressPrefixes: addressPrefixes
    env: env
    location: location
    tagValues: tagValues
    locationShortName: locationShortName
    dnsServers: dnsServers
    groupName: groupName
    subnets: subnets
    allowedSubNsg: allowedSubNsg
        }
      }
  

module virtualNetworkBack './Modules/Backend/adminVnet.bicep' = {
  scope: resourceGroup(resourceGroupNameBack)
  name: 'vnet-${product}-${component}-${env}-${locationShortName}-dp'
   dependsOn: [resourceGroupBack]
  params: {
    addressPrefixes: addressPrefixes
    env: env
    location: location
    tagValues: tagValues
    locationShortName: locationShortName
    dnsServers: dnsServers
    groupName: groupName
    subnets: subnets
    allowedSubNsg: allowedSubNsg
        }
      }
      

module keyVault './Modules/Shared/keyVault.bicep' = {
  name: 'kv${environmentName}-dp'
  scope: resourceGroup(resourceGroupNameBack)
  dependsOn: [resourceGroupBack, virtualNetworkBack]  
  params: {
    keyVault: keyVaultProperties
    location: location 
    locationShortName: locationShortName
    env: env 
    keyVaultName: keyVaultName
    tenantId: tenantId
    virtualNetworkId: virtualNetworkBack.outputs.virtualNetworkId
    tagValues: tagValues
    objectId: objectId
  }
  
}

module webServerVM './Modules/Frontend/webVm.bicep' = {
  scope: resourceGroup(resourceGroupNameFront)
  name: '${moduleGroup[0]}${vmOs[0]}-VM'
  dependsOn: [resourceGroupFront, keyVault] 
  params: {
    location: location
    publicIpAddressType: publicIpAddressType // Replace with your desired value
    publicIpAddressSku: publicIpAddressSku // Replace with your desired value
    pipDeleteOption: pipDeleteOption // Replace with your desired value
    virtualMachineComputerName2: virtualMachineComputerName2 // Replace with your desired value
    virtualMachineRG: resourceGroupNameFront // Replace with your desired value
    osDiskType: osDiskType // Replace with your desired value
    osDiskDeleteOption: osDiskDeleteOption // Replace with your desired value
    virtualMachineSize: virtualMachineSize // Replace with your desired value
    nicDeleteOption: nicDeleteOption // Replace with your desired value
    adminUsername: adminUsername // Replace with your desired value
    virtualMachine2Zone: virtualMachine2Zone // Replace with your desired value
    env: env
    groupName: groupName
    locationList: locationList
    adminPassword: adminPassword
    moduleGroup: moduleGroup
    vmOs: vmOs
  }
}

module adminServerVM './Modules/Frontend/webVm.bicep' = {
  scope: resourceGroup(resourceGroupNameBack)
  name: '${moduleGroup[1]}${vmOs[1]}-VM'
  dependsOn: [resourceGroupBack, keyVault] 
  params: {
    location: location
    publicIpAddressType: publicIpAddressType // Replace with your desired value
    publicIpAddressSku: publicIpAddressSku // Replace with your desired value
    pipDeleteOption: pipDeleteOption // Replace with your desired value
    virtualMachineComputerName2: virtualMachineComputerName2 // Replace with your desired value
    virtualMachineRG: resourceGroupNameFront // Replace with your desired value
    osDiskType: osDiskType // Replace with your desired value
    osDiskDeleteOption: osDiskDeleteOption // Replace with your desired value
    virtualMachineSize: virtualMachineSize // Replace with your desired value
    nicDeleteOption: nicDeleteOption // Replace with your desired value
    adminUsername: adminUsername // Replace with your desired value
    virtualMachine2Zone: virtualMachine2Zone // Replace with your desired value
    env: env
    groupName: groupName
    locationList: locationList
    adminPassword: adminPassword
    moduleGroup:  moduleGroup
    vmOs: vmOs
  }
}


output adminUsername string = webServerVM.outputs.adminUsername
