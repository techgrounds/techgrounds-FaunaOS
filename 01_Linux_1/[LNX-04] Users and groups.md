# [Users and groups]
[Geef een korte beschrijving van het onderwerp]

## Key-terms
[Schrijf hier een lijst met belangrijke termen met eventueel een korte uitleg.]

## Opdracht

### Create a new user in your VM.

`$ adduser user_name`

### The new user should be part of an admin group.

`$ passwd user_name`

### The new user should have a password.

`$ passwd user_name`

### The new user should be able to use ‘sudo’



### Locate the files that store users, passwords, and groups. See if you can find your newly created user’s data in there.

--

### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]
https://linuxconcept.com/how-to-create-a-sudo-user-on-rhel-red-hat-enterprise-linux-operating-system/

https://devconnected.com/how-to-list-users-and-groups-on-linux/

https://askubuntu.com/questions/1428749/created-user-but-i-cant-switch-to-new-account

https://www.cyberciti.biz/faq/linux-check-existing-groups-users/

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

Per ongeluk systeem user aangemaakt
te horen gekregen dat dat oke is
nu moet ik mijn nieuwe user nog toevoegen aan de juiste groep
usermod -a -G examplegroup exampleusername
het lijkt erop dat faunlnx04 en jordan_ al in de sudo group zit maar wel een andere id heeft namelijk 1001 ivp 1000 bij jordan_ 
ik zou verwachten dat deze dan ook 1000 heeft maargoed het lijkt erop dat het werkt als ik cat /etc/passwd type
faunalnx04:x:1001:27:jordan,,,:/home/faunalnx04:/bin/bash

usermod -a -G sudo faunalnx04

![usergroepsudo](/00_includes/Screenshot%202023-06-08%20at%2020.45.59.png)



### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]
