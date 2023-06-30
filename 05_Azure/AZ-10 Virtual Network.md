# [Onderwerp]
[Geef een korte beschrijving van het onderwerp]

## Key-terms
[Schrijf hier een lijst met belangrijke termen met eventueel een korte uitleg.]

## Opdracht
### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]



OS Disk vs Data Disk:

1. OS Disk:
   - An OS disk is a special type of disk used to store the operating system of a virtual machine (VM).
   - It is created automatically when you provision a VM and is typically attached as the boot disk.
   - The OS disk contains the OS files, system binaries, and other necessary components for the VM to run.
   - It is crucial for the VM's functionality and cannot be removed or detached from the VM.

2. Data Disk:
   - A data disk is a disk attached to a VM that is used for storing data, applications, and other files.
   - Data disks can be added or removed from a VM as needed, providing flexibility in storage management.
   - Multiple data disks can be attached to a VM, allowing for increased storage capacity and performance.
   - Data disks can be formatted and partitioned based on specific requirements, and they are commonly used for databases, file storage, or any data-intensive workloads.

Managed Disk vs Unmanaged Disk:

1. Managed Disk:
   - Managed disks are an Azure service that simplifies disk management for Azure VMs.
   - With managed disks, Azure handles the storage provisioning, replication, and availability.
   - Managed disks offer features like automatic storage scaling, snapshots, and disk encryption.
   - They provide built-in high availability and resiliency, with data replicated across multiple storage clusters.
   - Managed disks are the recommended option for most scenarios due to their ease of use and reliability.

2. Unmanaged Disk:
   - Unmanaged disks are the traditional method of managing disks in Azure VMs.
   - With unmanaged disks, you are responsible for manually managing the underlying storage accounts.
   - Unmanaged disks offer more control over the storage configuration, including the ability to choose storage account types and manually manage replication.
   - However, they require additional manual steps for managing storage accounts and do not provide the same level of built-in resiliency and management features as managed disks.

In summary, OS disks store the operating system of a VM, while data disks are used for storing data and applications. Managed disks simplify disk management, offering built-in resiliency and management features, while unmanaged disks provide more control but require additional manual management steps. Managed disks are the recommended choice for most scenarios, providing ease of use and reliable disk management for Azure VMs.