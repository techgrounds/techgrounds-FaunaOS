// ---------------------
// Parameter declaration
// ---------------------

@description('Environment for frontend deployment')
param env string

@description('Azure region for frontend deployment.')
param location string

@description('A list of required and optional subnet properties for frontend.')
param backendSubnets array // Updated parameter name

@description('Virtual Network Address Range for frontend')
param backendAddressPrefixes array // Updated parameter name

@description('Tag values to be applied to resources in frontend deployment')
param tagValues object

@description('Group name is created based on the product name and component being deployed for frontend')
param backendGroupName string // Updated parameter name

@description('Short name for the deployment region')
param locationShortName string // Updated parameter name

@description('Custom DNS servers for Virtual Network in frontend')
param backendDnsServers array // Updated parameter name

param backendAllowedSubNsg string // Updated parameter name

@description('Application components these resources are part of.')
param backendComponent string

var backendVNetName =  'vnet-${backendGroupName}-${env}-${locationShortName}' // Updated variable name
var backendNsgSecurityRules = json(loadTextContent('../99_Parameters/BackendParams/backend_nsg_rules.json')).securityRules // Updated variable name
var backendNsgName = 'nsg-${backendGroupName}-${env}-${locationShortName}' // Updated variable name
var backendDnsServersVariable = {
  dnsServers: array(backendDnsServers) // Updated variable name
}

resource backendNetworkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: backendNsgName // Updated variable name
  location: location // Unchanged parameter name
  tags: tagValues // Updated variable name
  properties: {
    securityRules: backendNsgSecurityRules // Updated variable name
  }
}

// NSG for backend ---> Output
@description('The resource ID of the network security group for backend.') // Updated description
output backendNsgResourceId string = backendNetworkSecurityGroup.id // Updated variable name

resource backendVirtualNetwork 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: backendVNetName // Updated variable name
  location: location // Unchanged parameter name
  tags: tagValues // Updated variable name
  properties: {
    addressSpace: {
      addressPrefixes: backendAddressPrefixes // Updated parameter name
    }
    // Here if the value is empty if we don't set a value, the result is null
    dhcpOptions: !empty(backendDnsServers) ? backendDnsServersVariable : null // Updated variable name
    // This is a loop for deploying subnets 
    subnets: [for backendSubnet in backendSubnets: {
      name: 'snet-${backendSubnet.name}-${env}-${locationShortName}'
      properties: {
        addressPrefix: backendSubnet.subnetPrefix
        serviceEndpoints: contains(backendSubnet, 'serviceEndpoints') ? backendSubnet.serviceEndpoints : []
        delegations: contains(backendSubnet, 'delegation') ? [
          {
            name: '${backendSubnet.delegations}'
            properties:{
              serviceName: backendSubnet.delegations
            }
          }
            ]  : []
        privateEndpointNetworkPolicies: contains(backendSubnet, 'privateEndpointNetworkPolicies') ? backendSubnet.privateEndpointNetworkPolicies : null
        privateLinkServiceNetworkPolicies: contains(backendSubnet, 'privateLinkServiceNetworkPolicies') ? backendSubnet.privateLinkServiceNetworkPolicies : null
        // Defines what subnet gets an NSG but using the output of the NSG resource-ID
        networkSecurityGroup: backendSubnet.name == '${backendAllowedSubNsg}' ? {
          id: backendNetworkSecurityGroup.id // Updated variable name
        } : null
      }
    }]
  }
}

// Output for backend Virtual Network
output backendVirtualNetworkId string = backendVirtualNetwork.id // Updated variable name
output backendSubnetId string = resourceId('Microsoft.Network/virtualNetworks/subnets', backendVirtualNetwork.name, 'snet-${backendComponent}-${env}-${locationShortName}')

// ------------
// Notes
// ---------------
