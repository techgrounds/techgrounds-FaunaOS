param location string = 'germanywestcentral'
param publicIpAddressType string
param publicIpAddressSku string
param pipDeleteOption string
param virtualMachineComputerName2 string
param virtualMachineRG string
param osDiskType string
param osDiskDeleteOption string
param virtualMachineSize string
param nicDeleteOption string
param adminUsername string
param virtualMachine2Zone string
param vmOs string = 'Lx-22_04-g2'

@secure()
param adminPassword string

@description('Enviroment for deployment')
param env string

@description('Group name is created based on the product name and component being deployed')
param groupName string

@description('Dictionary of deployment regions and the shortname')
param locationList object


var enviromentName = '${groupName}-${env}-${locationShortName}'
var resourceGroupName = 'rg-${enviromentName}'
var locationShortName = locationList[location]

var nicName =  'nic-${virtualMachineRG}-${env}-${locationShortName}'
var pipName =  'pip-${virtualMachineRG}-${env}-${locationShortName}'
var vmName =  'vm-${vmOs}-${env}-${locationShortName}'

var vnetName = 'vnet-${groupName}-${env}-${locationShortName}'
var subnetName = 'snet-frontend-${env}-${locationShortName}'
var subnetResourceId = resourceId(resourceGroupName, 'Microsoft.Network/virtualNetworks/subnets', vnetName, subnetName)


resource networkInterface 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: nicName
  location: location
  dependsOn: [
     publicIpAddress
  ]
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnetResourceId // Updated to use subnetResourceId
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: resourceId(resourceGroup().name, 'Microsoft.Network/publicIpAddresses', pipName)
            properties: {
              deleteOption: pipDeleteOption
            }
          }
        }
      }
    ]
  }
  tags: {
    createdBy: 'AZURE PORTAL'
    deploymentDate: '2023-09-12'
    enviroment: 'Dev'
    product: 'V1'
  }
}

resource publicIpAddress 'Microsoft.Network/publicIpAddresses@2020-08-01' = {
  name: pipName
  location: location
  properties: {
    publicIPAllocationMethod: publicIpAddressType
  }
  sku: {
    name: publicIpAddressSku
  }
  zones: [
    virtualMachine2Zone
  ]
  tags: {
    createdBy: 'AZURE PORTAL'
    deploymentDate: '2023-09-12'
    enviroment: 'Dev'
    product: 'V1'
  }
}

resource virtualMachine 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: vmName
  location: location
  dependsOn: [
    networkInterface
  ]
  properties: {
    hardwareProfile: {
      vmSize: virtualMachineSize
    }
    storageProfile: {
      osDisk: {
        createOption: 'fromImage'
        managedDisk: {
          storageAccountType: osDiskType
        }
        deleteOption: osDiskDeleteOption
      }
      imageReference: {
        publisher: 'canonical'
        offer: '0001-com-ubuntu-server-jammy'
        sku: '22_04-lts-gen2'
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: resourceId('Microsoft.Network/networkInterfaces', nicName)
          properties: {
            deleteOption: nicDeleteOption
          }
        }
      ]
    }
    osProfile: {
      computerName: virtualMachineComputerName2
      adminUsername: adminUsername
      adminPassword: adminPassword
      linuxConfiguration: {
        patchSettings: {
          patchMode: 'ImageDefault'
        }
      }
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
  tags: {
    createdBy: 'AZURE PORTAL'
    deploymentDate: '2023-09-12'
    enviroment: 'Dev'
    product: 'V1'
  }
  zones: [
    virtualMachine2Zone
  ]
}

output adminUsername string = adminUsername
