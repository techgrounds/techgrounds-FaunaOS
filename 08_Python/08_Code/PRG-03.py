#Create a new script.
#Copy the code below into your script.

#these are the first group of defined variables
a = 'int'
b = 7
c = False
d = "18.5"

#Determine the data types of all four variables (a, b, c, d) using a built in function.

#by using the function type we can refer to the set variables to we can discover what class they are
print(type(a))
# <class 'str'>
print(type(b))
# <class 'int'>
print(type(c))
# <class 'bool'>
print(type(d))
# <class 'str'>

#Make a new variable x and give it the value b + d. Print the value of x. This will raise an error. Fix it so that print(x) prints a float.

#created a new variable called x consisting of the sum of b and d
x = (float(b) + float(d)) 

print(x)

#Write a comment above every line of code that tells the reader what is going on in your script.

