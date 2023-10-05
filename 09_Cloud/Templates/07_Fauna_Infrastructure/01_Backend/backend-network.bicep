// --- Parameters ----------------
param backendSubnets array
param backendAddressPrefixes array
param backendDnsServers array
param backendAllowedSubNsg string
param components array

// --- Variables ----------------
var vnetName = 'vnet-${components[2]}-${environmentName}'
var nsgName = 'nsg-${components[2]}-${backendAllowedSubNsg}-${environmentName}'

// --- Network Security Group ----------------
resource nsg 'Microsoft.Network/networkSecurityGroups@2020-11-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [
      // Define your security rules here
    ]
  }
}

// --- Virtual Network ----------------
resource vnet 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: backendAddressPrefixes
    }
    subnets: [for subnet in backendSubnets: {
      name: 'snet-${components[2]}-${subnet.name}-${environmentName}'
      properties: {
        addressPrefix: subnet.subnetPrefix
        networkSecurityGroup: {
          id: nsg.id
        }
        privateEndpointNetworkPolicies: subnet.privateEndpointNetworkPolicies
        serviceEndpoints: subnet.serviceEndpoints
      }
    }]
    dhcpOptions: {
      dnsServers: backendDnsServers
    }
  }
}
