# Learn
## Load balancer 
With Azure Load Balancer, you can scale your applications and create highly available services. Load balancer supports both inbound and outbound scenarios. Load balancer provides low latency and high throughput, and scales up to millions of flows for all TCP and UDP applications.

https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-overview  

---

# Microsoft learn

### Key Terms
- IaaS  
Infrastructure as a service
- PaaS  
Platform as a service
- Saas  
Software as a service

- OpEx
operating expense

- Vertical scaling
Scaling up

- Horizontal scaling
Scaling out

- satisfy service-level agreements (SLAs)

- Recovery point objective (RPO)

- Recovery time objective (RTO)

- Defense in depth
    - Data
    - Applications
    - VM/compute
    - Networking
    - Perimeter
    - Policies and access
    - Physical security


---

# Cosmo DB

SQL Databases:
- Relational databases that store data in structured tables with predefined schemas.
- Ideal for structured data with complex relationships and transactions.
- ACID-compliant (Atomicity, Consistency, Isolation, Durability).
- Provide strong data consistency, integrity, and support for complex queries.
- Examples in Azure: Azure SQL Database, Azure SQL Managed Instance.

Hybrid Databases:
- Combine elements of both SQL and NoSQL databases.
- Enable integration of on-premises and cloud databases for hybrid scenarios.
- Support for structured and semi-structured data.
- Provide scalability, flexibility, and data synchronization between environments.
- Examples in Azure: Azure Cosmos DB, Azure Synapse Link for Azure Cosmos DB.

NoSQL Databases:
- Non-relational databases that store and retrieve unstructured or semi-structured data.
- Designed for high scalability, flexibility, and performance.
- Support for dynamic schemas and horizontal scaling.
- Different types include key-value, document, columnar, and graph databases.
- Examples in Azure: Azure Cosmos DB, Azure Table Storage, Azure Blob Storage.


**Vertical Scaling:**
- Vertical scaling, also known as scaling up, involves increasing the capacity of a single server or resource to handle more workload.
- It usually involves upgrading the hardware components, such as CPU, memory, or storage, of an existing server to enhance its performance.
- Vertical scaling is useful when a single server needs to handle increased demand, but it may have limits depending on the hardware's scalability.

**Horizontal Scaling:**
- Horizontal scaling, also known as scaling out, involves adding more servers or resources to distribute the workload across multiple machines.
- It allows for handling increased traffic and improving system performance by dividing the workload among multiple servers.
- Horizontal scaling is commonly used in cloud environments where new instances can be easily added or removed based on demand.

**Satisfy Service-Level Agreements (SLAs):**
- Service-Level Agreements (SLAs) are contracts that define the level of service a provider will deliver to its customers.
- Satisfying SLAs means meeting the agreed-upon performance, availability, and reliability metrics outlined in the contract.
- Providers strive to ensure their services meet or exceed the SLAs to maintain customer satisfaction and meet contractual obligations.

**Recovery Point Objective (RPO):**
- RPO refers to the maximum tolerable period in which data may be lost due to a disruption, such as a system failure or a disaster.
- It defines the point in time to which systems and data must be restored after an outage.
- The RPO value is typically expressed in terms of time (e.g., one hour, one day) and helps determine backup and recovery strategies.

**Recovery Time Objective (RTO):**
- RTO refers to the targeted duration within which a business process or service must be restored after a disruption.
- It defines the amount of time it takes to recover a system or service and make it operational again.
- RTO is typically measured from the moment the disruption occurs until the system or service is fully restored and functional.

**Defense in Depth:**
- Defense in Depth is a security strategy that involves implementing multiple layers of security measures to protect systems and data.
- It recognizes that no single security measure can provide complete protection, so multiple layers work together to provide a more robust defense.
- The various layers of defense in depth may include:
  - Data: Encryption, access controls, and data backups.
  - Applications: Secure coding practices, vulnerability testing, and regular updates.
  - VM/Compute: Secure configuration, access controls, and regular patching.
  - Networking: Firewalls, network segmentation, and intrusion detection systems.
  - Perimeter: Network gateways, intrusion prevention systems, and access controls.
  - Policies and Access: Authentication, authorization, and user management.
  - Physical Security: Controlled access, surveillance, and environmental controls.

