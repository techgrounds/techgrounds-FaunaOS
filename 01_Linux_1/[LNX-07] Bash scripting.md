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
    line=This is my first script
    file=output.text
    ~~~

#### Create a script that installs the httpd package, activates httpd, and enables httpd. Finally, your script should print the status of httpd in the terminal.

# **Variables:**

You can assign a value to a string of characters so that the value can be read somewhere else in the script.

Assigning a variable is done using ‘=’.

Reading the value of a variable is done using ‘$<insert variable name here>’.

# **Exercise 2:**

- Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file.

# **Conditions:**

You can choose to only run parts of your script if a certain condition is met. For example, only read a file if the file exists, or only write to a log if the health check returns an error. This can be done using conditions.

A check for a condition can be done using ‘if’, ‘elif’, and/or ‘else’.

# **Exercise 3:**

- Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file only if the number is bigger than 5. If the number is 5 or smaller, it should append a line of text to that same text file instead.

### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]
