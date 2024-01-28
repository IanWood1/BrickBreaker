#ifndef VGA_H
#define VGA_H

#include <stdint.h>

#define PIX_BUFFER_1 (uint16_t *)0x0f000000
#define PIX_BUFFER_2 (uint16_t *)0xc8000000
#define BUFFER_REG (volatile uint16_t **)0xFF203020
#define BACK_BUFFER_REG (volatile uint16_t **)0xFF203024
#define STATUS_REG (volatile char *)0xFF20302C
#define PIX_WIDTH (uint32_t)320
#define PIX_HEIGHT (uint32_t)240
uint16_t *pixel_buffer;


// Struct representing a pixel map
// The following offsets come from original assembly:
    // PIXMAP_WIDTH offset 0;
    // PIXMAP_HEIGHT offset 2;
    // PIXMAP_TRANSPARENCY offset 4
    // PIXMAP_PIXELDATA offset 6
// members are packed and struct is aligned to 4 bytes
typedef struct pixmap
{
    uint16_t width;
    uint16_t height;
    uint16_t transparency;
    uint16_t pixel_data[];
} __attribute__ ((packed, aligned(4))) pixmap_t;

// void bit_blit();
// void clear_vga();
// void swap_vga_buffers();

void setup_vga_buffers()
{
    pixel_buffer = PIX_BUFFER_1;
    volatile uint16_t ** back_buffer_reg = BACK_BUFFER_REG;
    volatile uint16_t ** buffer_reg = BUFFER_REG;
    *back_buffer_reg = PIX_BUFFER_2;
    *buffer_reg = PIX_BUFFER_2;
    // *BACK_BUFFER_REG = PIX_BUFFER_2;
    // *BUFFER_REG = PIX_BUFFER_2;
    volatile char * volatile status_reg = STATUS_REG;
    while (*status_reg & 1)
    {
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


void bit_blit(pixmap_t* pixmap, uint32_t x, uint32_t y){
    if(pixmap->width == 0 || pixmap->height == 0){
        return;
    }

    uint32_t start_x = x - pixmap->width/2;
    uint32_t start_y = y - pixmap->height/2;

    for(uint32_t i = 0; i < pixmap->width; i++){
        for(uint32_t j = 0; j < pixmap->height; j++){
            if(start_x+i >= PIX_WIDTH || start_y+j >= PIX_HEIGHT){
                continue;
            }

            uint16_t pixel = pixmap->pixel_data[j*pixmap->width + i];
            if(pixel != pixmap->transparency){
                pixel_buffer[((start_y+j) << 9) + (start_x+i)] = pixel;
            }
        }
    }
}





#endif // VGA_H