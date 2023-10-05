
//  █████   ████ ██████████ █████ █████ █████   █████   █████████   █████  █████ █████       ███████████
// ░░███   ███░ ░░███░░░░░█░░███ ░░███ ░░███   ░░███   ███░░░░░███ ░░███  ░░███ ░░███       ░█░░░███░░░█
//  ░███  ███    ░███  █ ░  ░░███ ███   ░███    ░███  ░███    ░███  ░███   ░███  ░███       ░   ░███  ░ 
//  ░███████     ░██████     ░░█████    ░███    ░███  ░███████████  ░███   ░███  ░███           ░███    
//  ░███░░███    ░███░░█      ░░███     ░░███   ███   ░███░░░░░███  ░███   ░███  ░███           ░███    
//  ░███ ░░███   ░███ ░   █    ░███      ░░░█████░    ░███    ░███  ░███   ░███  ░███      █    ░███    
//  █████ ░░████ ██████████    █████       ░░███      █████   █████ ░░████████   ███████████    █████   
// ░░░░░   ░░░░ ░░░░░░░░░░    ░░░░░         ░░░      ░░░░░   ░░░░░   ░░░░░░░░   ░░░░░░░░░░░    ░░░░░    
                                                                                                     
////////////////////////////////////////////////////////////////////////////////////////////////////////    
/*

Info:

This is the keyvault here we will store all the secrets for the deployment.




*/
////////////////////////////////////////////////////////////////////////////////////////////////////////

//  ██████   █████  ██████   █████  ███    ███ ███████ ████████ ███████ ██████  ███████ 
//  ██   ██ ██   ██ ██   ██ ██   ██ ████  ████ ██         ██    ██      ██   ██ ██      
//  ██████  ███████ ██████  ███████ ██ ████ ██ █████      ██    █████   ██████  ███████ 
//  ██      ██   ██ ██   ██ ██   ██ ██  ██  ██ ██         ██    ██      ██   ██      ██ 
//  ██      ██   ██ ██   ██ ██   ██ ██      ██ ███████    ██    ███████ ██   ██ ███████ 

////////////////////////////////////////////////////////////////////////////////////////////////////////  

targetScope = 'resourceGroup'

@description('Azure region for deployment.')
param location string 

@description('Tag values to be applied to resources in this deployment')
param tagValues object 

@description('Key Vault properties')
param keyVault object 

@description('Object ID of the user or group to grant access to the key vault')
param objectId string 


@description('Specifies the permissions to keys in the vault. Valid values are: all, encrypt, decrypt, wrapKey, unwrapKey, sign, verify, get, list, create, update, import, delete, backup, restore, recover, and purge.')
param keysPermissions array = [
  'get'
  'list'
  'create'
  'update'
  'import'
  'delete'
  'backup'
  'restore'
  'recover'
  'purge'
]

@description('Specifies the permissions to secrets in the vault. Valid values are: all, get, list, set, delete, backup, restore, recover, and purge.')
param secretsPermissions array = [
  'get'
  'list'
  'set'
  'delete'
  'backup'
  'restore'
]

@description('Specifies the permissions to certificates in the vault. Valid values are: all, get, list, delete, create, import, update, managecontacts, getissuers, listissuers, setissuers, deleteissuers, manageissuers, recover, and purge.')
param certificatesPermissions array = [
  'get'
  'list'
  'delete'
  'create'
  'import'
  'update'
  'managecontacts'
  'getissuers'
  'listissuers'
  'setissuers'
  'deleteissuers'
  'manageissuers'
  'recover'
  'purge'
]



////////////////////////////////////////////////////////////////////////////////////////////////////////

//  ██    ██  █████  ██████  ██  █████  ██████  ██      ███████ ███████ 
//  ██    ██ ██   ██ ██   ██ ██ ██   ██ ██   ██ ██      ██      ██      
//  ██    ██ ███████ ██████  ██ ███████ ██████  ██      █████   ███████ 
//   ██  ██  ██   ██ ██   ██ ██ ██   ██ ██   ██ ██      ██           ██ 
//    ████   ██   ██ ██   ██ ██ ██   ██ ██████  ███████ ███████ ███████ 

