#ifndef CONFIG_DEBUG_TOGGLES_H
#define CONFIG_DEBUG_TOGGLES_H

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

/**** [NO CLIP] ****/
// #define ENABLE_NO_CLIP

/**** [INPUT DISPLAY] ****/
// #define SHOW_INPUT_DISPLAY

/**** [CUTSCENE FEATURES] ****/
#define SHOW_CS_INFOS
// #define ENABLE_CS_CONTROL

// Allow skip on the title screen (if using ``ENABLE_CS_CONTROL``)
#define CS_CTRL_SKIP_TITLE_SCREEN false

/**** [TIME INFORMATIONS] ****/
#define SHOW_TIME_INFOS

/**** [FRAMERATE OPTIONS] ****/
// TODO: check for frame advance for drawing, improve how it works
#define ENABLE_FRAMERATE_OPTIONS

/**** [MAP SELECT] ****/
// #define ENABLE_MAP_SELECT

/**** [TEST SCENES] ****/
#define NO_DEBUG_SCENES

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
// #define ENABLE_AUDIO_DEBUGGER

/**** [ACTOR DEBUGGER] ****/
// #define ENABLE_ACTOR_DEBUGGER

/**** [MESSAGES DEBUGGER] ****/
#define ENABLE_MSG_DEBUGGER

#endif