# Azure & AWS General Study Notes

## Keyterms

1. **IaaS (Infrastructure as a Service):** A cloud computing model that provides virtualized computing resources, such as virtual machines, storage, and networking infrastructure.

2. **PaaS (Platform as a Service):** A cloud computing model that provides a platform and environment for developers to build, deploy, and manage applications without worrying about underlying infrastructure.

3. **SaaS (Software as a Service):** A cloud computing model where software applications are delivered over the internet as a service, eliminating the need for local installation and maintenance.

4. **Virtual Machine (VM):** A virtualized instance of a computer system that can run applications and perform tasks similar to physical computers.

5. **Load Balancer:** A device or service that distributes incoming network traffic across multiple servers or resources to optimize resource utilization, enhance performance, and ensure high availability.

6. **CDN (Content Delivery Network):** A globally distributed network of servers that delivers web content to users based on their geographic location, reducing latency and improving the performance of web applications.

7. **Scalability:** The ability of a system or application to handle increased workload by adding or removing resources dynamically as needed.

8. **Elasticity:** The capability of a system or application to automatically scale resources up or down based on workload demands.

9. **High Availability:** A characteristic of a system or application that ensures it remains accessible and operational even in the event of component failures or disruptions.

10. **Disaster Recovery:** The process of planning and implementing strategies to restore and recover IT systems and data in the event of a major disruption or disaster.

11. **Backup and Recovery:** The process of creating copies of data or applications to protect against data loss or system failures. It involves periodically creating backups and having a recovery plan in place to restore data or systems in the event of a failure.

12. **IAM (Identity and Access Management):** A framework of policies, technologies, and processes that manage and control user access to resources in a cloud environment. It involves authentication, authorization, and permissions management.

13. **API (Application Programming Interface):** A set of rules and protocols that allows different software applications to communicate and interact with each other. Cloud providers often expose APIs for users to manage and interact with their services programmatically.

14. **Serverless Computing:** A cloud computing model where developers can build and run applications without having to manage underlying infrastructure. The cloud provider takes care of resource provisioning, scaling, and management, and users only pay for actual usage.

15. **Data Encryption:** The process of transforming data into a format that is unreadable without the appropriate decryption key. Encryption ensures data confidentiality and protection against unauthorized access.

16. **Data Lake:** A centralized repository that stores structured and unstructured data at any scale. It allows for storing and analyzing diverse data types and enables data exploration and analytics.

17. **CI/CD (Continuous Integration/Continuous Deployment):** A software development practice that involves automatically building, testing, and deploying applications to production environments. It enables frequent and reliable software releases.

18. **Containers:** Lightweight, portable, and isolated environments that encapsulate software applications and their dependencies, making it easier to deploy and run applications consistently across different environments.

19. **DevOps:** A set of practices that combine software development (Dev) and IT operations (Ops) to enable faster, more reliable software delivery and deployment through automation and collaboration.

20. **Microservices:** A software architectural approach where applications are divided into smaller, independent services that can be developed, deployed, and scaled separately.

21. **Hybrid Cloud:** A computing environment that combines both public cloud services and private infrastructure, allowing organizations to leverage the benefits of both while maintaining control over sensitive data.

22. **Multi-Cloud:** The practice of using multiple cloud service providers to distribute workloads and reduce dependence on a single provider, increasing flexibility and mitigating vendor lock-in.

23. **Serverless Functions:** Small, event-driven code functions that are executed in response to specific triggers or events. They allow developers to focus on writing code without managing the underlying infrastructure.

24. **Auto Scaling:** A feature that automatically adjusts the number of resources (e.g., VMs) based on predefined rules and thresholds to handle varying workloads efficiently.

25. **Virtual Network (VNet):** A virtualized network infrastructure in the cloud that securely connects and isolates cloud resources. It allows organizations to define their IP address ranges, subnets, and network security policies.



