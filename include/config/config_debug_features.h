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
// ``IS_DEBUG_HEAP_ENABLED``
#define ENABLE_DEBUG_HEAP false

// The memory space to allocate for the debug heap (used by the Camera Debugger)
// Note: it can't be higher than 0x800000 with the Expansion Pak
// Note: if the Expansion Pak is missing the heap's size will be 0x400
#define DEBUG_HEAP_SIZE 0x600000

/**** [NO CLIP] ****/
// ``IS_NO_CLIP_ENABLED``
#define ENABLE_NO_CLIP true

/**** [INPUT DISPLAY] ****/
// ``CAN_SHOW_INPUT_DISPLAY``
#define SHOW_INPUT_DISPLAY false

/**** [CUTSCENE FEATURES] ****/
// ``CAN_SHOW_CS_INFOS``
#define SHOW_CS_INFOS false
// ``IS_CS_CONTROL_ENABLED``
#define ENABLE_CS_CONTROL false

// Allow skip on the title screen (if using ``ENABLE_CS_CONTROL``)
// ``CS_CAN_SKIP_TITLE_SCREEN``
#define CS_CTRL_SKIP_TITLE_SCREEN false

/**** [TIME INFORMATIONS] ****/
// ``CAN_SHOW_TIME_INFOS``
#define SHOW_TIME_INFOS false

/**** [FRAMERATE OPTIONS] ****/
// TODO: check for frame advance for drawing, improve how it works
// ``ARE_FRAMERATE_OPTIONS_ENABLED``
#define ENABLE_FRAMERATE_OPTIONS false

/**** [MAP SELECT] ****/
// ``IS_MAP_SELECT_ENABLED``
#define ENABLE_MAP_SELECT true

/**** [DEBUG FILE 1] ****/
// ``IS_DEBUG_SAVE_ENABLED``
#define ENABLE_DEBUG_SAVE true

/**** [TEST SCENES] ****/
// ``CAN_INCLUDE_TEST_SCENES``
#define INCLUDE_TEST_SCENES false

// -------------------------------------------

/**
 * In-game editors
 */

/**** [INVENTORY EDITOR] ****/
// ``IS_INV_EDITOR_ENABLED``
#define ENABLE_INV_EDITOR true

/**** [EVENT EDITOR] ****/
// ``IS_EVENT_EDITOR_ENABLED``
#define ENABLE_EVENT_EDITOR false

/**** [REGISTERS EDITOR] ****/
// ``IS_REG_EDITOR_ENABLED``
#define ENABLE_REG_EDITOR false

// -------------------------------------------

/**
 * In-game debuggers
 */

/**** [CAMERA DEBUGGER] ****/
// ``IS_CAMERA_DEBUG_ENABLED``
// Includes a cutscene debugger/exporter
#define ENABLE_CAMERA_DEBUGGER false

/**** [AUDIO DEBUGGER] ****/
// ``IS_AUDIO_DEBUG_ENABLED``
#define ENABLE_AUDIO_DEBUGGER false

/**** [ACTOR DEBUGGER] ****/
// ``IS_ACTOR_DEBUG_ENABLED``
#define ENABLE_ACTOR_DEBUGGER false

/**** [MESSAGES DEBUGGER] ****/
// ``IS_MSG_DEBUG_ENABLED``
#define ENABLE_MSG_DEBUGGER false

#endif
