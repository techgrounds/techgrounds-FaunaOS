using 'fauna_deploy.bicep'

// --------
// General
// --------
param tenantId = 'de60b253-74bd-4365-b598-b9e55a2b208d'
param objectId = '34a7f47f-9165-4ad9-8e5f-b81dab43dc13'
param component = 'Fauna'
param env = 'Dev'
param product = 'V1'
param location = 'germanywestcentral'
param locationList = {
  westeurope: 'euwest'
  germanywestcentral: 'gerwc'
}

// --------
// Virtual Network & Keyvault End Point
// --------

param subnets = [
  {
          name: 'frontend'
          subnetPrefix: '10.10.10.0/25'
          privateEndpointNetworkPolicies: 'disabled'
          serviceEndpoints: [
            {
            service: 'Microsoft.keyvault'
            locations: ['*'
          ]
        }
      ]
    }
  {
          name: 'future'
          subnetPrefix: '10.10.10.128/25'                 
  }
]
param addressPrefixes = [
  '10.10.10.0/24'
]
param dnsServers = []
param allowedSubNsg = 'frontend'

// --------
// Key Vault
// --------

param keyVaultProperties = {
        sku:'Standard'
        enabledForDeployment: 'false'
        
        enabledForTemplateDeployment: 'true'
        enabledForDiskEncryption: 'false'
        enableRbacAuthorization: 'false'
        enableSoftDelete: 'true'
        softDeleteRetentionInDays: '90'
        enablePurgeProtection: 'true'
        enableNetworkAcls: 'true'
        accessPolicies: {
          tenantid: tenantId
          objectid: objectId
          permissions: {
          }
        }
        allowedSubnets:[
          'snet-frontend'
        ]
}

// ----------
// Virtual Machine
// ----------

// ('Type of public IP allocation for the VM.')
param publicIpAddressType = 'static'

// ('SKU for the public IP address.')
param publicIpAddressSku = 'Standard'

// ('Option for deleting the public IP address.')
param pipDeleteOption = 'Delete'

// ('Name of the virtual machine.')
param virtualMachineComputerName2 = 'MyVM'

// ('Type of OS disk for the VM.')
param osDiskType = 'Standard_LRS'

// ('Option for deleting the OS disk.')
param osDiskDeleteOption = 'Delete'

// ('Size of the virtual machine.')
param virtualMachineSize = 'Standard_DS2_v2'

// ('Option for deleting the network interface.')
param nicDeleteOption = 'Delete'

// ('Admin username for the virtual machine.')
param adminUsername = 'adminuser'

// ('Availability zone for the virtual machine.')
param virtualMachine2Zone = '1'

param adminPassword = 'testAdmin01'


