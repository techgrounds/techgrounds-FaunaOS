
# Files Permissions

---

*[Geef een korte beschrijving van het onderwerp]*

- Dit gaat over machtigingen van bestanden.
- Gebruikers kunnen de baas zijn over bestanden
- Of bestanden kunnen bij een groep horen

## Key-terms

*[Schrijf hier een lijst met belangrijke termen met eventueel een korte uitleg.]*

- Execute permissions
- read
- write
- group
- root

## Opdracht

---

- Create a text file.

Begonnen met inloggen

daarna heb ik via cd en ls bewogen naar de techgrounds map en daarin het bestand textfilelnx05.txt met daarin wat text

- Make a long listing to view the file’s permissions. Who is the file’s owner and group? What kind of permissions does the file have?

hierna heb ik gecontroleerd of dit gelukt is met ls -l

hier kan ik ook gelijk de rechten die het bestand heeft zien

- Make the file executable by adding the execute permission (x).

dit doe ik met het chmod command

chmod +x

![Screenshot 2023-06-09 at 10.15.22.png](/00_includes/Screenshot_2023-06-09_at_10.15.22.png)

- Remove the read and write permissions (rw) from the file for the group and everyone else, but not for the owner. Can you still read it?

Ja ik kan het nog lezen

![Screenshot 2023-06-09 at 10.43.41.png](/00_includes/Screenshot_2023-06-09_at_10.43.41.png)

We weten dat ik zelf de owner ben maar we gaan kijken wie nog meer owner is 

- Change the owner of the file to a different user. If everything went well, you shouldn’t be able to read the file unless you assume root privileges with ‘sudo’.

chown faunalnx04

![Screenshot 2023-06-09 at 10.47.35.png](/00_includes/Screenshot_2023-06-09_at_10.47.35.png)

- Change the group ownership of the file to a different group.
- chgrp admin textfilelnx05.txt

![Screenshot 2023-06-09 at 10.51.51.png](/00_includes/Screenshot_2023-06-09_at_10.51.51.png)
    

---

### Gebruikte bronnen

*[Plaats hier de bronnen die je hebt gebruikt.]*

[https://www.howtogeek.com/199687/how-to-quickly-create-a-text-file-using-the-command-line-in-linux/](https://www.howtogeek.com/199687/how-to-quickly-create-a-text-file-using-the-command-line-in-linux/)

[https://www.atlantic.net/dedicated-server-hosting/how-to-use-chgrp-change-group-ownership-command-in-linux/](https://www.atlantic.net/dedicated-server-hosting/how-to-use-chgrp-change-group-ownership-command-in-linux/)

### Ervaren problemen

*[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]*

- 

### Resultaat

*[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]*

-