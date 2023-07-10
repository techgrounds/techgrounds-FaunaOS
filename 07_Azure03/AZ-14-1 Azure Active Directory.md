# [Onderwerp]
Azure Active Directory (Azure AD) is a cloud-based multi-tenant directory and identity service.


---

## Key-terms
[Schrijf hier een lijst met belangrijke termen met eventueel een korte uitleg.]

---

## Study
[]
### Waar is X voor?
Azure Active Directory is a service for managing user accounts privileges and access
### Hoe past X / vervangt X in een on-premises setting?
- Location
Installed and runs on your own servers within your organization's premises or data centers
- Control
You have full controll and responsibility for managing and maintaining the infrastructure hardware and software
- Functionality
You have all futures like : user authentication authorization and rescources acces control within your onpremises network
- Integration
It integrates with onpremises applications services and systems

When it comes to Azure AD on premises and Azure AD in the cloud there are some key differences
- Location
Cloud vs on-premises 
- Management
Microsoft vs self
- Scalabillity
Advantages of the cloud vs limitations of on-premises

### Hoe kan ik X combineren met andere diensten?
- Archetecture
![Local vs Cloud](../00_includes/AZ-13/azure-ad.png)

- Components
**Azure AD tenant.** An instance of Azure AD created by your organization. It acts as a directory service for cloud applications by storing objects copied from the on-premises Active Directory and provides identity services.

**Web tier subnet.** This subnet holds VMs that run a web application. Azure AD can act as an identity broker for this application.

**On-premises AD DS server.** An on-premises directory and identity service. The AD DS directory can be synchronized with Azure AD to enable it to authenticate on-premises users.

**Azure AD Connect sync server.** An on-premises computer that runs the Azure AD Connect sync service. This service synchronizes information held in the on-premises Active Directory to Azure AD. For example, if you provision or deprovision groups and users on-premises, these changes propagate to Azure AD.

- Applications
**Registering the application**

**Configuring authentication**

**Authorization and permissions**

**Integrating application code**

**User authentication and access**

**Secure application access**

### Wat is het verschil tussen X en andere gelijksoortige diensten?

---

## Opdracht

### Waar kan ik deze dienst vinden in de console?

### Hoe zet ik deze dienst aan?
1. Sign in to the Azure portal
2. Create a managed domain
3. Deploy the managed domain
4. Update DNS settings for the Azure virtual network
5. Enable user accounts for Azure AD DS
6. Link with apps and services you want to use Azure AD with.

### Hoe kan ik deze dienst koppelen aan andere resources?






### Gebruikte bronnen
On-Prem AD vs. Hybrid Azure AD Join vs. Azure AD: Key Differences  
https://www.spiceworks.com/tech/cloud/articles/legacy-ad-hybrid-ad-and-azure-ad-difference/

Azure AD Overview MS Learn  
https://learn.microsoft.com/en-us/azure/active-directory-domain-services/overview

Create and configure Azure AD  
https://learn.microsoft.com/en-us/azure/active-directory-domain-services/tutorial-create-instance

Steps to integrate your apps  
https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/five-steps-to-full-application-integration


### Videos
Adam Marczak
https://www.youtube.com/watch?v=Ma7VAQE7ga4

John Savill
https://www.youtube.com/watch?v=EUVKEhiHYG0

MS Learn
https://www.youtube.com/watch?v=T1Nd9APNceQ



### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]
