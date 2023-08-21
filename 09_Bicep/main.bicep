resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'faunabiceptestsa'
  sku:{
      name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  location: 'West Europe'
}
