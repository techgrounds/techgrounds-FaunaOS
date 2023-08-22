### Questions for determining the project strategy
--
# Main Project Goal: Cloud Transition  

## Product/Service: Application

### Criteria: 
- IaC (Infrastructure as code)
- Azure(Bicep)

- De webserver moet dagelijks gebackupt worden. De backups moeten 7 dagen behouden worden.  
- De webserver moet op een geautomatiseerde manier geïnstalleerd worden.
- De admin/management server moet bereikbaar zijn met een publiek IP.
- De admin/management server moet alleen bereikbaar zijn van vertrouwde locaties (office/admin’s thuis)
- De volgende IP ranges worden gebruikt: 10.10.10.0/24 & 10.20.20.0/24
  - Alle subnets moeten beschermd worden door een firewall op subnet niveau.
  - SSH of RDP verbindingen met de webserver mogen alleen tot stand komen vanuit de admin server.

--
# Start-up Questions.

1. ## **Scope and Goals:**

**Briefing Details:**
~~~
-   
~~~


**Default Questions:** 

- What are the main objectives of migrating to the cloud?
- Which specific workloads or applications are being migrated?
- Are there any constraints or limitations on the migration process?

**Team Questions:**  

**Solution Details:**
~~~
-   
~~~


2. ## **Azure Environment Configuration and Optimisation.**

**Briefing Details:**
~~~
-  Azure -> Bicep 
~~~


**Default Questions:** 

- Which Azure services and features are best suited to meet our project's requirements for scalability, performance, and integration within the Azure ecosystem?
- What considerations should guide our decisions when configuring and optimising our Azure environment?
- How can factors like pricing, available services, and geographic presence within Azure influence our choices to ensure efficient resource usage and effective performance?

**Team Questions:**  

-> Powershell or Azure CLI?

-> Wat is de locatie van de resources en is de prijs belangrijk.

**Solution Details:**
~~~
- !: Servers staan in de bijlage in verschillende availabilities zones.  
~~~


3. ## **Architecture and Design:**

**Briefing Details:**
~~~
- Wees niet bang om verbeteringen in de architectuur voor te stellen of te implementeren, maar maak wel harde keuzes, zodat je de deadline kan halen.  
~~~

~~~
- De webserver moet op een geautomatiseerde manier geïnstalleerd worden. 
~~~

**Default Questions:** 

- How will the existing on-premises architecture be adapted for cloud deployment?
- What changes are required to ensure scalability, availability, and performance in the cloud?

**Team Questions:**

→ Is dit one-time

→ of is dit bij iedere deployment van de VMs

→ moeten de server windows of linux zijn en specs?

**Solution Details:**
~~~
- 
~~~


4. ## **Data Migration:**

**Briefing Details:**
~~~
- 
~~~


**Default Questions:** 

- How will data be migrated from on-premises to the cloud (e.g., bulk migration, incremental sync)?
- What considerations are there for data security and compliance during migration?

**Team Questions:**  

-> Wat voor type storage account → blob of een van de andere.

-> Is opslag critical of non-critical; dus in hoeverre is data replicatie een vereiste?

-> Hoe vaak wordt de data in de opslag gebruikt? Frequent of niet frequent. (ivm hot of cool tier)

-> Moet de opslag publiekelijk bereikbaar zijn vanaf het internet, of is deze puur voor intern gebruik?

**Solution Details:**
~~~
- 
~~~


5. ## **Networking and Connectivity:**

**Briefing Details:**
~~~
- De admin/management server moet bereikbaar zijn met een publiek IP.
~~~

~~~
- De volgende IP ranges worden gebruikt: 10.10.10.0/24 & 10.20.20.0/24
~~~

**Default Questions:** 

- How will the cloud environment connect with on-premises systems?
- What networking configurations are necessary to ensure smooth communication between on-premises and cloud resources?

**Team Questions:**  

→ DNS

→ Basic SKUs dynamic of static ip adress ?

→ Krijgen we een lijst met vertrouwde locaties, of moeten we alleen rekening met onszelf houden

-> zijn er meerdere storage accounts nodig?

-> Apart Vnet of moet dit gezamenlijk? er moeten 2 subnets gebruikt worden dus we verwachten dat de op verschillende moeten komen. Er staan 2 subnet IP ranges.

**Solution Details:**
~~~
- 
~~~


6. ## **Security and Compliance:**

**Briefing Details:**
~~~
- Alle VM disks moeten encrypted zijn  
~~~

~~~
- De admin/management server moet alleen bereikbaar zijn van vertrouwde locaties (office/admin’s thuis)
~~~

~~~
- Alle subnets moeten beschermd worden door een firewall op subnet niveau.
~~~

~~~
- SSH of RDP verbindingen met de webserver mogen alleen tot stand komen vanuit de admin server.
~~~

**Default Questions:** 

- How will security be maintained in the cloud environment (e.g., identity and access management, encryption)?
- What compliance requirements must be met, and how will they be addressed in the cloud?

**Team Questions:**  

→ Wat voor type encryptie

→ Wat zijn de specificaties van de VM’s zoals vCPU, RAM, disk grootte?

→ gaat dit om onze eigen vertrouwde locations of krijgen we een lijst.

→ word er on premiss ingelogd of via een verbinding buitenaf?

→ defineer beschermed welke criteria moet het aan voldoen.

→ Admin server moeten we die zelf opzetten en is dat dan linux of windows?

