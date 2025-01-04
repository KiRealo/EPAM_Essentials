import sys
import time

map = [
    [1,0,1,1,1],
    [1,0,0,1,1],
    [1,1,0,1,1],
    [1,2,0,1,1]
]

def showmap():
    print()
    for row in map:
        for item in row:
            print(item, end="")
        print()

def action(x,y):
    if x < 0 or y < 0 or x >=len(map) or y >= len(map[0]):
        return
    if(map[x][y] == 2):
        print("You Won")
        showmap()
        sys.exit()
    if(map[x][y] == 0):
        map[x][y]='*'
        time.sleep(1)
        step(x,y)

def step(x,y):
    # showmap()
    action(x+1, y)
    action(x-1, y)
    action(x, y+1)
    action(x ,y-1)

# print(map[1][2])
step(1,1)