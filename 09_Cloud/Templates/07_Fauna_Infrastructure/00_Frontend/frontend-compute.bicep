// --- Parameters ----------------
param vmSize string
param vmImage string
param components array

// --- Variables ----------------
var vmName = 'vm-${components[1]}-${environmentName}'

// --- Virtual Machine ----------------
resource virtualMachine 'Microsoft.Compute/virtualMachines@2023-07-01' = {
  name: vmName
  location: location
  // ... other configurations
}
