# ### Write a program in Python (we use Python for automation) that prints the numbers 1
# to 100. But for multiples of three print "Black" instead of the number and for the
# multiples of five print "Red." For numbers which multiples of both three and five print
# "BlackRed."   

def print_numbers():
    for i in range(1, 101):
        output = ""
        if i % 3 == 0:
            output += "Black"
        if i % 5 == 0:
            output += "Red"
        
        print(output or i)

# # Call the function to print the numbers
print_numbers()
