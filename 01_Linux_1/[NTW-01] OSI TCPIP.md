# OSI

### Videos

- [What is TCP/IP and OSI? // FREE CCNA // EP 3](https://www.youtube.com/watch?v=CRdL1PcherM)

    
### Video Notes:

1 → Please Do Not Throw Sweet Pizza Away → 7

7 → All People Seem To Need Data Processing → 1

```bash
#1 [**P]hysical Layer** 
#2 [**D]ata Link Layer
#3 [N]etwork Layer
#4 [T]ransport Layer
#5 [S]ession Layer
#6 [P]resentation Layer
#7 [A]pplication Layer**
```

Presentation

- [How the OSI model works on YouTube (Application and Transport Layers) // FREE CCNA // EP 5](https://www.youtube.com/watch?v=oIRkXulqJA4)
    

## OSI Explained

*Het OSI (Open Systems Interconnection) model is een conceptueel raamwerk dat helpt bij het begrijpen en beschrijven van hoe verschillende componenten van een netwerk met elkaar communiceren. Het bestaat uit zeven lagen, elk vertegenwoordigt een specifieke functie in het netwerkcommunicatieproces. Hieronder volgt een gedetailleerde uitleg van elke laag en de gebruikswijze:*

1. **`Physical Layer:`** Dit is de laagste laag van het OSI-model en behandelt de fysieke overdracht van gegevens over het netwerk. Het definieert de elektrische, mechanische en fysieke aspecten van het netwerk, zoals kabels, connectoren en signalering. Het richt zich op de overdracht van ruwe bits, zonder rekening te houden met de data die wordt getransporteerd.
2. **`Data Link Layer:`** De data link laag zorgt voor foutloze overdracht van dataframes tussen aangrenzende knooppunten over een fysieke link. Het behandelt framing, foutdetectie en -correctie, en flow control. Het zorgt er ook voor dat data betrouwbaar wordt overgedragen tussen twee direct verbonden knooppunten, met behulp van technieken zoals MAC (Media Access Control) adressering en Ethernet protocollen.
3. **`Network Layer:`** De network layer is verantwoordelijk voor logische adressering en routering van datapakketten tussen verschillende netwerken. Het maakt de totstandbrenging van end-to-end communicatiepaden mogelijk door de beste route voor gegevensoverdracht te bepalen op basis van netwerkcondities, adresseringsschema's en routeringsprotocollen. Het IP (Internet Protocol) is een veelgebruikt protocol op deze laag.
4. **`Transport Layer:`** De transport layer zorgt voor betrouwbare en efficiënte gegevensoverdracht tussen eindsystemen (computers) door data van de bovenliggende lagen op te splitsen in kleinere eenheden, bekend als segments of datagrams. Het biedt ook foutdetectie, flow control en end-to-end verbindingsbeheer. Protocollen zoals TCP (Transmission Control Protocol) werken op deze laag.
5. **`Session Layer:`** De session layer legt, beheert en beëindigt verbindingen tussen applicaties op verschillende netwerkapparaten. Het biedt mechanismen voor sessie-opbouw, -onderhoud en -synchronisatie. Deze laag zorgt ervoor dat gegevensuitwisseling tussen applicaties betrouwbaar en ordelijk is. Het beheert dialogen of gesprekken tussen applicaties, waardoor ze kunnen communiceren na onderbrekingen.
6. **`Presentation Layer:`** De presentation layer is verantwoordelijk voor gegevensrepresentatie, versleuteling en compressie. Het vertaalt het gegevensformaat van de applicatielaag naar een formaat dat begrepen kan worden door het ontvangende apparaat. Het behandelt ook gegevensversleuteling en -ontcijfering voor veilige communicatie, evenals gegevenscompressie voor efficiënte overdracht.
7. **`Application Layer:`** De application layer is de bovenste laag van het OSI-model en heeft direct contact met applicaties of software die op netwerkapparaten draait. Het biedt diensten en protocollen die applicaties in staat stellen toegang te krijgen tot netwerkbronnen. Voorbeelden van protocollen op deze laag zijn HTTP (Hypertext Transfer Protocol), SMTP (Simple Mail Transfer Protocol) en FTP (File Transfer Protocol).

### Het OSI-model is nuttig op verschillende manieren:

*Over het algemeen is het OSI-model een waardevol instrument om netwerkcommunicatieprocessen te begrijpen, netwerkproblemen op te lossen en interoperabiliteit tussen verschillende netwerkcomponenten en systemen te bevorderen.*

- **`Troubleshooting:`** Door het netwerkcommunicatieproces op te delen in afzonderlijke lagen helpt het OSI-model bij het identificeren en isoleren van netwerkproblemen. Het stelt netwerkbeheerders in staat zich te richten op specifieke lagen bij het diagnosticeren en oplossen van problemen.
- **`Interoperabiliteit:`** Het OSI-model dient als referentiepunt voor het ontwikkelen en implementeren van netwerkprotocollen. Het zorgt ervoor dat verschillende systemen en apparaten effectief met elkaar kunnen communiceren, zolang ze zich houden aan dezelfde laagspecificaties.
- **`Standaardisatie:`** Het model biedt een gestandaardiseerd raamwerk voor het ontwerpen en ontwikkelen van netwerkprotocollen en -technologieën. Het stelt verschillende leveranciers en fabrikanten in staat om compatibele netwerkproducten te creëren, wat leidt tot interoperabiliteit en een efficiëntere netwerkomgeving.

# TCP/IP

*TCP/IP (Transmission Control Protocol/Internet Protocol) is een set van protocollen die wordt gebruikt om gegevens over te dragen en te communiceren in computernetwerken, met name in het internet. Het TCP/IP-model beschrijft de standaardprotocollen en hun functionaliteit voor netwerkcommunicatie.*

## TCP

*Transmission Control Protocol (TCP): TCP zorgt voor betrouwbare, sequentiële en foutloze gegevensoverdracht tussen twee computers. Het verdeelt de gegevens in kleinere eenheden, genaamd pakketten, en voegt extra informatie toe aan elk pakket om ervoor te zorgen dat ze in de juiste volgorde aankomen en dat er geen gegevens verloren gaan. TCP beheert ook de verbindingsopbouw en -afbraak tussen de verzendende en ontvangende hosts.*

## IP

*Internet Protocol (IP): IP is verantwoordelijk voor de adresering en routering van gegevenspakketten in een netwerk. Het IP-protocol wijst unieke IP-adressen toe aan elk apparaat dat is verbonden met het netwerk, zodat pakketten naar de juiste bestemming kunnen worden gestuurd. IP bepaalt ook de beste route voor pakketten door het netwerk op basis van de huidige netwerkcondities.*

1. **`Network Interface Layer:`** Deze laag is verantwoordelijk voor het verzenden en ontvangen van gegevensframes over het fysieke medium. Het omvat het beheer van hardware-interfaces, zoals netwerkkaarten, en de protocollen voor het verzenden en ontvangen van frames.
2. **`Internet Layer:`** De internetlaag behandelt de overdracht van gegevenspakketten tussen netwerken. Het zorgt voor de adressering van pakketten met behulp van IP-adressen en implementeert de routingprotocollen die bepalen hoe pakketten door het netwerk worden gestuurd.
3. **`Transport Layer:`** De transportlaag is verantwoordelijk voor betrouwbare end-to-end gegevensoverdracht tussen hosts. Het gebruikt protocollen zoals TCP en UDP om gegevensstromen op te splitsen in pakketten en ervoor te zorgen dat ze correct aankomen bij de bestemming.
4. **`Application Layer:`** De applicatielaag is de bovenste laag en bevat toepassingen en diensten waarmee gebruikers communiceren. Het omvat protocollen zoals HTTP, FTP, DNS en SMTP, die functionaliteit bieden voor webbrowsing, bestandsoverdracht, domeinnaamresolutie en e-mailverzending.