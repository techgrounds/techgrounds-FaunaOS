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
loop_int = [1, 3, 5, 7, 9]

#here we will add 23 to the 3nd position of the list (counting starts at 0)
loop_int.insert(2, 23)

#print result
print(loop_int)

#now back to the assignment:

#Print the value of that item added to the value of the next item in the list. If it is the last item, add it to the value of the first item instead (since there is no next item).

#So here we will take our loop_list and the position of the first integer and add the 2nd integer
loop_list = loop_int[0] + loop_int[1]

#print result
print("sum =", loop_list)

#now the problem we have is that we want to do some sort of auto + the next position in the integer list. 
    #im thinking about creating a int_value with +1 and use that as int insert for the position number of the looplist, i dont know if this is possible but we are going to try.
        #the elements we need for this are.
        
        #the loop for getting input numbers for the position
def next_position(previous_position):
    new_position = previous_position + 1
    return new_position

previous_position = 0

result = next_position(previous_position)
print(result)

#good we get 1, now we want it to run it as the total length of the list
#we use len for this len is length and as input we use our list length
for i in range(len(loop_int)):
    previous_position = next_position(previous_position)
    print("sumnumber = ", previous_position)

#now we want to have the number become a insert value in the loop_list position
#now we do get the entire list of index numbers we want to use so now we need to input this into the loop_list = loop_int[>sumnumber<] + loop_int[previous_number]

#ive read up about the % modulo operator
Example = 12 % 9
print(Example)

#we now create a empty list we can store the results in.
calculated_list = []

#this gives us 3 its the remained of 12 - 9
#so if we would calculate the position of the next element
#here i is the number of the position and we then add 1 and remove the positions that are left by doing len(loop_int)w
for i in range(len(loop_int)):
    leftover_positions = (i + 1) % len(loop_int) 
#now we need to get the total by taking the current index position from i and calculate the leftover positions
    total = loop_int[i] + loop_int[leftover_positions]
#now we append so add the total to the calculated_list we made earlier
    calculated_list.append(total)

#then we print the result
print(calculated_list)
        #the true false conditions

#this returns
# [4, 26, 28, 12, 16, 10]
#loop_int = [1, 3, 5, 7, 9] with this input i would expect
#calculated_list = [1, 4, 8, 13, 22]


#The first result above is created by adding 9 and 80. The second result is created by adding 80 and 16, etc. The last result is created by adding 35 and 9.

