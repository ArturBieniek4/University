import matplotlib.pyplot as plt
import matplotlib.animation as anim
import numpy as np
import random
import time

board_size = 25
num_obstacles = 10
snake_length = 6

directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
obstacles = []
board = [[0 for x in range(board_size)] for y in range(board_size)]
for _ in range(num_obstacles):
    x, y = random.randint(0, board_size - 1), random.randint(0, board_size - 1)
    board[x][y] = 1
    obstacles.append((x,y))
snake = [(board_size // 2, board_size // 2 - i) for i in range(snake_length)]
direction = random.choice(directions)
game_over = False

def move():
    global game_over, direction
    if game_over:
        return

    head_x, head_y = snake[0]
    move_x, move_y = direction
    new_head = ((head_x + move_x)%board_size, (head_y + move_y)%board_size)

    if (new_head in snake or board[new_head[0]][new_head[1]] == 1):
        game_over = True
        return

    snake.insert(0, new_head)
    if len(snake) > snake_length:
        snake.pop()

    if random.random() < 0.3:
        direction = random.choice([x for x in directions if x[0]*direction[0]+x[1]*direction[1]==0])

def update(useless):
    global snake_x, snake_y
    if game_over:
        return

    move()
    if game_over:
        print("Game Over!")
    else:
        snake_x, snake_y = zip(*snake)
        scat.set_offsets(np.c_[snake_y, snake_x])
    return scat

fig, ax = plt.subplots()
ax.set_xlim(-0.5, board_size - 0.5)
ax.set_ylim(-0.5, board_size - 0.5)
ax.grid(True)
for x, y in obstacles:
    ax.add_patch(plt.Rectangle((y - 0.5, x - 0.5), 1, 1, color="red"))

snake_x, snake_y = zip(*snake)
scat = ax.scatter(snake_y, snake_x, c="green", s=100)
a = anim.FuncAnimation(fig, update, frames=100000, repeat=False)
plt.show()