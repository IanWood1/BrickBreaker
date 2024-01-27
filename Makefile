TARGET = game

SRC = game.c

CC = clang

CFLAGS = -target armv7a-none-eabi -mcpu=cortex-a5 -S -O0

OUT = $(TARGET).s

# The rule to make the target
$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(OUT)
