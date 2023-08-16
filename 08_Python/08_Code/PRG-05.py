#Use the input() function to ask the user of your script for their name.
#If the name they input is your name, print a personalized welcome message.
#If not, print a different personalized message.

name = input("whats your name?")

if name.lower() == "jordan":
    print("Acces Granted!")
else:
    print("Acces Denied!")