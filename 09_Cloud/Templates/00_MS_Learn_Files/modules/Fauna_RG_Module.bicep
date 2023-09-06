// Fauna_RG_Module.bicep
param rgName string
param location string

var rgResourceGroupName = rgName
var rgLocation = location

resource rgResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgResourceGroupName
  location: rgLocation
}
