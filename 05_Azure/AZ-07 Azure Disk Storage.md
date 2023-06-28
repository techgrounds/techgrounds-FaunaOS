# [Azure Disk Storage]
Azure Disk Storage kan gezien worden als een virtual hard drive in de cloud. Een disk kan een OS disk (waar het OS op staat) of een Data Disk (te vergelijken met een externe harde schijf) zijn. Je hebt een keuze tussen Managed Disks en Unmanaged Disks. Unmanaged Disks zijn goedkoper, maar je hebt er wel een Storage Account nodig (en je moet de disk dus zelf managen). Managed Data Disks kunnen gedeeld worden tussen meerdere VMs, maar dat is een relatief nieuwe feature en er zitten wat haken en ogen aan.

## Key-terms


## Opdracht
- Start 2 Linux VMs. Zorgt dat je voor beide toegang hebt via SSH.
Done with default settings
- Maak een Azure Managed Disk aan en koppel deze aan beide VMs tegelijk.
VM -> Disk -> Attached disk
- Creëer op je eerste machine een bestand en plaats deze op de Shared Disk.
We moeten hiervoor eerst inloggen op onze 1ste VM
~~~
ssh -i ~/.ssh/AZ07virtual01_key.pem AZ07user01@20.68.136.33
~~~
Nu we ingelogd zijn gaan we opzoek naar de mounted disk die we hebben aangemaakt.
We gaan eerst onze disks listen 
~~~
dh -h
~~~
Hier zien we de `/mnt`
~~~
cd /mnt
sudo touch file.text
ls -l
~~~
- Nu zien we ons bestand en gaan we kijken of we deze ook kunnen vinden in onze 2de vm
- Nee dit kunnen we niet helaas
- We gaan een snapshot aanmaken zodat dit wel het geval is.
- Nu gaan we opnieuw inloggen op onze 2de VM

- Er is nog geen snapshot zichtbaar, misschien moeten we de snapshot eerst laden

- Kijk op de tweede machine of je het bestand kan lezen.
- Maak een snapshot van de schijf en probeer hier een nieuwe Disk mee te maken.
- Mount deze nieuwe Disk en bekijk het bestand.
- We hebben een snapshot gemaakt, nu gaan we een nieuwe shared disk maken en daar laden we de snapshot op.

### Gebruikte bronnen
https://learn.microsoft.com/en-us/azure/virtual-machines/disks-types
https://www.youtube.com/watch?v=f_9okkunX40

### Ervaren problemen
Double mount 
1st part en format
2de disk mount
ls bill om mount te zien

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]
