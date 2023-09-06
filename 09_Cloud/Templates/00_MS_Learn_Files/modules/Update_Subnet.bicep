// update-subnet.bicep

param vnetName string = 'webVnet'
param subnetName string = 'Subnetweb'
param properties object = 

// Get existing vnet
resource vnet 'Microsoft.Network/virtualNetworks@2022-01-01' existing = {
  name: vnetName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2022-01-01' = {
  name: subnetName
  parent: vnet
  properties: properties

}

module attachNsg 'Update_Subnet.bicep' = {
  name: 'update-subnet-module'
  params: {
    vnetName: vnetName
    subnetName: subnetName
    properties: {
      networkSecurityGroup: resourceId('Microsoft.Network/networkSecurityGroups@2023-01-01', 'web-nsg')
    }
  }
}


