#include <stdbool.h>
#include <stdint.h>

extern uint32_t *const PIX_BUFFER;
static uint32_t *const PIX_BUFFER_1 = (uint32_t *)0xf000000;
static uint32_t *const PIX_BUFFER_2 = (uint32_t *)0xc8000000;
static char *TEXT_BUFFER = (char *)0xc9000000;
static char *CHARBUF = (char *)0xc9000000;
static uint32_t **BUFFER_REG = (uint32_t **)0xFF203020;
static uint32_t **BACK_BUFFER_REG = (uint32_t **)0xFF203024;
static bool *STATUS_REG = (bool *)0xFF20302C;
static uint8_t *KEY_LOC = (uint8_t *)0xff200100;

static const uint32_t TEXT_WIDTH = 80;
static const uint32_t TEXT_HEIGHT = 60;

static const uint32_t PIX_WIDTH = 320;
static const uint32_t PIX_HEIGHT = 240;

// These are some useful defines that will help you access structure fields
// static PIXMAP_WIDTH = 0;
// static PIXMAP_HEIGHT = 2;
// static PIXMAP_TRANSPARENCY = 4;
// static PIXMAP_PIXELDATA = 6;

// static SPRITE_XPOS = 0; // 2 byte int
// static SPRITE_YPOS = 2; // 2 byte int
// static SPRITE_XVEL = 4; // 2 byte int
// static SPRITE_YVEL = 6; // 2 byte int
// static SPRITE_BB_WIDTH = 8; // 2 byte uint
// static SPRITE_BB_HEIGHT = 10; // 2 byte uint
// static SPRITE_PIXMAP =12; // 4 byte pointer
// static SPRITE_TYPE = 16; // 1 byte

void ClearVGA(int32_t color)
{
    uint32_t i;
    for (i = 0; i < PIX_WIDTH * PIX_HEIGHT; i++)
    {
        PIX_BUFFER[i] = color;
    }
}