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

param frontendPublicIpAddressType string 
param frontendPublicIpAddressSku string 
param frontendPipDeleteOption string 
param frontendVmComputerName string 
param frontendOsDiskType string 
param frontendOsDiskDeleteOption string 
param frontendVmSize string 
param frontendNicDeleteOption string 
param frontendAdminUsername string

@secure()
param frontendAdminPassword string
param frontendVmZone string 
param frontendVmOs string = '22_04-lts-gen2' 


param frontendComponent string // Unique parameter name

var frontendNicName =  'nic-${product}-${frontendComponent}-${env}-${locationShortName}' 
var frontendPipName =  'pip-${product}-${frontendComponent}-${env}-${locationShortName}' 
var frontendVmName =  'vm-${frontendVmOs}-${env}-${locationShortName}' 
var frontendVnetName = 'vnet-${product}-${frontendComponent}-${env}-${locationShortName}'
var frontendSubnetName = 'snet-${frontendComponent}-${env}-${locationShortName}' 
var frontendSubnetResourceId = resourceId('Microsoft.Network/virtualNetworks/subnets', frontendVnetName, frontendSubnetName) 

resource frontendNetworkInterface 'Microsoft.Network/networkInterfaces@2023-05-01' = {
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

resource frontendPublicIpAddress 'Microsoft.Network/publicIPAddresses@2023-05-01' = {
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



param sshKeyName string

param sharedResourceGroupName string

resource kvRef 'Microsoft.Compute/sshPublicKeys@2023-07-01' existing = {
  name: sshKeyName
  scope: resourceGroup(sharedResourceGroupName)

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
              keyData: kvRef.properties.publicKey
            }
        ]
      }
      provisionVMAgent: true
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
            