#Use user input to ask for their information (first name, last name, job title, company). Store the information in a dictionary.

import csv
import os

user_info_vault = {}
print(type(user_info_vault))

user_info_data = int(1)
for i in range(user_info_data):
    key1 = ("firstname")
    value1 = input("What is your first name : ")
    key2 = ("lastname")
    value2 = input("What is your last name : ")
    key3 = ("jobtitle")
    value3 = input("What is your jobtitle? : ")
    key4 = ("company")
    value4 = input("At what company do you work? : ")
    
    user_info_vault[key1] = value1
    user_info_vault[key2] = value2
    user_info_vault[key3] = value3
    user_info_vault[key4] = value4
    
print(user_info_vault)


#Write the information to a csv file (comma-separated values). The data should not be overwritten when you run the script multiple times.

#used chatgpt for 2nd part of the code

# Specify the path to the desktop and the CSV file name
desktop_path = os.path.expanduser("~/Desktop")
csv_file_path = os.path.join(desktop_path, "user_info.csv")

# Write the dictionary to the CSV file
with open(csv_file_path, "w", newline="") as csv_file:
    writer = csv.DictWriter(csv_file, fieldnames=user_info_vault.keys())
    writer.writeheader()
    writer.writerow(user_info_vault)

print(f"User info saved to {csv_file_path}")
