#Create a dictionary with the following keys and values:
"""
Key
Value
First name
Casper
Last name
Velzen
Job title
Learning coach
Company
Techgrounds
"""

dictionary = {"First name": "Casper",
              "Last name": "Velzen",
              "Job title": "Learning coach",
              "Company": "Techgrounds"}

items = dictionary.items()
print(items)

#Loop over the dictionary and print every key-value pair in the terminal.
for key, value in dictionary.items():
    print(f"{key}: {value}")
    

#Loop over the dictionary and print every key-value pair in the terminal.