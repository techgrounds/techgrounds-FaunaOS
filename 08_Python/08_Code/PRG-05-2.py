#Ask the user of your script for a number.
#Give them a response based on whether the number is higher than, lower than, or equal to 100.

#Make the game repeat until the user inputs 100.

first_time_Q = True

while True:
    if first_time_Q:
        question = "Give me a random number: "
    
    else:
        question = "Give me a another random number: "
    
    number = int(input(question))

    if number < 100:
        print("That's not the number I'm looking for, but I'll give you a hint.")
        print("Higher!")

    elif number == 100:
        print("Bingo!")
        break
    else:
        print("That's not the number I'm looking for, but I'll give you a hint.")
        print("Lower!")    
        
    first_time_Q = False
