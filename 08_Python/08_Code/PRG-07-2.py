loop_int = [9, 80, 16, 35, 9]

# Create a list of five integers.
print("Original list:", loop_int)

# Calculate the sum of each element with the next element (or the first element if it's the last)
sum_list = []
for i in range(len(loop_int)):
    next_position = (i + 1) % len(loop_int)  # Calculate the position of the next element
    total = loop_int[i] + loop_int[next_position]
    sum_list.append(total)

# Print the sum list
print("Sum list:", sum_list)