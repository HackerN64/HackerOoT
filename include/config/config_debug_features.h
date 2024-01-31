#ifndef CONFIG_DEBUG_FEATURES_H
// #define CONFIG_DEBUG_FEATURES_H

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
// #define ENABLE_DEBUG_HEAP false

// The memory space to allocate for the debug heap (used by the Camera Debugger)
// Note: it can't be higher than 0x800000 with the Expansion Pak
// Note: if the Expansion Pak is missing the heap's size will be 0x400
// #define DEBUG_HEAP_SIZE 0x600000

/**** [NO CLIP] ****/
// #define ENABLE_NO_CLIP true

/**** [INPUT DISPLAY] ****/
// #define SHOW_INPUT_DISPLAY false

/**** [CUTSCENE FEATURES] ****/
// #define SHOW_CS_INFOS false
// #define ENABLE_CS_CONTROL false

// Allow skip on the title screen (if using ``ENABLE_CS_CONTROL``)
// #define CS_CTRL_SKIP_TITLE_SCREEN false

/**** [TIME INFORMATIONS] ****/
// #define SHOW_TIME_INFOS false

/**** [FRAMERATE OPTIONS] ****/
// TODO: check for frame advance for drawing, improve how it works
// #define ENABLE_FRAMERATE_OPTIONS false

/**** [MAP SELECT] ****/
#define ENABLE_MAP_SELECT false

/**** [DEBUG FILE 1] ****/
// #define ENABLE_DEBUG_SAVE true

/**** [TEST SCENES] ****/
// #define INCLUDE_TEST_SCENES false

// -------------------------------------------

/**
 * In-game editors
 */

/**** [INVENTORY EDITOR] ****/
// #define ENABLE_INV_EDITOR false

/**** [EVENT EDITOR] ****/
// #define ENABLE_EVENT_EDITOR false

/**** [REGISTERS EDITOR] ****/
// #define ENABLE_REG_EDITOR false

// -------------------------------------------

/**
 * In-game debuggers
 */

/**** [CAMERA DEBUGGER] ****/
// Includes a cutscene debugger/exporter
// #define ENABLE_CAMERA_DEBUGGER false

/**** [AUDIO DEBUGGER] ****/
// #define ENABLE_AUDIO_DEBUGGER false

/**** [ACTOR DEBUGGER] ****/
// #define ENABLE_ACTOR_DEBUGGER false

/**** [MESSAGES DEBUGGER] ****/
// #define ENABLE_MSG_DEBUGGER false

/**** [SPEEDMETER] ****/
// This looks like a profiler
// #define ENABLE_SPEEDMETER false

#endif
