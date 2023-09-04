param location string = 'westeurope'
param vnetName string = 'webVnet'

var nsgRules = [
  {
    name: 'web-nsg'
    rules: [
        {
          name: 'AllowSSH'
          properties: {
            priority: 1001
            protocol: 'Tcp'
            sourcePortRange: '*'
            destinationPortRange: '22'
            sourceAddressPrefix: '*'
            destinationAddressPrefix: '*'
            access: 'Allow'
            direction: 'Inbound'
          }
        }
       
        {
          name: 'DenyAllInbound'
          properties: {
            priority: 1002
            protocol: '*'
            sourcePortRange: '*'
            destinationPortRange: '*'
            sourceAddressPrefix: '*'
            destinationAddressPrefix: '*'
            access: 'Deny'
            direction: 'Inbound'
          }
        }
       
        {
          name: 'DenyAllOutbound'
          properties: {
            priority: 1003
            protocol: '*'
            sourcePortRange: '*'
            destinationPortRange: '*'
            sourceAddressPrefix: '*'
            destinationAddressPrefix: '*'
            access: 'Deny'
            direction: 'Outbound'
        } 
      }
    ]
  }    
]

resource NetworkSecurityGroups 'Microsoft.Network/networkSecurityGroups@2023-04-01' = [for rule in nsgRules: {
  name: rule.name
  location: location
  properties: {
    securityRules: rule.rules
  }
}]

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.10.0/24'
      ]
    }
    subnets: [
      {
        name: 'Subnetweb'
        properties: {
          addressPrefix: '10.10.10.0/25'
        }
      }
      {
        name: 'SubnetFuture'
        properties: {
          addressPrefix: '10.10.10.128/25'
        }
      }
    ]
  }
}
