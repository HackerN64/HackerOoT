#ifndef CONFIG_DEBUG_FEATURES_H
#define CONFIG_DEBUG_FEATURES_H

/******************
 * DEBUG FEATURES *
 ******************/

/**
 * Enable or disable debug rom's features
 * See `config_debug_controls.h` for controls
 */

// -------------------------------------------

/**
 * General features
 */

/**** [DEBUG HEAP] ****/
// #define ENABLE_DEBUG_HEAP

// The memory space to allocate for the debug heap (used by the Camera Debugger)
// Note: it can't be higher than 0x800000 with the Expansion Pak
// Note: if the Expansion Pak is missing the heap's size will be 0x400
#define DEBUG_HEAP_SIZE 0x600000

/**** [NO CLIP] ****/
#define ENABLE_NO_CLIP

/**** [INPUT DISPLAY] ****/
// #define SHOW_INPUT_DISPLAY

/**** [CUTSCENE FEATURES] ****/
// #define SHOW_CS_INFOS
// #define ENABLE_CS_CONTROL

// Allow skip on the title screen (if using ``ENABLE_CS_CONTROL``)
#define CS_CTRL_SKIP_TITLE_SCREEN false

/**** [TIME INFORMATIONS] ****/
// #define SHOW_TIME_INFOS

/**** [FRAMERATE OPTIONS] ****/
// TODO: check for frame advance for drawing, improve how it works
// #define ENABLE_FRAMERATE_OPTIONS

/**** [MAP SELECT] ****/
#define ENABLE_MAP_SELECT

/**** [DEBUG FILE 1] ****/
#define ENABLE_DEBUG_SAVE

/**** [TEST SCENES] ****/
// #define INCLUDE_TEST_SCENES

// -------------------------------------------

/**
 * In-game editors
 */

/**** [INVENTORY EDITOR] ****/
// #define ENABLE_INV_EDITOR

/**** [EVENT EDITOR] ****/
// #define ENABLE_EVENT_EDITOR

/**** [REGISTERS EDITOR] ****/
// #define ENABLE_REG_EDITOR

// -------------------------------------------

/**
 * In-game debuggers
 */

/**** [CAMERA DEBUGGER] ****/
// Includes a cutscene debugger/exporter
// #define ENABLE_CAMERA_DEBUGGER

/**** [AUDIO DEBUGGER] ****/
// #define ENABLE_AUDIO_DEBUGGER // TODO: controls

/**** [ACTOR DEBUGGER] ****/
// #define ENABLE_ACTOR_DEBUGGER

/**** [MESSAGES DEBUGGER] ****/
// #define ENABLE_MSG_DEBUGGER // TODO: a better debugger, for now use the regs editor to change the text id (YREG(79))

/**** [SPEEDMETER] ****/
// This looks like a profiler
// #define ENABLE_SPEEDMETER

#endif
