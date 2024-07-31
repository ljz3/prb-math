import math
import sys
from eth_abi import encode
from decimal import *

def encode_and_print(price):
    enc = encode(['int256'], [price])
    ## append 0x for FFI parsing 
    print("0x" + enc.hex(), end='')

if __name__ == """__main__""":
    getcontext().prec = 128
    x = Decimal(sys.argv[1])
    y = Decimal(sys.argv[2])
    z = Decimal(sys.argv[3])
    result = math.floor(x * y / z)
    encode_and_print(result)