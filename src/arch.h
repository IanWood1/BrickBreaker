#ifndef ARCH_H
#define ARCH_H
#include <stdbool.h>
#include <stdint.h>

// Contains architecture specific definitions/constants



// -- TEXT --
// addresses of the text buffer
static char *TEXT_BUFFER = (char *)0xc9000000;
static char *CHARBUF = (char *)0xc9000000;

static const uint32_t TEXT_WIDTH = 80;
static const uint32_t TEXT_HEIGHT = 60;

// -- KEYBOARD --
// address of the key register
static uint8_t *KEY_LOC = (uint8_t *)0xff200100;



#endif // ARCH_H
