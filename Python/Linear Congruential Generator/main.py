#!/usr/bin/python

def nextValue(currentValue):
    return (currentValue * a + b) % n

a = int(raw_input("Multiplicative constant (a) > "))
b = int(raw_input("Additive contant (b) > "))
x0 = int(raw_input("Initial value (x-0) > "))
n = int(raw_input("Modulus value > "))

data = ""
indexedValue = x0

for i in range(n):
    data += str(indexedValue) + " "
    indexedValue = nextValue(indexedValue)

with open("lcg.txt", "w") as f:
    for (i, num) in enumerate(data.split()):
        f.write("{:<4} ".format(num))

        if (i + 1) % 16 == 0:
            f.write("\n")
