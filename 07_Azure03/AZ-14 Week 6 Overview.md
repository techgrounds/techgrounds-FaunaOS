# Overview

In the vast world of **Azure**, there were several essential services that played crucial roles in the world of azure cloud computing:

**Azure Active Directory (Azure AD)** acted as a reliable identity and access management service. Similar to a trusted gatekeeper, Azure AD verified the identities of users and authorized their access to applications and resources. It served as the central hub for user authentication and authorization within the Azure portal.

**Azure Monitor** was a comprehensive monitoring solution that ensured the smooth operation of Azure resources and applications. Like a diligent inspector, Azure Monitor collected and analyzed telemetry data to detect issues, provide insights, and enable proactive management. It offered real-time monitoring and powerful analytics to optimize performance and identify potential problems.

**Azure Cosmos DB** stood as a globally distributed database service, allowing seamless storage and retrieval of data. Much like a well-connected network, Azure Cosmos DB provided limitless scalability and low-latency access. It facilitated efficient data replication across multiple regions, making it ideal for globally accessible applications with high-performance requirements.

**Azure Functions** enabled serverless computing, allowing developers to run code without worrying about infrastructure management. Developers could focus on writing modular functions, which acted as building blocks for applications. These functions were triggered by events and could be easily scaled, much like assembling a puzzle using individual pieces.

**Event Grid**, **Queue Storage**, and **Service Bus** were messaging services that facilitated efficient communication between various components and systems.

**Event Grid** provided event-driven architecture, acting as a powerful notification system. It enabled seamless event routing and triggered actions based on events occurring in Azure or from custom sources. It served as an event backbone, allowing applications to react and respond to important events.

**Queue Storage** enabled reliable asynchronous communication by providing message queues. It facilitated decoupled interaction between different components of an application, ensuring smooth information flow and efficient processing.

**Service Bus** offered enterprise messaging capabilities. It provided reliable message queuing and publish-subscribe patterns. Applications could leverage Service Bus to ensure message delivery and enable scalable communication between different systems.

These services could be accessed and configured within the Azure portal, which served as a unified interface for managing Azure resources. Developers and administrators utilized the portal to create and configure these services, connecting them to other resources to build powerful applications and solutions.

In this technology-driven realm of Azure, developers and administrators harnessed the potential of these services to create innovative solutions, optimize performance, and enable seamless communication and collaboration. The world of Azure empowered users to build and scale applications with ease, unlocking the true capabilities of cloud computing.



## Key-terms

- **Azure Active Directory (Azure AD)**: A cloud-based identity and access management service for authenticating and authorizing applications and resources.
- **Azure Monitor**: A comprehensive monitoring solution that collects and analyzes telemetry data to gain insights and detect issues in Azure resources and applications.
- **Azure Cosmos DB**: A globally distributed, multi-model database service that offers scalability, low latency, and global data distribution.
- **Azure Functions**: A serverless compute service for running code without managing infrastructure, enabling event-driven and scalable applications.
- **Event Grid**: A fully managed event routing service that allows reacting to events happening in Azure or from custom events.
- **Queue Storage**: A reliable messaging service for asynchronous communication between components, facilitating scalable and decoupled applications.
- **Service Bus**: An enterprise messaging platform for reliable message queuing and publish-subscribe patterns.



## Opdracht


**Azure Active Directory:**

