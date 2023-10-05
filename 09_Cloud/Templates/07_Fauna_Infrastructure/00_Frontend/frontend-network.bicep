// Frontend Network Module

// Parameters
param environmentName string
param frontendSubnets array
param frontendAddressPrefixes array
param frontendDnsServers array
param frontendAllowedSubNsg string
param components array
param location string

// Variables
var vnetName = 'vnet-${components[1]}-${environmentName}'
var nsgName = 'nsg-${components[1]}-${environmentName}'

// Resources

// Virtual Network
resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: frontendAddressPrefixes
    }
    subnets: [for subnet in frontendSubnets: {
      name: 'snet-${components[1]}-${subnet.name}-${environmentName}'
      properties: {
        addressPrefix: subnet.subnetPrefix
        networkSecurityGroup: {
          id: resourceId('Microsoft.Network/networkSecurityGroups', nsgName)
        }
      }
    }]
    dhcpOptions: {
      dnsServers: frontendDnsServers
    }
  }
}

// Network Security Group
resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2021-02-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [
      {
        name: 'AllowSSHFromAdmin'
        properties: {
          priority: 100
          access: 'Allow'
          direction: 'Inbound'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationPortRange: '22'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'AllowHTTPS'
        properties: {
          priority: 110
          access: 'Allow'
          direction: 'Inbound'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: 'Internet'
          destinationPortRange: '443'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

// Outputs
output vnetId string = virtualNetwork.id
output nsgId string = networkSecurityGroup.id
