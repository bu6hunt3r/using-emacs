#!/usr/bin/python3
from pwn import *
import random

context.arch="amd64"

def f(x):
    return x+1

def main():
    return f(3)


if __name__=="__main__":
    main()
