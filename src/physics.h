#ifndef PHYSICS_H
#define PHYSICS_H

#include <stdint.h>
#include <stddef.h>

#include "vga.h"

// static SPRITE_XPOS = 0; // 2 byte int
// static SPRITE_YPOS = 2; // 2 byte int
// static SPRITE_XVEL = 4; // 2 byte int
// static SPRITE_YVEL = 6; // 2 byte int
// static SPRITE_BB_WIDTH = 8; // 2 byte uint
// static SPRITE_BB_HEIGHT = 10; // 2 byte uint
// static SPRITE_PIXMAP =12; // 4 byte pointer
// static SPRITE_TYPE = 16; // 1 byte

#define PADDLE_TYPE 1
#define BALL_TYPE 2
#define BRICK_TYPE 3



typedef struct sprite
{
    // position/velocity
    int16_t x;
    int16_t y;
    int16_t xvel;
    int16_t yvel;

    // bounding box
    uint16_t bb_width;
    uint16_t bb_height;

    // pixmap
    pixmap_t *pixmap;

    // type
    uint8_t type;
}  sprite_t;

extern sprite_t* SpriteList[];
extern  uint32_t CollisionCounter;
extern  uint32_t num_blocks;
extern pixmap_t EmptyPixMap;


void apply_movement(sprite_t *sprite)
{
    sprite->x += sprite->xvel;
    sprite->y += sprite->yvel;
}

// Optimization opportunity here since balls only collide with paddles/bricks
void detect_collision(){
    for(int i = 0; SpriteList[i] != NULL; i++){
        for(int j = i; SpriteList[j] != NULL; j++){
            sprite_t *sprite1 = SpriteList[i];
            sprite_t *sprite2 = SpriteList[j];
            if(sprite1 != sprite2){
                // Now check for collision
                uint16_t sprite2_bb_left = sprite2->x - sprite2->bb_width/2;
                uint16_t sprite2_bb_right = sprite2->x + sprite2->bb_width/2;
                uint16_t sprite2_bb_top = sprite2->y - sprite2->bb_height/2;
                uint16_t sprite2_bb_bottom = sprite2->y + sprite2->bb_height/2;

                uint16_t sprite1_bb_left = sprite1->x - sprite1->bb_width/2;
                uint16_t sprite1_bb_right = sprite1->x + sprite1->bb_width/2;
                uint16_t sprite1_bb_top = sprite1->y - sprite1->bb_height/2;
                uint16_t sprite1_bb_bottom = sprite1->y + sprite1->bb_height/2;

                if(sprite1_bb_left > sprite2_bb_right){
                    // sprite1 is to the right of sprite2
                    continue;
                }

                if(sprite1_bb_right < sprite2_bb_left){
                    // sprite1 is to the left of sprite2
                    continue;
                }

                if(sprite1_bb_top > sprite2_bb_bottom){
                    // sprite1 is below sprite2
                    continue;
                }

                if(sprite1_bb_bottom < sprite2_bb_top){
                    // sprite1 is above sprite2
                    continue;
                }

                // If we get here, we have a collision
                CollisionCounter++;

                if(sprite1->type == PADDLE_TYPE || sprite2->type == PADDLE_TYPE){
                    sprite_t *ball = sprite1->type == BALL_TYPE ? sprite1 : sprite2;
                    ball->yvel = -ball->yvel;
                }else if(sprite1->type == BRICK_TYPE || sprite2->type == BRICK_TYPE){
                    sprite_t *ball = sprite1->type == BALL_TYPE ? sprite1 : sprite2;
                    sprite_t *brick = sprite1->type == BRICK_TYPE ? sprite1 : sprite2;
                    ball->yvel = -ball->yvel;

                    // Destroy brick
                    brick->type = 0;
                    brick->pixmap = &EmptyPixMap;
                    brick->bb_width = 0;
                    brick->bb_height = 0;

                    num_blocks--;

                }
            }
        }
    }
}

#endif // PHYSICS_H
