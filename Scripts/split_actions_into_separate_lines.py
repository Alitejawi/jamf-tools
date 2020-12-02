#!/usr/bin/env python3

__author__ = "Ali Al-Itejawi"
__version__ = "1.0"
__email__ = "ali@al-itejawi.com"

data = "1,3,5,7,9,11,more data, even more data(with a leading space)"
for item in \
    data.split(','):
    print(item)