**Solution Details:**
~~~
- 
~~~


7. ## **Resource Scaling:**

**Briefing Details:**
~~~
- 
~~~


**Default Questions:** 

- How will the cloud environment handle variable workloads and scale resources up or down as needed?
- What auto-scaling strategies will be employed?

**Team Questions:**  

**Solution Details:**
~~~
- 
~~~


8. ## **Monitoring and Management:**

**Briefing Details:**
~~~
- 
~~~


**Default Questions:** 

- What tools and practices will be used for monitoring the cloud resources and applications?
- How will issues be detected, alerted, and resolved?

**Team Questions:**  

-> Moet er monitoring of alerting ingesteld worden? zo ja, welke metrics moeten worden gemonitord?

**Solution Details:**
~~~
- 
~~~


9. ## **Backup and Disaster Recovery:**

**Briefing Details:**
~~~
- De webserver moet dagelijks gebackupt worden. De backups moeten 7 dagen behouden worden. 
~~~


**Default Questions:** 

- What backup and disaster recovery mechanisms will be put in place for cloud-based resources?
- How will data integrity and business continuity be ensured?

**Team Questions:**  

→ Moeten dit snapshots zijn via de Azure back-up policy, of via het OS?

→ is het 7 backups en dan de eerste deleten.

→ Moet er een wekelijkse backup komen?

→  Specifieke tijden?

→ Waar moeten we een backup van maken, alleen de VM van de webserver of ook de database?

**Solution Details:**
~~~
- 
~~~


10. ## **Cost Management:**

**Briefing Details:**
~~~
- De webserver moet op een geautomatiseerde manier geïnstalleerd worden.  
~~~


- How will the cloud migration impact costs (e.g., initial migration costs, ongoing operational costs)?
- What strategies will be employed to optimize costs?

**Team Questions:**  

-> Wat zijn de budgetten voor tijdens het gebruik van de omgeving?

**Solution Details:**
~~~
- 
~~~


11. ## **Service Integration:**

**Briefing Details:**
~~~
- 
~~~


**Solution Details:**
~~~
- 
~~~


**Default Questions:** 

- Are there any third-party services that need to be integrated into the cloud environment?
- How will APIs and integrations be managed?

**Team Questions:**  

**Solution Details:**
~~~
- 
~~~


12. ## **Application Refactoring:**

**Briefing Details:**
~~~
- 
~~~


**Default Questions:** 

- Do any applications require refactoring to take full advantage of cloud-native features?
- How will legacy applications be modernized for the cloud?

**Team Questions:**


**Solution Details:**
~~~
- 
~~~


13. ## **Testing and Validation:**

**Briefing Details:**
~~~
- 
~~~


**Default Questions:** 

- What testing strategies will be used to ensure the functionality and performance of migrated applications?
- How will testing environments in the cloud be set up?

**Team Questions:**  

**Solution Details:**
~~~
- 
~~~


14. ## **User Experience:**

**Briefing Details:**
~~~
- 
~~~


**Default Questions:** 

- How will end-users be impacted by the migration, and how will their experience be maintained or improved?

**Team Questions:**  

**Solution Details:**
~~~
- 
~~~


15. ## **Training and Knowledge Transfer:**

**Briefing Details:**
~~~
- 
~~~


**Default Questions:** 

- How will the team be trained to manage and operate the cloud environment?
- What documentation and resources will be provided?

**Team Questions:**  

**Solution Details:**
~~~
- 
~~~


16. ## **Timeline and Phases:**

**Briefing Details:**
~~~
- 
~~~


**Default Questions:** 

- What is the expected timeline for the migration process?
- Will the migration be performed in phases, and if so, how will they be defined?

**Team Questions:**  

-> Volledige overgang naar cloud of hybride model?

**Solution Details:**
~~~
- 
~~~


17. ## **Rollback and Contingency Planning:**

**Briefing Details:**
~~~
- 
~~~


**Default Questions:** 

- What are the contingency plans in case the migration encounters issues or fails?
- How easily can the migration be rolled back if necessary?

**Team Questions:**  

**Solution Details:**
~~~
- 
~~~


18. ## **Product Owner/Client Communication:**

**Briefing Details:**
~~~
- 
~~~


**Default Questions:** 

- How will Client/Product Owner be kept informed about the progress and impact of the migration?
- What communication channels will be established?

**Team Questions:**  

-> Hebben we maar 1 gesprek of kunnen we er meerdere doen.

**Solution Details:**
~~~
- 1 gesprek maar wel mogelijkheid om vragen te stellen tijdens scrum master meeting.
~~~

19. ## **Post-Migration Optimisation:**

**Briefing Details:**
~~~
- 
~~~


**Default Questions:** 

- What strategies will be used to optimise the performance and cost-effectiveness of the cloud environment after migration?

**Team Questions:**  

-> Wat is het budget Post-Migration voor het draaien van de cloud environment?

**Solution Details:**
~~~
- 
~~~


20. ## **Lessons Learned and Continuous Improvement:**

**Briefing Details:**
~~~
- 
~~~

**Default Questions:** 

- How will the project team gather lessons learned and feedback to improve future cloud projects?

**Team Questions:**  

**Solution Details:**
~~~
- We will document in a the following: 
  - daily log
  - Design Document
  - Decision Document
- We will end with a presentation of the project
~~~

---
# After Briefing & Product Owner Questions
---
