# [Azure Virtual Machines]
De Service waarmee je VMs kan maken in Azure heet (zeer toepasselijk) Azure Virtual Machines. Je kan deze VMs gebruiken voor alles waar je een fysieke server voor zou gebruiken. Omdat ze in een datacenter van Microsoft staan, kan je er alleen verbinding mee maken via het internet. Verbinding met een remote Linux-machine maak je met het Secure Shell (ssh) protocol. Voor een verbinding met Windows machines gebruik je het Remote Desktop Protocol (RDP).

## Key-terms
VM
RDP
Pay as you go
Reserved Instances
Spot Instances
IOPS

## Opdracht
- Log in bij je Azure Console.
- Maak een VM met de volgende vereisten:
- Ubuntu Server 20.04 LTS - Gen1
- Size: Standard_B1ls
- Allowed inbound ports:
    - HTTP (80)
    - SSH (22)
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
- Controleer of je server werkt.
- Let op! Vergeet na de opdracht niet alles weer weg te gooien.
- Je kan elk onderdeel individueel verwijderen, of je kan in 1 keer de resource group verwijderen.

1. We gaat beginnen met het aanmaken van een VM
2. We proberen hier goed op te letten of we de juiste versie van ubuntu hebben namelijk de server gen 1
3. We voegen naast port 22 ssh ook port 443 toe voor https (De opdracht zegt 80 en http maar waarom niet gewoon https doen?)
4. vervolgens voegen we custom data toe  
    Hier gaat het om het installeren van apache2 webserver|
5. Als laatste schakelen we boot diagnostics uit.
6. review and create -> validated


### Gebruikte bronnen
Niet echt veel gewoon door de stappen van de opdracht heen gegaan.
https://learn.microsoft.com/en-us/azure/virtual-machines/linux/tutorial-secure-web-server

### Ervaren problemen
Ik had file download uitstaan dus ik moest deze goedkeuren hierdoor kon ik mijn key niet downloaden en je krijgt hier maar 1 kans voor dus moet ik een nieuwe vm aanmaken om een key te generaten

### Resultaat
Deze keer heb ik wel poort 22 en 80 gedaan.
![Webserver](<../00_includes/AZ-02/Webserver working.png>)

