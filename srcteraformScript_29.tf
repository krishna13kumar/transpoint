#add two numbers
def add(num1, num2):
    return num1 + num2

#main program
num1 = int(input("Enter first number: "))
num2 = int(input("Enter second number: "))

#calling the function
sum = add(num1, num2)

#printing the result
print("The sum of {0} and {1} is {2}".format(num1, num2, sum))