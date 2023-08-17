#Create a list of five integers.
integers = [5, 6, 18, 21, 33]
#print(int_list)
#Use a for loop to do the following for every item in the list:

for a in integers:
    print(a)
#Print the value of that item added to the value of the next item in the list. If it is the last item, add it to the value of the first item instead (since there is no next item).

#The first result above is created by adding 9 and 80. The second result is created by adding 80 and 16, etc. The last result is created by adding 35 and 9.
int_list = ["5", "6", "18", "21", "33"]

#im trying some things to see if i can figure out the functions of lists
print(type(int_list))
#Calling the first integer from the list
first_number = int_list [0]
#calling the last number from the list
last_number = int_list [-1]

#print result
print(first_number)
print(last_number)

#add a number to the list
integers.append(9)

#print result
print(integers)

#adding more than one integer to the list
int_list = int_list + [9, 80]

#print result
print(int_list)

#creating a new list for the loop
loop_list = [1, 3, 5, 7, 9]

#here we will add 23 to the 3nd position of the list (counting starts at 0)
loop_list.insert(2, 23)

print(loop_list)