## Advantages of the Cloud:
1. Scalability: Cloud services like Azure and AWS enable easy scaling of resources to meet fluctuating demands.
2. Cost Efficiency: Cloud services follow a consumption-based model, where you only pay for the resources you use, reducing upfront investments.
3. High Availability: Cloud providers offer robust infrastructure with data redundancy and multiple availability zones, ensuring high uptime.
4. Disaster Recovery: Built-in features like data replication and automated backups facilitate rapid recovery and data protection.
5. Global Reach: Cloud services allow deploying applications in multiple regions worldwide, expanding audience reach and reducing latency.
6. Security and Compliance: Cloud providers invest in robust security measures, encryption options, and compliance certifications to protect customer data.

## Consumption-based Model:
- It is a pay-as-you-go pricing model where you only pay for the resources and services you consume.
- Cloud services like Azure and AWS enable provisioning and utilization of resources as needed, providing cost flexibility.
- Resources can be scaled up or down dynamically, aligning costs with actual usage and optimizing resource allocation.

## Shared Responsibility Model:
- It defines the division of responsibilities between cloud service providers and customers regarding security and management.
- Cloud providers are responsible for securing the underlying infrastructure, physical security, network infrastructure, and host operating systems.
- Customers are responsible for securing their applications, data, operating systems, and network configurations deployed on the cloud platform.
- Cloud providers offer security services, but it's the customer's responsibility to properly configure and utilize them to secure their specific applications and data.

## Firewalls:
- Firewalls act as a barrier between cloud resources and external networks, controlling network traffic based on predefined rules.
- Azure Firewall (Azure) and AWS Firewall Manager (AWS) provide network security services, enabling the definition of rules and monitoring of traffic.
- Firewalls enhance network security, control access to resources, and protect against unauthorized access or malicious activities.

## Virtual Network:
- A virtual network (VNet) is a software-defined network infrastructure in the cloud that securely connects and isolates cloud resources.
- Azure VNets (Azure) and Amazon VPC (AWS) provide logically isolated private network environments.
- VNets allow defining IP address ranges, subnets, and security groups for controlling network traffic and implementing security policies.
- VPN gateways enable secure connections between on-premises networks and the cloud.

## Disk Storage:
- Azure offers Azure Managed Disks for durable block-level storage and Azure Blob Storage for storing unstructured data.
- AWS provides Amazon Elastic Block Store (EBS) for persistent block storage volumes and Amazon S3 for scalable object storage.
- Different storage options cater to various performance, scalability, and cost requirements.
- Additional storage services like Azure Files, AWS EFS, Azure NetApp Files, and AWS Storage Gateway are available for specific use cases.

## Cost Management:
- Cloud services provide cost management tools and features to help optimize spending.
- Azure Cost Management and Billing (Azure) and AWS Cost Explorer (AWS) allow tracking, analyzing, and forecasting cloud costs.
- Budgets, alerts, and recommendations help monitor and control spending, ensuring cost efficiency.

## Core Services:
- Cloud providers offer a wide range of core services for various computing needs.
- Azure core services include Azure App Service, Azure Functions, Azure SQL Database, and Azure Cosmos DB, among others.
- AWS core services include Amazon EC2, AWS Lambda, Amazon RDS, and Amazon S3, among others.
- Core services provide foundational capabilities for building and running applications and managing data in the cloud.

## Storage Account:
- A storage account is a logical container in Azure that holds data objects like blobs, files, tables, and queues.
- It provides a unique namespace in Azure for accessing and managing data storage services.
- Storage accounts offer different types, such as Blob storage, File storage, Table storage, and Queue storage, each optimized for specific data storage scenarios.

## Virtual Machines (VMs):
- VMs are virtualized instances of computer systems that can run applications and perform tasks similar to physical computers.
- Azure Virtual Machines (Azure) and Amazon EC2 (AWS) provide scalable and customizable VMs in the cloud.
- VMs allow running various operating systems and applications, providing flexibility and control over computing resources.
