#include <stdbool.h>
#include <stdint.h>

#include "arch.h"
#include "vga.h"

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

// entry point into program
void _start(){
    pixel_buffer = PIX_BUFFER_1;
    while(true){
        clear_vga(0x0000);
    }
}


