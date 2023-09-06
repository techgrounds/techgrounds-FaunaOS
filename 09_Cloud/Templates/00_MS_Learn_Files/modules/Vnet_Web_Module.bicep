param location string = 'westeurope'
param vnetName string = 'webVnet'
param properties object

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
          networkSecurityGroup: null
        }
      }
      {
        name: 'SubnetFuture'
        properties: {
          addressPrefix: '10.10.10.128/25'
          networkSecurityGroup: {
          id: '/subscriptions/e40723d1-0cc4-47a0-8f11-6246f8d97d70/resourceGroups/RG_WebVnet/providers/Microsoft.Network/networkSecurityGroups/web-nsg'
          }
        }
      }

    ]
  }
}

module updatesubnet 'Update_Subnet.bicep' = {
  name: 'Subnetupdate'
  params: {
    properties: properties
  }
}

module updatesubnetmodule 'Update_Subnet_Module.bicep' = {
  name: 'Subnetupdatemodule'
  params: {
    subnetName: 'Subnetweb'
  }
}
