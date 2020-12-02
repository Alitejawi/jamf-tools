#!/usr/bin/env python3

__author__ = "Ali Al-Itejawi"
__version__ = "1.0"
__email__ = "ali@al-itejawi.com"

__description__ = "Using the zip function, this script will take iterable objects such as lists and groups them. The first item of each will form a tuple and the second another tuple"

a = [1, 2, 3]
b = [10, 20, 30]
c = [100, 200, 300]

d = list(zip(a, b, c))
print(d)