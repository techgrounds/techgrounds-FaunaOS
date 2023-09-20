// ---------------------
// Parameter declaration
// ---------------------

@description('Environment for frontend deployment')
param env string

@description('Azure region for frontend deployment.')
param location string

@description('A list of required and optional subnet properties for frontend.')
param frontendSubnets array

@description('Virtual Network Address Range for frontend')
param frontendAddressPrefixes array

@description('Tag values to be applied to resources in frontend deployment')
param tagValues object

@description('Group name is created based on the product name and component being deployed for frontend')
param frontendGroupName string

@description('Short name for the frontend deployment region')
param locationShortName string

@description('Custom DNS servers for Virtual Network in frontend')
param frontendDnsServers array

param frontendAllowedSubNsg string


var frontendVNetName =  'vnet-${frontendGroupName}-${env}-${locationShortName}'
var frontendNsgSecurityRules = json(loadTextContent('../99_Parameters/Frontend/frontend_nsg_rules.json')).securityRules
var frontendNsgName = 'nsg-${frontendGroupName}-${env}-${locationShortName}'
var frontendDnsServersVariable = {
  dnsServers: array(frontendDnsServers)
}


resource frontendNetworkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: frontendNsgName
  location: location
  tags: tagValues
  properties: {
    securityRules: frontendNsgSecurityRules
  }
}

// NSG for frontend ---> Output
@description('The resource ID of the network security group for frontend.')
output frontendNsgResourceId string = frontendNetworkSecurityGroup.id


resource frontendVirtualNetwork 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: frontendVNetName
  location: location
  tags: tagValues
  properties: {
    addressSpace: {
      addressPrefixes: frontendAddressPrefixes
    }
    // Here if the value is empty if we don't set a value, the result is null
    dhcpOptions: !empty(frontendDnsServers) ? frontendDnsServersVariable : null
    // This is a loop for deploying subnets 
    subnets: [for frontendSubnet in frontendSubnets: {
      name: 'snet-${frontendSubnet.name}-${env}-${locationShortName}'
      properties: {
        addressPrefix: frontendSubnet.subnetPrefix
        serviceEndpoints: contains(frontendSubnet, 'serviceEndpoints') ? frontendSubnet.serviceEndpoints : []
        delegations: contains(frontendSubnet, 'delegation') ? [
          {
            name: '${frontendSubnet.delegations}'
            properties:{
              serviceName: frontendSubnet.delegations
            }
          }
            ]  : []
        privateEndpointNetworkPolicies: contains(frontendSubnet, 'privateEndpointNetworkPolicies') ? frontendSubnet.privateEndpointNetworkPolicies : null
        privateLinkServiceNetworkPolicies: contains(frontendSubnet, 'privateLinkServiceNetworkPolicies') ? frontendSubnet.privateLinkServiceNetworkPolicies : null
        // Defines what subnet gets an NSG but using the output of the NSG resource-ID
        networkSecurityGroup: frontendSubnet.name == '${frontendAllowedSubNsg}' ? {
          id: frontendNetworkSecurityGroup.id
        } : null
      }
    }]
  }
}

// Output for frontend Virtual Network
output frontendVirtualNetworkId string = frontendVirtualNetwork.id


// ------------
// Notes
// ---------------
