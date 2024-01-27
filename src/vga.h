#ifndef VGA_H
#define VGA_H

#include <stdint.h>

uint16_t * pixel_buffer;

// -- VGA --
// addresses of the pixel buffers
static uint16_t *const PIX_BUFFER_1 = (uint16_t *)0x0f000000;
static uint16_t *const PIX_BUFFER_2 = (uint16_t *)0xc8000000;

static uint16_t **BUFFER_REG = (uint16_t **)0xFF203020;
static uint16_t **BACK_BUFFER_REG = (uint16_t **)0xFF203024;
static volatile bool *STATUS_REG = (bool *)0xFF20302C;

static const uint32_t PIX_WIDTH = 320;
static const uint32_t PIX_HEIGHT = 240;




// void bit_blit();
// void clear_vga();
// void swap_vga_buffers();

void setup_vga_buffers(){
    pixel_buffer = PIX_BUFFER_1;

    *BACK_BUFFER_REG = PIX_BUFFER_2;
    *BUFFER_REG = PIX_BUFFER_2;

    while(*STATUS_REG & 0x1){
        // wait for vga to be ready
    }

    // place current write buffer in the back buffer
    *BACK_BUFFER_REG = pixel_buffer;
}



void clear_vga(int16_t color)
{
    for (uint32_t x = 0; x < PIX_WIDTH; x++)
    {
        for (uint32_t y = 0; y < PIX_HEIGHT; y++)
        {
            // Note: buffer isn't stored contiguously in memory
            pixel_buffer[(y << 9) + x] = color;
        }
    }
}















#endif // VGA_H