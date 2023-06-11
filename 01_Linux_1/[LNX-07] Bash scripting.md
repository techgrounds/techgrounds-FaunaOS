# [Onderwerp]
[Geef een korte beschrijving van het onderwerp]

## Key-terms
[Schrijf hier een lijst met belangrijke termen met eventueel een korte uitleg.]

## Code Use
`pwd`  
`mkdir`  
`cd`



## Opdracht

# **Exercise 1:**

### Create a directory called ‘scripts’. Place all the scripts you make in this directory.

1. Om te beginnen gaan we kijken in welke map we zitten met `pwd`

   ~~~~
    pwd
    /home/jordan_
   ~~~~

2. Hierin gaan we een nieuwe map aanmaken dit doen we met het volgende command `mkdir`

    ~~~~
    mkdir scripts
    ~~~~

3. vervolgens gaan we naar de scripts map die we net hebben aangemaakt in via `cd`

    ~~~~
    cd scripts
    ~~~~

    Eind resultaat

    --
    ![create_directory_scripts](../00_includes/%5BLNX07%5D%20Screenshots/create_directory_scripts.png)--

### Add the scripts directory to the PATH variable.

1. Nu gaan we onze scripts directory toevoegen aan PATH variable zodat we deze later kunnen oproepen. We doen dit met de `export` command. omdat het absolute path van onze directory /home/jordan_/scripts is gaan we deze ook gebruiken.

    ~~~
    export PATH=$PATH:/home/jordan_/scripts
    ~~~
2. nu gaan we controleren of dit ook is gelukt d.m.v. `echo $PATH` en om ons pad te filteren voegen we hier ook een pipe filter aan toe met `| grep /home/jordan_/scripts`
    ~~~
    echo $PATH | grep /home/jordan_/scripts
    ~~~

    Eind resultaat

    --
    ![Alt text](../00_includes/%5BLNX07%5D%20Screenshots/Adddirectorytopathvariable.png)--
    
#### Create a script that appends a line of text to a text file whenever it is executed.

1. eerst gaan we een script file maken. om dit te doen gaan we de nano text editor gebruiken in linux. deze openen we door `nano` als command in te voeren en daarna de naam van de file die we aanmaken. we voegen hier .sh aan toe omdat we dan weten dat het een script file is.
    ~~~~
    nano bashy.sh
    ~~~~
2. nu moeten we aangeven op wat voor manier de text moet worden geinterperteerd dit doen we door middel van een `shebang` in ons geval is dan #!/bin/bash omdat de inhoud van het script in bash is.
    ~~~~
    #!/bin/bash
    ~~~~
3. nu moeten we de variable aangeven voor de text en het textbestand zodat we deze later kunnen aangeven bij het runnen van het script dit doen we op de volgende manier.
    ~~~
    line="This is my first script"
    file="output.text"
    ~~~
4. Vervolgens moeten we er ook voor zorgen dat onze input text in een text bestand wordt geprint. dit doen we door `echo` en `>>` 
    ~~~
    echo "$line" >> "$file"
    ~~~

### Create a script that installs the httpd package, activates httpd, and enables httpd. Finally, your script should print the status of httpd in the terminal.
1. Om te beginnen maken we een nieuw script aan genaamd `apache2.sh`
    ~~~
    nano apache2.sh
    ~~~
2. Hierin gaan we een een instal command runnen. Daarna gaan we de service starten en een command om deze op enable te zetten.
    ~~~
    # Install the apache2 package
    sudo yum install -y apache2

    # Start the apache2 service
    sudo systemctl start apache2

    # Enable apache2 to start on boot
    sudo systemctl enable apache2

    # Check the status of apache2
    status=$(sudo systemctl is-active apache2)

    # Print the status
    echo "apache2 Status: $status"
    ~~~
3. Als we het script een tweede keer zouden runnen maar deze al geinstalleerd is hoeven we dit niet nog een keer te doen dus met een if statement kunnen we het script zo aanpassen dat deze alleen de status aangeeft als apache2 al is enabled.
    ~~~
    #!/bin/bash

    # Check if apache2 is already active
    if sudo systemctl is-active --quiet apache2; then
    echo "Apache2 is already active."
    else
    # Install the apache2 package
    sudo apt-get update
    sudo apt-get install -y apache2

    # Start the apache2 service
    sudo systemctl start apache2

    # Enable apache2 to start on boot
    sudo systemctl enable apache2

    echo "Apache2 has been installed, started, and enabled."
    fi

    # Check the status of apache2
    status=$(sudo systemctl is-active apache2)

    # Print the status
    echo "Apache2 Status: $status"
    ~~~
4. Nu kunnen we het script meerdere keren runnen zonder dat die blijft herinstalleren

# **Variables:**

You can assign a value to a string of characters so that the value can be read somewhere else in the script.

Assigning a variable is done using ‘=’.

Reading the value of a variable is done using ‘$[insert variable name here]’.

# **Exercise 2:**

### Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file.
1. we maken een nieuw script met nano en noemen deze randomnumber.sh hierin gebruiken we de variable `random_number=$((1+random %10))` om een random getal te genereren tussen de 1 en 10, de rest van de code is om het getal te printen naar een nieuw bestand genaamd `random_numbers.txt`
    ~~~
    #!/bin/bash

    # Generate a random number between 1 and 10
    random_number=$((1 + RANDOM % 10))

    # File to store the numbers
    file_path="random_numbers.txt"

    # Append the random number to the file
    echo "$random_number" >> "$file_path"

    echo "Random number $random_number appended to $file_path"
    ~~~


# **Conditions:**

You can choose to only run parts of your script if a certain condition is met. For example, only read a file if the file exists, or only write to a log if the health check returns an error. This can be done using conditions.

A check for a condition can be done using ‘if’, ‘elif’, and/or ‘else’.

# **Exercise 3:**

- Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file only if the number is bigger than 5. If the number is 5 or smaller, it should append a line of text to that same text file instead.

### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

### Ervaren problemen
- ik moet er achter komen hoe scripts werkte en dat was best lastig omdat veel tutorials niet de basis hadden.
- chmod -x ging niet goed omdat ik eigenlijk +x moest hebben. ik had dit kunnen weten omdat we natuurlijk execute rechten toevoegen en niet erafhalen.
- verder vond ik veel informatie die ik niet hoefde toe te passen in eerdere delen van de opdracht zoals het gebruiken van variable, dit kwam later pas.
- ik had perongeluk een typfout gemaakt in mijn script en daardoor kreeg ik een output met speciale tekens maar dit zag ik niet direct omdat het leek op een output.t=xt tegen maar het was een output.t≈xt hierdoor kon ik de file niet deleten met `rm` of `rm -f` ik moest hier uiteindelijk wel om lachen

 
### Resultaat
Door het runnen van het script en het lezen van de file output.txt met `cat output.txt`

![Alt text](<../00_includes/[LNX07] Screenshots/outputscript.png>)