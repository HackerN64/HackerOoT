#include "rainbow.h"
#include "macros.h"

/**
 * How to use:
 * - Create a ``Rainbow`` variable (no pointer)
 * - Call ``Rainbow_Init`` in an init function with the address of the variable you just created
 * - Call ``Rainbow_Update`` in an update function with the same address
 * See ``main.c`` and ``game.c`` for the global rainbow implementation.
 */

static RainbowTarget sRainbowTarget[STATE_MAX] = {
    { STATE_YELLOW_TO_GREEN, { 255, 255, 0 } },   { STATE_GREEN_TO_LIGHTBLUE, { 0, 255, 0 } },
    { STATE_LIGHTBLUE_TO_BLUE, { 0, 255, 255 } }, { STATE_BLUE_TO_PINK, { 0, 0, 255 } },
    { STATE_PINK_TO_RED, { 255, 0, 255 } },       { STATE_RED_TO_YELLOW, { 255, 0, 0 } },
};

void Rainbow_Debug(Rainbow* this) {
    PRINTF2("state: %d, r: %d, g: %d, b: %d, speed: %d, sRainbowTarget.state: %d\n", this->state, this->color.r,
            this->color.g, this->color.b, this->speed, sRainbowTarget[this->state].state);
}

void Rainbow_InitColor(Rainbow* this) {
    this->color = sRainbowTarget[this->state].color;
}

void Rainbow_Init(Rainbow* this) {
    this->state = STATE_RED_TO_YELLOW;
    this->speed = 8;
    this->bAllowDebug = false;
    this->bPause = false;
    Rainbow_InitColor(this);
}

u8 Rainbow_CheckColor(Rainbow* this, Color_RGB8 rgb) {
    return ((this->color.r == rgb.r) && (this->color.g == rgb.g) && (this->color.b == rgb.b));
}

void Rainbow_UpdateColor(Rainbow* this) {
    u8* channel = NULL;

    switch (this->state) {
        case STATE_YELLOW_TO_GREEN:
        case STATE_BLUE_TO_PINK:
            channel = &this->color.r;
            break;
        case STATE_RED_TO_YELLOW:
        case STATE_LIGHTBLUE_TO_BLUE:
            channel = &this->color.g;
            break;
        case STATE_GREEN_TO_LIGHTBLUE:
        case STATE_PINK_TO_RED:
            channel = &this->color.b;
            break;
    }

    if (channel != NULL) {
        s16 newValue = (s16)(!(this->state % 2) ? (*channel + this->speed) : (*channel - this->speed));
        *channel = (u8)(newValue > 255 ? 255 : newValue < 0 ? 0 : newValue);
    }
}

void Rainbow_UpdateState(Rainbow* this, RainbowTarget target) {
    if (Rainbow_CheckColor(this, target.color)) {
        this->state = target.state;
    }
}

void Rainbow_Update(Rainbow* this) {
    if (!this->bPause) {
        Rainbow_UpdateColor(this);
        Rainbow_UpdateState(this, sRainbowTarget[this->state]);

        if (this->bAllowDebug) {
            Rainbow_Debug(this);
        }
    }
}
