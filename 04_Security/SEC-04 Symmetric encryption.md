# [Symmetric encryption]
Encryption is an important tool for securing data. Be it data at rest, or data in motion. A lot of what you do on your computer and the Internet is encrypted.

Throughout history humanity has come up with many ciphers to encode information. Most of these are symmetric ciphers, the most famous one being the Caesar cipher.

In this assignment you will learn about the basics of cryptography, starting with symmetrical encryption.


## Key-terms


## Opdracht

- Find one more historic cipher besides the Caesar cipher.
- Find two digital ciphers that are being used today.
- Send a symmetrically encrypted message to one of your peers via the public Slack channel.  
    They should be able to decrypt the message using a key you share with them. Try to think of a way to share this encryption key without revealing it to everyone.  
    You are not allowed to use any private messages or other communication channels besides the public Slack channel.

## Analyse the shortcomings of symmetric encryption for sending messages.

**Key Distribution:** With symmetric encryption, both the sender and receiver need to possess the same encryption key. Distributing the key securely to all intended recipients can be a challenge, especially in large-scale deployments. Key management becomes more complex as the number of users increases.

**Key Secrecy:** Since the same key is used for encryption and decryption, the key must be kept secret. If the key is compromised, an attacker can decrypt all messages encrypted with that key. Therefore, securely storing and exchanging the encryption key is critical.

**Scalability:** Symmetric encryption is not easily scalable to large groups of users. In scenarios where multiple users need to communicate securely with each other, a separate key must be shared between each pair of users. This requires a significant number of keys, making key distribution and management more challenging.

**Lack of Forward Secrecy:** In symmetric encryption, if the encryption key is compromised, all past and future encrypted messages can be decrypted. There is no forward secrecy, which means that compromising the key at any point in time can

### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]
