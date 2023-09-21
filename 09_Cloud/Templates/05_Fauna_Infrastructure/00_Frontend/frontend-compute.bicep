param location string // Common parameter
param env string // Common parameter
param currentDate string = utcNow('yyyy-MM-dd')
param product string
param locationList object

var locationShortName = locationList[location]

var tagValues = {
  createdBy: 'AZ CLI'
  environment: env
  deploymentDate: currentDate
  product: product
}

var sharedResourceGroupName = 'rg-${product}-${sharedComponent}-${env}-${locationShortName}'
var frontendResourceGroupName = 'rg-${frontendEnvironmentName}' // Updated variable name
var frontendEnvironmentName = '${frontendGroupName}-${env}-${locationShortName}' // Updated variable name
var frontendGroupName = '${product}-${frontendComponent}' // Updated variable name

param frontendPublicIpAddressType string // Unique parameter name
param frontendPublicIpAddressSku string // Unique parameter name
param frontendPipDeleteOption string // Unique parameter name
param frontendVmComputerName string // Unique parameter name
param frontendOsDiskType string // Unique parameter name
param frontendOsDiskDeleteOption string // Unique parameter name
param frontendVmSize string // Unique parameter name
param frontendNicDeleteOption string // Unique parameter name
param frontendAdminUsername string // Unique parameter name
param frontendVmZone string // Unique parameter name
param frontendVmOs string = '22_04-lts-gen2' // Unique parameter name

@secure()
param frontendAdminPassword string // Unique parameter name
param keyVaultName string
var keyVaultSecretUri = keyvault.outputs.keyVaultSecretUri
@description('Properties for key vault deployment')
param keyVaultProperties object
param backendSubnetId string

param frontendComponent string // Unique parameter name

param sharedComponent string

var frontendNicName =  'nic-${product}-${frontendComponent}-${env}-${locationShortName}' // Unique variable name
var frontendPipName =  'pip-${product}-${frontendComponent}-${env}-${locationShortName}' // Unique variable name
var frontendVmName =  'vm-${frontendVmOs}-${env}-${locationShortName}' // Unique variable name
var frontendVnetName = 'vnet-${product}-${frontendComponent}-${env}-${locationShortName}' // Unique variable name
var frontendSubnetName = 'snet-frontend-${env}-${locationShortName}' // Unique variable name
var frontendSubnetResourceId = resourceId(frontendResourceGroupName, 'Microsoft.Network/virtualNetworks/subnets', frontendVnetName, frontendSubnetName) // Unique variable name

@description('Current Tenant Id & Object Id to be used in deployment')
param objectId string

resource frontendNetworkInterface 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: frontendNicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: frontendSubnetResourceId
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: frontendPublicIpAddress.id
            properties: {
              deleteOption: frontendPipDeleteOption
            }
          }
        }
      }
    ]
  }
  tags: {
    createdBy: 'AZURE PORTAL'
    deploymentDate: '2023-09-12'
    environment: 'Dev'
    product: 'V1'
  }
}

resource frontendPublicIpAddress 'Microsoft.Network/publicIpAddresses@2020-08-01' = {
  name: frontendPipName
  location: location
  properties: {
    publicIPAllocationMethod: frontendPublicIpAddressType
  }
  sku: {
    name: frontendPublicIpAddressSku
  }
  zones: [
    frontendVmZone
  ]
  tags: {
    createdBy: 'AZURE PORTAL'
    deploymentDate: '2023-09-12'
    environment: 'Dev'
    product: 'V1'
  }
}


// ERROR WAS HERE
/*
resource keyvault 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  name: '${keyVaultName}/${frontendAdminPassword}'
  properties: {
    value: frontendAdminPassword
  }
}
*/
module keyvault '../02_Shared/keyVault.bicep' = {
  name: keyVaultName
  scope: resourceGroup(sharedResourceGroupName)
  params: {
    location: location
    AdminSecretName: frontendAdminUsername
    Adminpassword: frontendAdminPassword
    backendSubnetId: backendSubnetId
    keyVault: keyVaultProperties
    keyVaultName: keyVaultName
    objectId: objectId
    tagValues: tagValues
    
  }
  }


resource frontendVirtualMachine 'Microsoft.Compute/virtualMachines@2023-07-01' = {
  name: frontendVmName
  location: location
  tags: tagValues
  properties: {
    hardwareProfile: {
      vmSize: frontendVmSize
    }
    osProfile: {
      computerName: frontendVmComputerName
      adminUsername: frontendAdminUsername
      adminPassword: frontendAdminPassword
      linuxConfiguration: {
        ssh: {
          publicKeys: [
            {
              path: '/home/${frontendAdminUsername}/.ssh/authorized_keys'
              keyData: '@microsoft.keyvault(secreturi=${keyVaultSecretUri})'
            }
        ]
      }
        patchSettings: {
          patchMode: 'ImageDefault'
        }
      }
    }
    storageProfile: {
      osDisk: {
        createOption: 'fromImage'
        managedDisk: {
          storageAccountType: frontendOsDiskType
        }
        deleteOption: frontendOsDiskDeleteOption
      }
      imageReference: {
        publisher: 'Canonical'
        offer: '0001-com-ubuntu-server-jammy'
        sku: frontendVmOs
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: frontendNetworkInterface.id
          properties: {
            deleteOption: frontendNicDeleteOption
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

output frontendVirtualMachineId string = frontendVirtualMachine.id
