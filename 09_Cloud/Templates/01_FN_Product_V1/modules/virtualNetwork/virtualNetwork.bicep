// --------
// Parameter declaration

@description('Enviroment for deployment')
param env string

@description('Azure region for deployment.')
param location string

@description('A list of required and optional subnet properties.')
param subnets array

@description('Virtual Network Address Range')
param addressPrefixes array

@description('Tag values to be applied to resources in this deployment')
param tagValues object

@description('Group name is created based on the product name and component being deployed')
param groupName string

@description('Short name for the deployment region')
param locationShortName string

@description('Custom DNS servers for Virtual Network')
param dnsServers array


var vnetName =  'vnet-${groupName}-${env}-${locationShortName}'
var dnsServersvariable = {
  dnsServers: array(dnsServers)
}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  tags: tagValues
  properties: {
    addressSpace: {
      addressPrefixes: addressPrefixes
    }
    // Here if the value is empty if we dont set a value the result is null
    dhcpOptions: !empty(dnsServers) ? dnsServersvariable : null
    // This is a loop for deploying subnets 
    subnets: [for subnet in subnets: {
      name: 'snet-${subnet.name}-${env}-${locationShortName}'
      properties: {
        addressPrefix: subnet.subnetPrefix
      }
    }]
  }
}

// Notes
// 
