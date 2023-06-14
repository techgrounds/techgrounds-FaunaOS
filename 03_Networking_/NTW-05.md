# **Opdracht:**

### Ontdek wat je publieke IP adres is van je laptop en mobiel op wifi.

- Google whats my ip, wel vpn uit zetten

### Zijn de adressen hetzelfde of niet? Leg uit waarom.
Public is verbonden met het internet
NAT vertaalt dit naar private IP

### Ontdek wat je privé IP adres is van je laptop en mobiel op wifi.
`ipconfig getifaddr en0`

### Zijn de adressen hetzelfde of niet? Leg uit waarom.

- Omdat de NAT in de router elk apparaat een ander prive adress geeft.Data die binnenkomt via de wifi weet dan welk apparaat de data naartoe moet.

### Verander het privé IP adres van je mobiel naar dat van je laptop. Wat gebeurt er dan?

- Als ik het privé IP-adres van mijn mobiel verander naar dat van mijn laptop, kunnen er verschillende dingen gebeuren, afhankelijk van de configuratie van het netwerk en de apparaten:
    
1. IP-adresconflict: Als zowel mijn mobiel als mijn laptop hetzelfde IP-adres binnen het netwerk hebben, ontstaat er een conflict. Dit kan leiden tot netwerkproblemen, zoals verbindingsproblemen of het niet kunnen communiceren met andere apparaten op het netwerk.

2. DHCP-heronderhandeling: Als beide apparaten gebruikmaken van het Dynamic Host Configuration Protocol (DHCP) om IP-adressen te verkrijgen, kan het netwerk automatisch proberen een nieuw IP-adres aan mijn mobiel toe te wijzen. Dit kan enige tijd duren en tijdens die periode kan de connectiviteit van mijn mobiel worden onderbroken.

### Probeer het privé IP adres van je mobiel te veranderen naar een adres buiten je netwerk. Wat gebeurt er dan? 

- Als ik daarentegen het privé IP-adres van mijn mobiel probeer te veranderen naar een adres buiten mijn netwerk, zal mijn mobiel hoogstwaarschijnlijk geen verbinding kunnen maken met het netwerk. Het IP-adres bevindt zich immers buiten het bereik van het subnet van het lokale netwerk.
- Dit kan resulteren in het niet kunnen verzenden of ontvangen van gegevens via het netwerk en het verlies van internetconnectiviteit op mijn mobiel.
    