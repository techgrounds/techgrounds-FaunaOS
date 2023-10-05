
// Parameter declaration
// ---------------------

// General --------

@description('Enviroment for deployment')
param env string


@description('Azure region for deployment.')
param location string

@description('Tag values to be applied to resources in this deployment')
param tagValues object

@description('Unique name for the roleAssignment in the format of a guid')
param keyVault object 


@description('Short name for the deployment region')
param locationShortName string


@description('Current Tenant Id to be used in deployment')
param tenantId string = tenant().tenantId

param objectId string 

@description('Id of the virtual network')
param virtualNetworkId string
// // ---------------------
@description('Keyvault Name for this deployment')
param keyVaultName string

// Module --------

// ❓ Use static or var dynamic?
var allowedVirtualNetworks = keyVault.allowedSubnets
var ipRules = json(loadTextContent('../../Parameters/SharedParam/keyVaultIpAllowList.json'))

resource keyvault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    enabledForDeployment: keyVault.enabledForDeployment
    enabledForTemplateDeployment: keyVault.enabledForTemplateDeployment
    enabledForDiskEncryption: keyVault.enabledForDiskEncryption
    enableRbacAuthorization: keyVault.enableRbacAuthorization
    sku: {
      name: keyVault.sku
      family: 'A'
    }
    tenantId: tenantId
    accessPolicies: [
      {
        objectId: objectId
        tenantId: tenantId
        permissions: {
          keys: [
              'get'
              'list'
              'create'
              'import'
              'delete'
              'backup'
              'restore'
              'encrypt'
              'decrypt'
            ]
            secrets: [
              'get'
              'list'
              'set'
              'delete'
              'backup'
              'restore'
            ]
            certificates: [
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
    virtualNetworkRules: [ for vnet in allowedVirtualNetworks: {
      id: '${virtualNetworkId}/subnets/${vnet}-${env}-${locationShortName}'
      ignoreMissingVnetServiceEndpoint: false
    }]
  }
}
tags: tagValues
dependsOn: []
}

output keyVaultId string = keyvault.id
output keyVaultName string = keyvault.name


// ---------------------




