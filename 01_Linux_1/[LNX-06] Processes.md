# [Processes]
[Geef een korte beschrijving van het onderwerp]

## Key-terms
[Schrijf hier een lijst met belangrijke termen met eventueel een korte uitleg.]

## Opdracht

### Start the telnet daemon.

om te beginnen moeten we telnet installeren dit doen we met het volgende command

telnet heeft een andere naam dan standaard telnet voor het procces

sudo apt install telnet

### Find out the PID of the telnet daemon.

ps aux | grep inetd

![Screenshot 2023-06-09 at 15.00.38.png](/00_includes/Screenshot_2023-06-09_at_15.00.38.png)

### Find out how much memory telnetd is using.

systemctl status inetd

![Screenshot 2023-06-09 at 14.58.57.png](/00_includes/Screenshot_2023-06-09_at_14.58.57.png)

### Stop or kill the telnetd process.

sudo kill 8511

![Screenshot 2023-06-09 at 15.03.19.png](/00_includes/Screenshot_2023-06-09_at_15.03.19.png)

---

### Gebruikte bronnen

*[Plaats hier de bronnen die je hebt gebruikt.]*

- 

### Ervaren problemen

*[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]*

- 

### Resultaat

*[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]*

-