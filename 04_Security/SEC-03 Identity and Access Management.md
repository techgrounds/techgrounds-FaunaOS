# [Identity and Access Management]
Security goes in two steps: authentication and authorization. Both are two different actions that happen whenever you log in.

Multi-factor authentication (MFA) is a common way to improve security.
It is best practice to follow the principle of least privilege for authorization.

## Key-terms
[Schrijf hier een lijst met belangrijke termen met eventueel een korte uitleg.]

## Opdracht
~~~
### Study:
- The difference between authentication and authorization.
- The three factors of authentication and how MFA improves security.
- What the principle of least privilege is and how it improves security.
~~~
## The difference between authentication and authorization:

Authentication is the process of verifying the identity of a user or entity. It confirms that the person or system trying to access a resource is indeed who they claim to be. This process typically involves providing credentials, such as a username and password, biometric data, or digital certificates.

Authorization, on the other hand, is the process of granting or denying access rights and permissions to authenticated users or entities. Once a user's identity is verified through authentication, authorization determines what actions or resources that user is allowed to access. It defines the privileges and permissions associated with a particular identity or role.

In summary, authentication validates the identity, while authorization determines the level of access or permissions granted to that authenticated identity.

## The three factors of authentication and how MFA improves security:

The three factors of authentication are:
- Something you know: This factor refers to information that only the authorized user should know, such as a password, PIN, or answers to security questions.
- Something you have: This factor involves possession of a physical object, such as an access card, a mobile device, or a hardware token.
- Something you are: This factor refers to biometric characteristics unique to an individual, such as fingerprints, voiceprints, or retinal patterns.

Multi-Factor Authentication (MFA) combines two or more of these authentication factors to provide an additional layer of security. By requiring multiple factors during the authentication process, MFA significantly reduces the risk of unauthorized access. Even if one factor is compromised, an attacker would still need to bypass the other factors to gain access. For example, MFA may require a user to enter a password (something they know) and then verify their identity using a fingerprint scan (something they are). This extra layer of protection makes it harder for attackers to impersonate legitimate users.

## The principle of least privilege and how it improves security:

The principle of least privilege (PoLP) is a security concept that advocates granting users or entities the minimal set of permissions necessary to perform their required tasks and nothing more. It restricts users from accessing resources or performing actions beyond what is essential for their designated roles or responsibilities.

By implementing the principle of least privilege, organizations can minimize the potential damage that can be caused by compromised accounts or malicious insiders. Here's how it improves security:

- Reduces the attack surface: By granting only necessary permissions, the potential attack surface or the number of ways an attacker can exploit a system is significantly reduced. Unauthorized access or misuse of privileged functionalities becomes more difficult, limiting the potential impact of security breaches.

- Mitigates the impact of breaches: If a user's account is compromised, either through social engineering or technical vulnerabilities, the principle of least privilege ensures that the attacker's access is limited to only the authorized resources for that user. This containment minimizes the damage and prevents lateral movement across the system.

- Simplifies privilege management: By applying least privilege, organizations can better manage and monitor user permissions. It helps in maintaining access control policies, tracking authorization levels, and auditing user activities. Over time, this reduces the complexity of security administration and improves overall system security.

In summary, the principle of least privilege enhances security by reducing the attack surface, limiting the impact of breaches, and facilitating effective privilege management.



### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]
