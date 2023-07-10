# [Onderwerp]
Vanaf dit moment zullen wij, als learning coaches, jullie minder opdrachten geven. We zullen meer beroep doen op je zelfstandig leervaardigheden. Geen zorgen, je bent niet alleen. Je hebt elkaar en de vaste dagelijkse structuur blijft bestaan waarin je ons nog altijd de oren van ons hoofd kan vragen.

Onderwerpen die je onder de kop “Bestudeer” vindt verwachten wij dat je alleen op een theoretisch niveau hoeft te kennen. Van onderwerpen onder de kop “Opdrachten” moet je ook praktische ervaring opbouwen.


---

## Key-terms
[Schrijf hier een lijst met belangrijke termen met eventueel een korte uitleg.]

---

## Study
[]
### Waar is X voor?
### Hoe past X / vervangt X in een on-premises setting?
### Hoe kan ik X combineren met andere diensten?
### Wat is het verschil tussen X en andere gelijksoortige diensten?

---

## Een handige lijst van taken die je praktisch moet kunnen:
### Waar kan ik deze dienst vinden in de console?
### Hoe zet ik deze dienst aan?
### Hoe kan ik deze dienst koppelen aan andere resources?

---

## Opdracht


**Event Grid:**

| Step | Concept | Learning Resources | Assignment |
|------|---------|--------------------|------------|
| 1    | Event Grid | Event Grid is a fully managed event routing service that enables event-driven architectures. It allows you to react to events happening in Azure or from your own custom events. | - Microsoft Learn: [Explore Azure Event Grid](https://learn.microsoft.com/en-us/training/modules/azure-event-grid/) | - Console Location: Azure portal, navigate to "Event Grid Topics" or "Event Grid Subscriptions" under the "Event Grid" category in the left-hand menu. <br>- Assignment: Create an Event Grid topic and subscription. Configure the topic to route events to a destination, such as a webhook or an Azure function. |
| 2    | Event Grid Trigger | Event Grid can trigger functions or logic apps when an event occurs. Learn how to create an Event Grid-triggered function and handle events in your code. | - Microsoft Learn: [Create serverless logic with Azure Functions](https://docs.microsoft.com/en-us/learn/modules/create-serverless-logic-with-azure-functions/) | - Console Location: Azure portal, navigate to your Function App > "Functions." Select a function and click on the "Integrate" tab to configure the Event Grid trigger. <br>- Assignment: Create an Azure Function with an Event Grid trigger. Handle events in your function and perform a desired action, such as logging or sending notifications. |


**Queue Storage:**

| Step | Concept | Learning Resources | Assignment |
|------|---------|--------------------|------------|
| 1    | Queue Storage | Queue Storage provides reliable messaging for asynchronous communication between components of a distributed application. It enables you to build scalable and decoupled applications by using message queues. | - Microsoft Learn: [What is Azure Queue Storage?](https://learn.microsoft.com/en-us/azure/storage/queues/storage-queues-introduction) | - Console Location: Azure portal, navigate to "Storage accounts" under the "Storage" category in the left-hand menu. Create or select a storage account, and go to the "Queues" section. <br>- Assignment: Create a new queue in Azure Queue Storage. Send messages to the queue using the Azure portal or the Azure Storage Explorer. |
| 2    | Queue Storage and Web Application | Create a simple application and add configuration, client library references, and code to connect it to Azure Storage. | - Microsoft Learn: [Connect an app to Azure Storage](https://learn.microsoft.com/en-us/training/modules/connect-an-app-to-azure-storage/) | - Console Location: Azure portal, navigate to your storage account > "Access keys" to get the connection string for your queue storage. <br>- Assignment: Create a simple web application (e.g., ASP.NET) that enqueues messages into Azure Queue Storage. Implement a separate worker process or an Azure Function that dequeues and processes the messages asynchronously. |
| 3    | Queue Storage Triggers | Learn how to create a function triggered by messages in an Azure Storage queue. Understand how the message content is passed to the function and how to process it. | - Microsoft Learn: [Communicate between applications with Azure Queue storage](https://learn.microsoft.com/en-us/training/modules/communicate-between-apps-with-azure-queue-storage/?source=recommendations) | - Console Location: Azure portal, navigate to your Function App > "Functions." Select a function and click on the "Integrate" tab to configure the queue trigger. <br>- Assignment: Create an Azure Function triggered by new messages in the Azure Storage queue. Retrieve and process the messages within the function code. |

**Service Bus:**

| Step | Concept | Learning Resources | Assignment |
|------|---------|--------------------|------------|
| 1    | Service Bus | Service Bus is a fully managed enterprise messaging platform that provides reliable message queuing and publish-subscribe capabilities. It enables decoupling and scaling of applications. | - Microsoft Learn: [What is Azure Service Bus?](https://learn.microsoft.com/en-us/azure/service-bus-messaging/service-bus-messaging-overview) | - Console Location: Azure portal, navigate to "Service Bus" under the "Messaging" category in the left-hand menu. <br>- Assignment: Create a new Service Bus namespace. Familiarize yourself with the different components, such as queues, topics, and subscriptions. |
| 2    | Service Bus Queues | Learn how to create and use Service Bus queues to send and receive messages. Understand the different features, such as dead-lettering and duplicate detection. | - Microsoft Learn: [Work with queues and topics in Azure Service Bus](https://docs.microsoft.com/en-us/learn/modules/work-with-queues-topics-service-bus/) | - Console Location: Azure portal, navigate to your Service Bus namespace > "Queues" to create and manage queues. <br>- Assignment: Create a new Service Bus queue. Send messages to the queue using the portal or the Service Bus SDK. Write a receiver application that receives and processes the messages from the queue. |
| 3    | Service Bus Topics and Subscriptions | Explore Service Bus topics and subscriptions, which enable publish-subscribe messaging patterns. Learn how to create and use topics and subscriptions for message filtering and fan-out scenarios. | - Microsoft Learn: [Work with queues and topics in Azure Service Bus](https://docs.microsoft.com/en-us/learn/modules/work-with-queues-topics-service-bus/) | - Console Location: Azure portal, navigate to your Service Bus namespace > "Topics" to create and manage topics. <br>- Assignment: Create a new Service Bus topic and multiple subscriptions. Publish messages to the topic with different message properties and use subscription filters to receive specific messages. Implement receivers for the subscriptions that handle the incoming messages. |


### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]
