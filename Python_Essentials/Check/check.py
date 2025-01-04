import math

def square(x):
    return x * x

def ask_value():
    print("Hello, you are welcome in programm that calculates Quadratic equation! :) \n Enter please A: ")
    a=float(input())
    print("Amazing, next please put B: ")
    b=float(input())
    print("Brilliant, and last one C: ")
    c=float(input())
    return a,b,c

def discriminant(a,b,c):
    return square(b)-4*a*c

def roots(d,a,b,c):
    if d>0:
        root1=(-b+math.sqrt(d))/(2*a)
        root2=(-b-math.sqrt(d))/(2*a)
        print( "d>0 so 2 roots: " + str(root1) + " and " + str(root2) )
    elif d==0:
        root=-b/(2*a)
        print("d=0 so one root: "+str(root))
    else:
        print("Impossible, under zero, maan")

def solv_square(a,b,c):
    d=discriminant(a,b,c)
    roots(d,a,b,c)

def main():
    a,b,c = ask_value()
    solv_square(a,b,c)
main()