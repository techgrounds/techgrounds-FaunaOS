param subnetName string = 'Subnetweb'
param vnetName string = 'webVnet'


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
