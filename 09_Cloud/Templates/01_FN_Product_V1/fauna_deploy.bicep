targetScope = 'subscription'

// --------------------------------------------------
// Parameter declaration
// --------------------------------------------------

@description('Application components these resources are part of.')
param component string

@description('Enviroment for deployment')
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

@description('A list of required and optional subnet propeties')
param subnets array

@description('Virtual Network Address Range')
param addressPrefixes array

@description('Dictionary of deployment regions and the shortname')
param locationList object

@description('Custom DNS servers for Virtual Network')
param dnsServers array

@description('Defines what subnet will have a nsg attached to them')
param allowedSubNsg string

@description('Properties for keyvault deployment')
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


// // --------------------------------------------------
// Variable declaration
// --------------------------------------------------

var groupName = '${product}-${component}'
var enviromentName = '${groupName}-${env}-${locationShortName}'
var resourceGroupName = 'rg-${enviromentName}'
var locationShortName = locationList[location]
var keyVaultName = 'kv-${product}${component}${env}${locationShortName}${UniqueValue}I'
var environmentName = '${product}-${component}-${env}-${locationShortName}'



var tagValues = {
  createdBy: 'AZ CLI'
  environment: env
  deploymentDate: currentDate
  product: product
}



// // ------------------------------------------------
// Resource declaration
// ---------------------------------------------------

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
  tags: tagValues
}


module virtualNetwork 'modules/virtualNetwork/virtualNetwork.bicep' = {
  scope: resourceGroup
  name: 'vnet-${product}-${component}-${env}-${locationShortName}-dp'
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

module keyVault 'modules/keyVault/keyVault.bicep' = {
  name: 'kv${environmentName}-dp'
  scope: resourceGroup
  params: {
    keyVault: keyVaultProperties
    location: location
    locationShortName: locationShortName
    env: env
    keyVaultName: keyVaultName
    tenantId: tenantId
    virtualNetworkId: virtualNetwork.outputs.virtualNetworkId
    tagValues: tagValues
    objectId: objectId
  }
  
}

module webServerVM './modules/virtualMachines/webservervm.bicep' = {
  scope: resourceGroup
  name: 'webServerVM'
  params: {
    location: location
    publicIpAddressType: publicIpAddressType // Replace with your desired value
    publicIpAddressSku: publicIpAddressSku // Replace with your desired value
    pipDeleteOption: pipDeleteOption // Replace with your desired value
    virtualMachineComputerName2: virtualMachineComputerName2 // Replace with your desired value
    virtualMachineRG: resourceGroupName // Replace with your desired value
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
  }
}


output adminUsername string = webServerVM.outputs.adminUsername

