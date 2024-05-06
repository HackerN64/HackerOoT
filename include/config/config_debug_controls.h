#ifndef CONFIG_DEBUG_CONTROLS_H
#define CONFIG_DEBUG_CONTROLS_H

/**********************
 * CONTROLLER MAPPING *
 **********************/

/**
 * Change the debug features' controls
 */

// -------------------------------------------

/**** [CUTSCENE FEATURES] ****/
// Controller port to use
#define CS_CTRL_CONTROLLER_PORT CONTROLLER_PORT_1

// Set to true to use a button combo
#define CS_CTRL_USE_BTN_COMBO true
#define CS_CTRL_BTN_HOLD_FOR_COMBO BTN_Z

// Control to stop the current cutscene
#define CS_CTRL_STOP_CONTROL BTN_DRIGHT

// Control to restart the cutscene
#define CS_CTRL_RESTART_CONTROL BTN_DUP

// Control to restart the cutscene
// without the camera commands (the camera will follow the player)
#define CS_CTRL_RESTART_NO_CAMERA_CONTROL BTN_DLEFT

// Control to execute the cutscene destination command
// (currently called "terminator")
#define CS_CTRL_RUN_DEST_CONTROL BTN_START

// -------------------------------------------

/**** [FRAME ADVANCE CONTROLS] ****/
// Controller port to use
#define FA_CONTROLLER_PORT CONTROLLER_PORT_1

// Set to true to use a button combo
#define FA_USE_BTN_COMBO true
#define FA_BTN_HOLD_FOR_COMBO BTN_R

// Pausing
#define FA_PAUSE_CONTROL BTN_DDOWN

// Frame advancing
#define FA_CONTROL BTN_DUP

#endif