////////////////////////////////////////////////////////////////////////////////////////////////////////  

@description('IP allow list for the key vault') // Here we are getting the IP allow list from the keyVaultIpAllowList.json file
var ipRules = json(loadTextContent('../99_Parameters/SharedParams/keyVaultIpAllowList.json'))

param keyVaultName string



////////////////////////////////////////////////////////////////////////////////////////////////////////

//  ██████  ███████ ███████  ██████  ██    ██ ██████   ██████ ███████ ███████ 
//  ██   ██ ██      ██      ██    ██ ██    ██ ██   ██ ██      ██      ██      
//  ██████  █████   ███████ ██    ██ ██    ██ ██████  ██      █████   ███████ 
//  ██   ██ ██           ██ ██    ██ ██    ██ ██   ██ ██      ██           ██ 
//  ██   ██ ███████ ███████  ██████   ██████  ██   ██  ██████ ███████ ███████           

////////////////////////////////////////////////////////////////////////////////////////////////////////  

// --------------------------------------------------
// Key Vault
// --------------------------------------------------

param frontendSubnetId string

resource keyvault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  tags: tagValues
  properties: {
    enabledForDeployment: keyVault.enabledForDeployment
    enabledForTemplateDeployment: keyVault.enabledForTemplateDeployment
    enabledForDiskEncryption: keyVault.enabledForDiskEncryption
    enableRbacAuthorization: keyVault.enableRbacAuthorization
    sku: {
      name: keyVault.sku
      family: 'A'
    }
    tenantId: tenant().tenantId
    accessPolicies: [
      {
        objectId: objectId
        tenantId: tenant().tenantId
        permissions: {
          keys: keysPermissions
          secrets: secretsPermissions
          certificates: certificatesPermissions
        }
      }
    ]
    enableSoftDelete: keyVault.enableSoftDelete
    softDeleteRetentionInDays: keyVault.softDeleteRetentionInDays
    enablePurgeProtection: keyVault.enablePurgeProtection
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
      ipRules: ipRules.ipRules
      virtualNetworkRules: [ for subnet in allowedSubnets: {
        id: frontendSubnetId
        ignoreMissingVnetServiceEndpoint: false
      }]
      }
    }
    
  }

param allowedSubnets array

@secure()
param sshKeyName string

@description('The permitted JSON web key operations of the key to be created.') // error was here  Property  has invalid value\r\n"}]}]}]}}
param keyOps array = [ 'sign', 'verify', 'unwrapKey', 'wrapKey' 
]

  // ...

  // Add the following code block to create an RSA ssh key
  resource sshKey 'Microsoft.KeyVault/vaults/keys@2023-02-01' = {
    parent: keyvault
    name: sshKeyName
    properties: {
      kty: 'RSA'
      keySize: 2048
      keyOps: keyOps
      attributes: {
        enabled: true
      }
    }
  }

  // ...

  // Output the ssh key object
  output sshKeyObject object = sshKey.properties


output proxyKey object = sshKey.properties



////////////////////////////////////////////////////////////////////////////////////////////////////////

//   ██████  ██    ██ ████████ ██████  ██    ██ ████████ ███████ 
//  ██    ██ ██    ██    ██    ██   ██ ██    ██    ██    ██      
//  ██    ██ ██    ██    ██    ██████  ██    ██    ██    ███████ 
//  ██    ██ ██    ██    ██    ██      ██    ██    ██         ██ 
//   ██████   ██████     ██    ██       ██████     ██    ███████ 
                                                              
////////////////////////////////////////////////////////////////////////////////////////////////////////

@description('Key Vault resource ID') // Used for getting Key Vault resource ID
output keyVaultResourceId string = keyvault.id

@description('Key Vault URI') // Used for getting secrets from the key vault
output keyVaultName string = keyvault.name



