#include <stdbool.h>
#include <stdint.h>

// -- TEXT --
// addresses of the text buffer
static char *TEXT_BUFFER = (char *)0xc9000000;
static char *CHARBUF = (char *)0xc9000000;

static const uint32_t TEXT_WIDTH = 80;
static const uint32_t TEXT_HEIGHT = 60;




void clear_text_buffer(){
    for (int i = 0; i < TEXT_WIDTH * TEXT_HEIGHT; i++){
        TEXT_BUFFER[i] = ' ';
    }
    return;
}


void draw_string(uint32_t x, uint32_t y, char *string){
    uint32_t i = 0;
    while (string[i] != '\0'){
        TEXT_BUFFER[(y * TEXT_WIDTH) + x + i] = string[i];
        i++;
    }
    return;
}
