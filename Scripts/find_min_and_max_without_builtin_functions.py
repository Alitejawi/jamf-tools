#!/usr/bin/env python3

__author__ = "Ali Al-Itejawi"
__version__ = "1.0"
__email__ = "ali@al-itejawi.com"


__description__ = "This script will find the minimum value and maximum value of a list of integers without using the built-in functions"

data = [3, 4, 6, 8, 9, -1, -4, 0, 7]


max = min = data[0]
for x in data:
    if x < min:
        min = x
    elif x > max:
        max = x

print('Minimum =', min)
print('Maximum =', max)