
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

@description('Azure region for deployment.')
param location string 

@description('Tag values to be applied to resources in this deployment')
param tagValues object 

@description('Key Vault properties')
param keyVault object 

@description('Object ID of the user or group to grant access to the key vault')
param objectId string 

param sharedComponent string

param env string

param locationShortName string

param UniqueValue string

var keyVaultName = 'kv-${sharedComponent}${env}${locationShortName}${UniqueValue}I'

@description('ID of the backend subnet')
param backendSubnetId string 


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
  'write'
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

@description('Allowed subnets for the key vault') // Here we are getting the allowed subnets from the main.parameters.json file
var allowedSubnets = keyVault.allowedSubnets 



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
        id: backendSubnetId
        ignoreMissingVnetServiceEndpoint: false
      }]
    }
    
  }
}

@secure()
param sshKeyName string

@description('The permitted JSON web key operations of the key to be created.')
param keyOps array = [
  'encrypt'
  'decrypt'
  'sign'
  'verify'
  'wrapKey'
  'unwrapKey'
  'import'
  'export'
  'backup'
  'restore'
  'recover'
  'purge'
]


@description('The JsonWebKeyCurveName of the key to be created.')
@allowed([
  ''
  'P-256'
  'P-256K'
  'P-384'
  'P-521'
])
param curveName string = ''


resource key 'Microsoft.KeyVault/vaults/keys@2021-11-01-preview' = {
  parent: keyvault
  name: sshKeyName
  properties: {
    kty: 'RSA'
    keyOps: keyOps
    keySize: 2048
    curveName: curveName
  }
}

output proxyKey object = key.properties



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


