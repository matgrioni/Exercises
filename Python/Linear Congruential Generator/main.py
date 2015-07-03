#!/usr/bin/python

def nextValue(currentValue):
    return (currentValue * a + b) % n

a = int(input("Multiplicative constant (a) > "))
b = int(input("Additive contant (b) > "))
x0 = int(input("Initial value (x-0) > "))
n = int(input("Modulus value > "))

data = ""
indexedValue = x0

for i in range(n):
    data += str(indexedValue) + " "
    indexedValue = nextValue(indexedValue)

lcgFile = open("lcg.txt", "w")
numbers = data.split()
for i in range(1, len(numbers) + 1):
    lcgFile.write("%4s " % str(numbers[i-1]))

    if i % 16 == 0:
        lcgFile.write("\n")

lcgFile.close()
