# Files And Directories
*Waar welke files en mappen staan binnen je linux vm*

## Key-terms
- Working directory
- Home directory

# Opdrachten

### Find out your current working directory.

- Ik ben begonnen met whoami om mijn username te zien
    
    ![Screenshot 2023-06-08 at 11.00.59.png](/00_includes/Screenshot_2023-06-08_at_11.00.59.png)
    
- vervolgens op internet gezocht naar commands voor files en directories
    
    ```bash
    ls [flags] [directory]
    ```
    
- Vervolgens
    
    ```bash
    #ls / voor alles
    ls /
    ```
    
    ![Screenshot 2023-06-08 at 11.20.32.png](/00_includes/Screenshot_2023-06-08_at_11.20.32.png)
    
- Found out that i need to use the <pwd> command
- /home/jordan_

### Make a listing of all files and directories in your home directory.

- er lijkt alleen de map [Jordan_] in te zitten

```bash
#ls -a geeft ook de hidden files
ls -a 
```

![Screenshot 2023-06-08 at 11.38.05.png](/00_includes/Screenshot_2023-06-08_at_11.38.05.png)

![Screenshot 2023-06-08 at 11.37.41.png](/00_includes/Screenshot_2023-06-08_at_11.37.41.png)

![Screenshot 2023-06-08 at 11.39.38.png](/00_includes/Screenshot_2023-06-08_at_11.39.38.png)

### Within your home directory, create a new directory named ‘techgrounds’.

```bash
#mkdiris voor het maken van directory
#voor opties
mkr —help 
#mkdir {name} om de map aan te maken
mkr {techgrounds}
#ls om te zien of het is gelukt
```

![Screenshot 2023-06-08 at 11.43.50.png](/00_includes/Screenshot_2023-06-08_at_11.43.50.png)

### Within the techgrounds directory, create a file containing some text.

```bash
#touch is voor het aanmaken van files
touch —help

touch {Filename}

#naam veranderen van directory en file zonder {}
mv
mv /home/jordan_/{techgrounds} /home/jordan_/techgrounds

```

![Screenshot 2023-06-08 at 11.56.39.png](/00_includes/Screenshot_2023-06-08_at_11.56.39.png)

```bash
# nu ook voor de file techtext
#hier werk mv ook
mv /home/jordan_/techgrounds/{techtext} /home/jordan_/techgrounds/techtext
```

Hij geeft aan cannot stat '/home/jordan_/techgrounds/{techtext}': No such file or directory
- na lang zoeken ontdekt dat ik perongeluk de file had verplaats ivp rename
![movingdirectories](/00_includes/Screenshot_2023-06-08_at_12.24.07.png)

mv = rename maar ook move

### Move around your directory tree using both absolute and relative paths.
- cd /home/jordan_/techgrounds
- cd ~jordan

Zie screenshot vorige opdracht

### Gebruikte bronnen
https://manpages.ubuntu.com/manpages/kinetic/en/man1/ssh.1.html
https://www.freecodecamp.org/news/the-linux-ls-command-how-to-list-files-in-a-directory-with-options/#:~:text=The%20ls%20command%20is%20used,them%20via%20the%20command%20line.

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]
