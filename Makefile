SRC = src/game.c

CC = clang

CFLAGS = -target armv7a-none-eabi -mcpu=cortex-a9 -mfpu=none \
	 -fno-addrsig -fno-builtin -ffreestanding\
	 -fverbose-asm \
	 -Wall \
	-S
CFLAGS_DEBUG = $(CFLAGS) -O0
CFLAGS_RELEASE = $(CFLAGS) -O3


OUT = build/game.s

debug : $(SRC)
	$(CC) $(CFLAGS_DEBUG) $(SRC) -o $(OUT)

release : $(SRC)
	$(CC) $(CFLAGS_RELEASE) $(SRC) -o $(OUT)