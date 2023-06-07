# LNX-01 Setting Up

Task ID: 25  
⚡️ | Do-Date: June 6, 2023

# **Setting up**

# **Introduction:**

Linux, like Windows or MacOS, is an operating system. It manages the communication between the physical device (hardware) and all computer programs (software).

Linux is the most popular operating system for servers, because it is lightweight, stable, highly customizable, and free to use. Due to the open source licensing, everyone is allowed to build and distribute new versions of Linux.

In Linux, the graphical user interface (GUI) is considered to be optional. You control it using a command line (CLI), typing in commands. It is important to get somewhat comfortable with the CLI. Although we will have a GUI, for now. That won’t always be the case.

Using a virtual machine (VM), you can run a Linux machine within your own computer (an OS within an OS). A hypervisor will assign a part of your hardware to the virtual machine. When setting up a VM in the cloud, a type 1 hypervisor is used to allocate hardware to your VM.

During this course we will run a Linux distribution called Ubuntu. In the background there is a VM running on AWS. Within that VM we have created a container for every student. This container acts like a clean instance of Ubuntu. There is no GUI installed, so you will have to use the CLI.

The VM is Located in Frankfurt, so you will need to create a remote connection to your machine. Remote connections to a Linux machine are usually done using the Secure Shell (SSH) protocol.

# **Requirements:**

- The email from your Learning Coach
- If you’re using a **Windows** machine: [OpenSSH](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse) If you’re using a **MacOS or Linux** machine: Access ssh using your terminal

# **Exercise:**

- Make an SSH-connection to your virtual machine. SSH requires the key file to have specific permissions, so you might need to change those.
- When the connection is successful, type whoami in the terminal. This command should show your username.

## Task Workspace

---



### Assignment Markdown Space

# LNX-01 Setting Up

[Geef een korte beschrijving van het onderwerp]  
Het verbinden met de linux ubuntu vm via SSH





## Key-terms

[Schrijf hier een lijst met belangrijke termen met eventueel een korte uitleg.]

GUI  
CLI  
VM  
OS  
Ubuntu  
SSH (Secure Shell)  
Hypervisor

## Opdracht
[Naam van de exercise]


### 1. Make an SSH-connection to your virtual machine. SSH requires the key file to have specific permissions, so you might need to change those.

Openen Pagina’s met bestanden voor de opdracht



![Screenshot 2023-06-07 at 10.22.10.png](/00_includes/Screenshot_2023-06-07_at_10.22.10.png)

 Downloaded Files Local inside folder on Laptop (MAC)



![Screenshot 2023-06-07 at 10.37.08.png](/00_includes/Screenshot_2023-06-07_at_10.37.08.png)

 Open Terminal Window



 Asked ChatGPT: how to connect to linux vm with mac terminal ssh



 Checked explainshell → ssh
Also Checked My notes from Cloud qualification assignment



```bash
#Setting the right permission
sudo chmod 400 <keyname>.pem
#Setting the right path
sudo chmod 400 ~/.ssh/Nest-jo-Hodge.pem

```

![Screenshot 2023-06-07 at 11.59.57.png](/00_includes/Screenshot_2023-06-07_at_11.59.57.png)

 Then changed the permission on the file



![Screenshot 2023-06-07 at 12.02.12.png](/00_includes/Screenshot_2023-06-07_at_12.02.12.png)

 Now im going to try and login to the VM



```bash
ssh -i ~/.ssh/Nest-jo-Hodge.pem jordan_@3.121.130.219
```

![Screenshot 2023-06-07 at 12.06.29.png](/00_includes/Screenshot_2023-06-07_at_12.06.29.png)

 Running into the problem Permission denied



![Screenshot 2023-06-07 at 12.08.35.png](/00_includes/Screenshot_2023-06-07_at_12.08.35.png)

 Host File Was Locked but it still doesn't work



 Setting permissions on the public key



```bash
#sudo setting permissions on the publickey file
sudo chmod 600 ~/.ssh/Nest-jo-Hodge.pem
#sudo permission 700 on the ssh folder
sudo chmod 700 ~/.ssh
```

 Vastgelopen → ik wist niet dat je meerdere arguments achter elkaar in een command kon zetten
Het aangeven van de port moest niet in een file maar in de terminal



```bash
[-i identity_file]
#ssh username@ip_address_or_hostname
ssh jordan_@3.121.130

[-p port]
52203
#ssh /keyfile.pem username@ip_address_or_hostname ip portnummer
ssh -i ~/.ssh/Nest-jo-Hodge.pem jordan_@3.121.130.219 -p 52203
```

 Uiteindelijk gelukt toen ik te horen kreeg dat ik de port aangaf in de terminal en niet in de ssh configfile (Port 22 is van mij zelf)



![Screenshot 2023-06-07 at 14.15.36.png](/00_includes/Screenshot_2023-06-07_at_14.15.36.png)

### 2. When the connection is successful, type whoami in the terminal. This command should show your username.

![Screenshot 2023-06-07 at 14.19.24.png](/00_includes/Screenshot_2023-06-07_at_14.19.24.png)

### Gebruikte bronnen

[Plaats hier de bronnen die je hebt gebruikt.]



 [https://levelup.gitconnected.com/a-beginners-guide-to-ssh-fb4edbe91233](https://levelup.gitconnected.com/a-beginners-guide-to-ssh-fb4edbe91233)



 [https://smallstep.com/blog/ssh-tricks-and-tips/](https://smallstep.com/blog/ssh-tricks-and-tips/)



 [https://www.ssh.com/academy/ssh/putty/mac#running-ssh-with-a-graphical-user-interface](https://www.ssh.com/academy/ssh/putty/mac#running-ssh-with-a-graphical-user-interface)



 [https://www.youtube.com/watch?v=vbS7TI-qIAU](https://www.youtube.com/watch?v=vbS7TI-qIAU)



 [https://mac.getutm.app/](https://mac.getutm.app/)



 [https://explainshell.com/](https://explainshell.com/)



 [https://manpages.ubuntu.com/manpages/kinetic/en/man1/ssh.1.html](https://manpages.ubuntu.com/manpages/kinetic/en/man1/ssh.1.html)



 [https://www.youtube.com/watch?v=dPAw4opzN9g](https://www.youtube.com/watch?v=dPAw4opzN9g)



 [https://www.youtube.com/watch?v=hQWRp-FdTpc](https://www.youtube.com/watch?v=hQWRp-FdTpc)




### Ervaren problemen

[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]







### Resultaat

[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]





