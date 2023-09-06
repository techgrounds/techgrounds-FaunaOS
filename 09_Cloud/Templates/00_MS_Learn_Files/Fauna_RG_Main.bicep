targetScope='subscription'

param resourceGroupName string = 'RG_WebVnet'
param resourceGroupLocation string = Location
param WebVnetName string = 'Vnet_Web'
param Location string = 'westeurope'



resource newRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

module Vnetweb 'modules/Vnet_Web_Module.bicep' = {
  name: 'WebVnetModule'
  scope: newRG
  params: {
    location: Location
    vnetName: WebVnetName
    properties: {
      networkSecurityGroup: resourceId('Microsoft.Network/networkSecurityGroups@2023-01-01', 'web-nsg')
    }
  }
}



