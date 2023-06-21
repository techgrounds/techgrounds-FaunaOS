# [Symmetric encryption]
Encryption is an important tool for securing data. Be it data at rest, or data in motion. A lot of what you do on your computer and the Internet is encrypted.

Throughout history humanity has come up with many ciphers to encode information. Most of these are symmetric ciphers, the most famous one being the Caesar cipher.

In this assignment you will learn about the basics of cryptography, starting with symmetrical encryption.


## Key-terms


# Opdracht

### Find one more historic cipher besides the Caesar cipher.
Historic Cipher: One of the famous historic ciphers is the Vigenère cipher. The Vigenère cipher is a polyalphabetic substitution cipher that uses a keyword to encrypt and decrypt messages. It was invented by Blaise de Vigenère in the 16th century and was considered unbreakable for several centuries.

## Find two digital ciphers that are being used today.
- Advanced Encryption Standard (AES): AES is a symmetric encryption algorithm that has become the de facto standard for encrypting sensitive data. It is used in various applications, including secure communication protocols, file encryption, and securing data in transit. AES supports key sizes of 128, 192, and 256 bits and is known for its robustness and efficiency.

- Triple Data Encryption Standard (3DES): 3DES is a symmetric encryption algorithm that applies the Data Encryption Standard (DES) algorithm three times to each data block. It is a backward-compatible variant of DES and provides a higher level of security. Although AES has largely replaced DES and 3DES in new applications, 3DES is still used in some legacy systems.

## Send a symmetrically encrypted message to one of your peers via the public Slack channel.
- *They should be able to decrypt the message using a key you share with them. Try to think of a way to share this encryption key without revealing it to everyone.  
    You are not allowed to use any private messages or other communication channels besides the public Slack channel.*

    Choose a message: Decide on the message you want to send to your peer. It can be any text that you want to keep confidential.

    I think the best way to do this would be creating a message that you would normally send aswell but it needs to be able to hide information.
    A meme or a image would be the best way for this.
    we can you something like steganography to hide information inside the image.

    https://www.youtube.com/watch?v=TWEXCYQKyDc&t=230s 

    Hide secret messages in pictures  
    https://www.makeuseof.com/tag/4-ways-to-hide-secret-messages-in-pictures/  
    https://www.groovypost.com/howto/hide-text-inside-image-files/

    So the plan is to do the following.
    
    1. Create a image file with inside a text file with the mission and SAE encryption key for the actual
    We will put these inside a folder on our desktop and then we will try to use the `cat` command to join these files together.

    So i got stuck because the image i created got compressed by slack and lost the message
    https://acte.ltd/utils/randomkeygen
    https://gchq.github.io/CyberChef

    For cyberchef i had to understand IV initialization vector
    https://en.wikipedia.org/wiki/Advanced_Encryption_Standard
    https://en.wikipedia.org/wiki/Initialization_vector
    https://www.dcode.fr/

    We kunnen ook met openssl keys generaten in linux
    https://blastoise.hashnode.dev/aes-encryption-in-linux

~~~
openssl version
~~~

### Steps:
1. Generate an encryption key: Use a strong and secure method to generate a symmetric encryption key. You can use a cryptographic library or tool to generate a random key. Make sure to keep this key secure and don't share it publicly.

2. Encrypt the message: Use the symmetric encryption algorithm, such as AES, along with the generated encryption key to encrypt your message. Apply the encryption algorithm to the message using the key, and generate the encrypted ciphertext.

3. Convert ciphertext to a shareable format: Convert the encrypted ciphertext into a format that can be shared on the public Slack channel. One common approach is to encode the ciphertext using Base64 encoding, which converts binary data into ASCII text format.

4. Post the encrypted message: Share the encoded ciphertext on the public Slack channel for your peer to see. You can simply copy and paste the encoded message into a message or reply on the channel.



## Analyse the shortcomings of symmetric encryption for sending messages.

**Key Distribution:** With symmetric encryption, both the sender and receiver need to possess the same encryption key. Distributing the key securely to all intended recipients can be a challenge, especially in large-scale deployments. Key management becomes more complex as the number of users increases.

**Key Secrecy:** Since the same key is used for encryption and decryption, the key must be kept secret. If the key is compromised, an attacker can decrypt all messages encrypted with that key. Therefore, securely storing and exchanging the encryption key is critical.

**Scalability:** Symmetric encryption is not easily scalable to large groups of users. In scenarios where multiple users need to communicate securely with each other, a separate key must be shared between each pair of users. This requires a significant number of keys, making key distribution and management more challenging.

**Lack of Forward Secrecy:** In symmetric encryption, if the encryption key is compromised, all past and future encrypted messages can be decrypted. There is no forward secrecy, which means that compromising the key at any point in time can lead to the compromise of all previous communications.

**Key Updates:** If the encryption key needs to be changed (e.g., due to compromise or expiration), all users sharing that key need to be informed and updated. Key rotation can be a complex process, especially in large systems with many users.

### Gebruikte bronnen
https://www.techtarget.com/searchsecurity/definition/Advanced-Encryption-Standard  
https://www.comparitech.com/blog/information-security/3des-encryption/  
https://en.wikipedia.org/wiki/Symmetric-key_algorithm

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]
