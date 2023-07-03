# [Azure Load Balancer (ALB) & Auto Scaling]
Een van de grootste voordelen van de cloud is dat je niet hoeft te gokken hoeveel capaciteit je nodig hebt. Je kan altijd up en down schalen met on-demand services. Een van de services die dit mogelijk maakt heet Autoscaling.


## Key-terms
Autoscaling

# Opdracht
## Opdracht 1:
- Maak een Virtual Machine Scale Set met de volgende vereisten:
    - Ubuntu Server 20.04 LTS - Gen1
        - Size: Standard_B1ls
        - Allowed inbound ports:
            - SSH (22)
            - HTTP (80)
        - OS Disk type: Standard SSD
    - Networking: defaults
    - Boot diagnostics zijn niet nodig
    - Custom data:
~~~
#!/bin/bash
sudo su
apt update
apt install apache2 -y
ufw allow 'Apache'
systemctl enable apache2
systemctl restart apache2
~~~

- Initial Instance Count: 2
- Scaling Policy: Custom
        - Aantal VMs: minimaal 1 en maximaal 4
- Voeg een VM toe bij 75% CPU gebruik
- Verwijder een VM bij 30% CPU gebruik

---
### Notes(1) 
- Om te beginnen met deze opdracht gaan we opzoeken wat een virtual machine scla eset is en hoe we deze kunnen opstarten.
- Ik heb hiervoor de volgende stappen gevonden.
### STEPS  
---

1. In the Azure portal search bar, search for and select Virtual Machine Scale Sets.
2. Select Create on the Virtual Machine Scale Sets page.
3. In the Basics tab, under Project details, make sure the correct subscription is selected and create a new resource group called myVMSSResourceGroup.
4. In Region, select a region that is close to your area.
5. Under Orchestration, ensure the Uniform option is selected for Orchestration mode.
6. Select a marketplace image for Image.
7. Enter your desired username, and select which authentication type you prefer.
---
Notes(2)
- bij availabillity options kies ik voor virtual machine scale set 
- Dan kiezen we de gen1 ubuntu server vm
- Standard_B1ls
- HTTP + SSH inbound ports
- Standard SSD disk
- Ik zie hier de load balancing option dus ik ben benieuwd of we hier later wat mee gaan doen.
![Loadbalancingoption](<../00_includes/AZ-11/Load balancing option.png>)
- Boot diagnostics zijn niet nodig dus die gaan op disable
- Dan vullen we de custom data in
~~~
#!/bin/bash
sudo su
apt update
apt install apache2 -y
ufw allow 'Apache'
systemctl enable apache2
systemctl restart apache2
~~~
- Nu komt er een stukje waar ik even moet kijken wat het precies betekend
- Het blijkt dat ik bij Basic iets niet goed heb ingevoerd namelijk de virtual machine scale set deze moet ik aanmaken
![Scaleset](../00_includes/AZ-11/VMscaleset.png)
- Dit gaan we nu doen.
- In het scaleset menu zien veel dingen er net anders uit zoals de load balancing options toch laten we dit even voor wat het is en gaan verder met het aanmaken.
- We zijn nu aangekomen bij het tab scaling
- Hier kiezen we voor een Custom Scaling policy
- We veranderen die opgegeven settings in de opdracht.
![Scaling options](../00_includes/AZ-11/Scalingoptions.png)
- Wederom bootdiag disable
- Wederom Custom data
~~~
#!/bin/bash
sudo su
apt update
apt install apache2 -y
ufw allow 'Apache'
systemctl enable apache2
systemctl restart apache2
~~~
- We lopen nog een keer de instellingen na.

![Alt text](<../00_includes/AZ-11/Scale settings.png>)

- --> Create
- We hebben nu een scaleset gemaakt
![ourcreatedscaleset](../00_includes/AZ-11/Ourcreatedscaleset.png)


- Toch vraag ik me af waarom de guide zegt dat we een loadbalancer moeten creeren maar daar in de opdracht niets over staat, als ik bij opdracht 2 kijk kom ik dat toch wel weer tegen.
### Scource:
https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/quick-create-portal

- Ik ga dit straks vragen aan mijn collega's
- Tijd om loadbalancer te onderzoeken

---

## Opdracht 2:
Controleer of je via het endpoint van je load balancer bij de webserver kan komen.
Voer een load test uit op je server(s) om auto scaling the activeren. Er kan een delay zitten in het creëren van nieuwe VMs, afhankelijk van de settings in je VM Scale Set.


### Gebruikte bronnen
https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/flexible-virtual-machine-scale-sets-portal)¹.

(1) Quickstart - Create a Virtual Machine Scale Set in the Azure portal .... https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/quick-create-portal.
(2) Create virtual machines in a scale set using Azure portal. https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/flexible-virtual-machine-scale-sets-portal.


### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]

### Notes to self
- Delete all je rescources en groups voordat je aan een nieuwe dag begint.

