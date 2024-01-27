SRC = src/game.c

CC = clang

CFLAGS = -target armv7a-none-eabi -mcpu=cortex-a9 -mfpu=neon-fp16 \
	-fno-slp-vectorize \
	-fno-addrsig \
	-S
CFLAGS_DEBUG = $(CFLAGS) -O0
CFLAGS_RELEASE = $(CFLAGS) -O3


OUT = build/game.s

debug : $(SRC)
	$(CC) $(CFLAGS_DEBUG) $(SRC)-o $(OUT)

release : $(SRC)
	$(CC) $(CFLAGS_RELEASE) $(SRC) -o $(OUT)