| Step | Concept | Learning Resources | Assignment |
|------|---------|--------------------|------------|
| 1    | Introduction to Azure Active Directory (Azure AD) | Azure AD is a cloud-based identity and access management service that provides authentication and authorization for applications and resources in Azure. It enables single sign-on, multi-factor authentication, and more. | - Microsoft Learn: [Introduction to Azure Active Directory](https://docs.microsoft.com/en-us/learn/modules/intro-to-azure-ad/) | Set up Azure AD and create a user account. Explore different authentication methods, such as password-based, MFA, or Azure AD B2B guest user. |
| 2    | Application and Service Principal Objects | Understand the concepts of application and service principal objects in Azure AD. They are used to authenticate and authorize applications and services to access resources in Azure. | - Microsoft Learn: [Use Azure Active Directory service principals & managed identities](https://learn.microsoft.com/en-us/azure/devops/integrate/get-started/authentication/service-principal-managed-identity?view=azure-devops) | Register an application in Azure AD and configure its permissions. Create a service principal and assign it appropriate roles and permissions. |
| 3    | Azure AD Authentication and Authorization | Learn about different authentication and authorization methods in Azure AD, such as OAuth, OpenID Connect, and role-based access control (RBAC). Understand how to secure access to Azure resources using Azure AD. | - Microsoft Learn: [Secure Azure resources with Azure Active Directory](https://docs.microsoft.com/en-us/learn/modules/secure-azure-resources-with-azure-ad/) | Configure RBAC roles for Azure resources and assign them to users or groups in Azure AD. Implement Azure AD-based authentication for an application or API. |

**Azure Monitor:**

| Step | Concept | Learning Resources | Assignment |
|------|---------|--------------------|------------|
| 1    | Introduction to Azure Monitor | Azure Monitor provides comprehensive monitoring solutions for Azure resources and applications. It collects and analyzes telemetry data, helps you understand system behavior, and detect and diagnose issues. | - Microsoft Learn: [Introduction to Azure Monitor](https://docs.microsoft.com/en-us/learn/modules/intro-to-azure-monitor/) | Enable Azure Monitor for a resource or application in Azure. Configure metrics and logs collection. Explore the Azure Monitor dashboard and view metrics and logs. |
| 2    | Alerts and Action Groups | Learn how to create alerts in Azure Monitor based on defined conditions. Configure action groups to define who should be notified and how when an alert is triggered. | - Microsoft Learn: [Alerts in Azure Monitor](https://learn.microsoft.com/en-us/training/modules/configure-azure-alerts/) | Create an alert rule for a specific metric or log condition. Configure an action group to send email notifications when the alert is triggered. Test the alert by triggering the condition. |
| 3    | Log Analytics and Application Insights | Explore Log Analytics and Application Insights, which are components of Azure Monitor. Learn how to collect and analyze logs and application telemetry data to gain insights and troubleshoot issues. | - Microsoft Learn: [Analyze your Azure infrastructure by using Azure Monitor logs](https://learn.microsoft.com/en-us/training/modules/analyze-infrastructure-with-azure-monitor-logs/) | Enable Log Analytics for a resource and configure log collection. Use Application Insights to instrument an application and view its telemetry data. |

**Cosmos DB:**

| Step | Concept | Learning Resources | Assignment |
|------|---------|--------------------|------------|
| 1    | Introduction to Azure Cosmos DB | Azure Cosmos DB is a globally distributed, multi-model database service that provides high scalability, low latency, and global data distribution. It supports various data models, such as key-value, document, graph, and column-family. | - Microsoft Learn: [Explore fundamentals of Azure Cosmos DB](https://learn.microsoft.com/en-us/training/modules/explore-non-relational-data-stores-azure/) | Create a Cosmos DB account in Azure. Choose a preferred data model and configure it. Create and query data using the Azure portal or the Cosmos DB SDK. |
| 2    | Partitioning and Scaling | Understand the partitioning and scaling concepts in Azure Cosmos DB. Learn how to choose the right partition key and configure the throughput and storage for your database. | - Microsoft Learn: [Partitioning and horizontal scaling in Azure Cosmos DB](https://learn.microsoft.com/en-us/azure/cosmos-db/partitioning-overview) | Design a partitioning strategy for a collection in Cosmos DB. Configure the partition key, throughput, and storage settings. Monitor the performance and scale the database if needed. |
| 3    | Global Distribution and Consistency | Explore the global distribution capabilities of Azure Cosmos DB and learn how to replicate data across multiple regions. Understand the consistency models available in Cosmos DB and their trade-offs. | - Microsoft Learn: [Distribute your data globally with Azure Cosmos DB](https://learn.microsoft.com/en-us/training/modules/global-distribution-and-consistency-azure-cosmos-db/) | Configure the global distribution settings for your Cosmos DB account. Create replicas in different regions and test data synchronization. Experiment with different consistency models and observe their behavior. |

**Azure Functions:**

| Step | Concept | Learning Resources | Assignment |
|------|---------|--------------------|------------|
| 1    | Introduction to Azure Functions | Azure Functions is a serverless compute service that allows you to run code in the cloud without provisioning or managing infrastructure. It enables you to build event-driven, scalable applications with various triggers and bindings. | - Microsoft Learn: [Introduction to Azure Functions](https://docs.microsoft.com/en-us/learn/modules/create-serverless-logic-with-azure-functions/) | Create an Azure Function app. Write a simple function triggered by an HTTP request and return a response. Test the function using the Azure portal or a REST client. |
| 2    | Function Triggers and Bindings | Learn about different triggers and bindings available in Azure Functions. Triggers initiate the execution of a function, and bindings provide input and output data for the function. | - Microsoft Learn: [Execute an Azure Function with triggers](https://learn.microsoft.com/en-us/training/modules/execute-azure-function-with-triggers/) | Create a function with various triggers, such as Blob Storage, Queue Storage, or Timer. Use bindings to read data from and write data to different Azure services. |
| 3    | Durable Functions | Durable Functions is an extension of Azure Functions that allows you to build stateful and long-running workflows. It enables you to orchestrate multiple functions and manage their execution. | - Microsoft Learn: [Create a long-running serverless workflow with Durable Functions](https://docs.microsoft.com/en-us/learn/modules/create-long-running-serverless-workflow-with-durable-functions/) | Create a Durable Function workflow that involves multiple functions and manages their execution order and state. Test the workflow using various triggers and explore the monitoring capabilities. |

**Event Grid:**

| Step | Concept | Learning Resources | Assignment |
|------|---------|--------------------|------------|
| 1    | Event Grid | Event Grid is a fully managed event routing service that enables event-driven architectures. It allows you to react to events happening in Azure or from your own custom events. | - Microsoft Learn: [Explore Azure Event Grid](https://learn.microsoft.com/en-us/training/modules/azure-event-grid/) | - Console Location: Azure portal, navigate to "Event Grid Topics" or "Event Grid Subscriptions" under the "Event Grid" category in the left-hand menu. <br>- Assignment: Create an Event Grid topic and subscription. Configure the topic to route events to a destination, such as a webhook or an Azure function. |
| 2    | Event Grid Trigger | Event Grid can trigger functions or logic apps when an event occurs. Learn how to create an Event Grid-triggered function and handle events in your code. | - Microsoft Learn: [Create serverless logic with Azure Functions](https://docs.microsoft.com/en-us/learn/modules/create-serverless-logic-with-azure-functions/) | - Console Location: Azure portal, navigate to your Function App > "Functions." Select a function and click on the "Integrate" tab to configure the Event Grid trigger. <br>- Assignment: Create an Azure Function with an Event Grid trigger. Handle events in your function and perform a desired action, such as logging or sending notifications. |


**Queue Storage:**

| Step | Concept | Learning Resources | Assignment |
|------|---------|--------------------|------------|
| 1    | Queue Storage | Queue Storage provides reliable messaging for asynchronous communication between components of a distributed application. It enables you to build scalable and decoupled applications by using message queues. | - Microsoft Learn: [Introduction to Azure Queue Storage](https://docs.microsoft.com/en-us/learn/modules/azure-queue-storage/) | - Console Location: Azure portal, navigate to "Storage accounts" under the "Storage" category in the left-hand menu. Create or select a storage account, and go to the "Queues" section. <br>- Assignment: Create a new queue in Azure Queue Storage. Send messages to the queue using the Azure portal or the Azure Storage Explorer. |
| 2    | Queue Storage Triggers | Learn how to create a function triggered by messages in an Azure Storage queue. Understand how the message content is passed to the function and how to process it. | - Microsoft Learn: [Create serverless logic with Azure Functions](https://docs.microsoft.com/en-us/learn/modules/create-serverless-logic-with-azure-functions/) | - Console Location: Azure portal, navigate to your Function App > "Functions." Select a function and click on the "Integrate" tab to configure the queue trigger. <br>- Assignment: Create an Azure Function triggered by new messages in the Azure Storage queue. Retrieve and process the messages within the function code. |
| 3    | Queue Storage and Web Application | Learn how to integrate Azure Queue Storage with a web application to enable asynchronous processing and improve scalability. Understand how to enqueue and dequeue messages from a web application. | - Microsoft Learn: [Store and retrieve messages using Azure Queue Storage and .NET](https://docs.microsoft.com/en-us/learn/modules/store-messages-queue-storage-dotnet/) | - Console Location: Azure portal, navigate to your storage account > "Access keys" to get the connection string for your queue storage. <br>- Assignment: Create a simple web application (e.g., ASP.NET) that enqueues messages into Azure Queue Storage. Implement a separate worker process or an Azure Function that dequeues and processes the messages asynchronously. |

**Service Bus:**

| Step | Concept | Learning Resources | Assignment |
|------|---------|--------------------|------------|
| 1    | Service Bus | Service Bus is a fully managed enterprise messaging platform that provides reliable message queuing and publish-subscribe capabilities. It enables decoupling and scaling of applications. | - Microsoft Learn: [Introduction to Azure Service Bus](https://docs.microsoft.com/en-us/learn/modules/azure-service-bus/) | - Console Location: Azure portal, navigate to "Service Bus" under the "Messaging" category in the left-hand menu. <br>- Assignment: Create a new Service Bus namespace. Familiarize yourself with the different components, such as queues, topics, and subscriptions. |
| 2    | Service Bus Queues | Learn how to create and use Service Bus queues to send and receive messages. Understand the different features, such as dead-lettering and duplicate detection. | - Microsoft Learn: [Work with queues and topics in Azure Service Bus](https://docs.microsoft.com/en-us/learn/modules/work-with-queues-topics-service-bus/) | - Console Location: Azure portal, navigate to your Service Bus namespace > "Queues" to create and manage queues. <br>- Assignment: Create a new Service Bus queue. Send messages to the queue using the portal or the Service Bus SDK. Write a receiver application that receives and processes the messages from the queue. |
| 3    | Service Bus Topics and Subscriptions | Explore Service Bus topics and subscriptions, which enable publish-subscribe messaging patterns. Learn how to create and use topics and subscriptions for message filtering and fan-out scenarios. | - Microsoft Learn: [Work with queues and topics in Azure Service Bus](https://docs.microsoft.com/en-us/learn/modules/work-with-queues-topics-service-bus/) | - Console Location: Azure portal, navigate to your Service Bus namespace > "Topics" to create and manage topics. <br>- Assignment: Create a new Service Bus topic and multiple subscriptions. Publish messages to the topic with different message properties and use subscription filters to receive specific messages. Implement receivers for the subscriptions that handle the incoming messages. |


### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]
