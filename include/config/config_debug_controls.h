#ifndef CONFIG_DEBUG_CONTROLS_H
#define CONFIG_DEBUG_CONTROLS_H

/**********************
 * CONTROLLER MAPPING *
 **********************/

/**
 * Change the debug features' controls
 */

// -------------------------------------------

/**** [NO CLIP CONTROLS] ****/
// Controller port to use
#define NOCLIP_CONTROLLER_PORT CONTROLLER_PORT_1

// Set to true to use a button combo
#define NOCLIP_USE_BTN_COMBO true
#define NOCLIP_BTN_HOLD_FOR_COMBO BTN_L

// Control to enable no clip
#define NOCLIP_TOGGLE_BTN BTN_DRIGHT

// Control to hold to go faster
#define NOCLIP_FAST_BTN BTN_R

// Controls to move Link up and down
#define NOCLIP_GO_UP BTN_B
#define NOCLIP_GO_DOWN BTN_A

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

// -------------------------------------------

/**** [MAP SELECT CONTROLS] ****/
// Controller port to use
#define MAP_SELECT_CONTROLLER_PORT CONTROLLER_PORT_1

// Set to true to use a button combo
#define MAP_SELECT_BTN_COMBO true
#define MAP_SELECT_BTN_HOLD_FOR_COMBO BTN_L | BTN_R

// Opening the map select
#define MAP_SELECT_OPEN BTN_Z

// -------------------------------------------

/**** [INVENTORY EDITOR CONTROLS] ****/
// Controller port to use
#define INV_EDITOR_CONTROLLER_PORT CONTROLLER_PORT_1

// Set to true to use a button combo
#define INV_EDITOR_BTN_COMBO false
#define INV_EDITOR_BTN_HOLD_FOR_COMBO BTN_Z

// Opening the inventory editor
#define INV_EDITOR_OPEN BTN_L

// -------------------------------------------

/**** [EVENT EDITOR CONTROLS] ****/
// Controller port to use
#define EVENT_EDITOR_CONTROLLER_PORT CONTROLLER_PORT_1

// Set to true to use a button combo
#define EVENT_EDITOR_BTN_COMBO true
#define EVENT_EDITOR_BTN_HOLD_FOR_COMBO BTN_L

// Opening the event editor
#define EVENT_EDITOR_OPEN BTN_CDOWN

// Closing the event editor
#define EVENT_EDITOR_CLOSE BTN_CLEFT

// Next page
#define EVENT_EDITOR_NEXT BTN_R

// Previous page
#define EVENT_EDITOR_PREV BTN_Z

// Change bit value
#define EVENT_EDITOR_CHANGE_VAL BTN_A

// Move to the bit on the left
#define EVENT_EDITOR_GO_LEFT BTN_DLEFT

// Move to the bit on the right
#define EVENT_EDITOR_GO_RIGHT BTN_DRIGHT

// -------------------------------------------

/**** [EVENT EDITOR CONTROLS] ****/
// Controller port to use
#define REGS_EDITOR_CONTROLLER_PORT CONTROLLER_PORT_1

// Increment/Decrement by 10
#define REGS_EDITOR_INCDEC_10 BTN_B

// Increment/Decrement by 100
#define REGS_EDITOR_INCDEC_100 BTN_A

// Increment/Decrement by 1000
#define REGS_EDITOR_INCDEC_1000 BTN_A | BTN_B

#define REGS_EDITOR_REG_COMBO    BTN_L, BTN_CUP         //  REG
#define REGS_EDITOR_SREG_COMBO   BTN_L, BTN_CLEFT       // SREG
#define REGS_EDITOR_OREG_COMBO   BTN_L, BTN_CDOWN       // OREG
#define REGS_EDITOR_PREG_COMBO   BTN_L, BTN_A           // PREG
#define REGS_EDITOR_QREG_COMBO   BTN_R, BTN_CDOWN       // QREG
#define REGS_EDITOR_MREG_COMBO   BTN_L, BTN_CRIGHT      // MREG
#define REGS_EDITOR_YREG_COMBO   BTN_L, BTN_R           // YREG
#define REGS_EDITOR_DREG_COMBO   BTN_L, BTN_DLEFT       // DREG
#define REGS_EDITOR_UREG_COMBO   BTN_L, BTN_DRIGHT      // UREG
#define REGS_EDITOR_IREG_COMBO   BTN_L, BTN_DUP         // IREG
#define REGS_EDITOR_ZREG_COMBO   BTN_L, BTN_B           // ZREG
#define REGS_EDITOR_CREG_COMBO   BTN_L, BTN_Z           // CREG
#define REGS_EDITOR_NREG_COMBO   BTN_L, BTN_DDOWN       // NREG
#define REGS_EDITOR_KREG_COMBO   BTN_R, BTN_A           // KREG
#define REGS_EDITOR_XREG_COMBO   BTN_R, BTN_B           // XREG
#define REGS_EDITOR_cREG_COMBO   BTN_R, BTN_Z           // cREG
#define REGS_EDITOR_sREG_COMBO   BTN_R, BTN_L           // sREG
#define REGS_EDITOR_iREG_COMBO   BTN_R, BTN_CUP         // iREG
#define REGS_EDITOR_WREG_COMBO   BTN_R, BTN_CRIGHT      // WREG
#define REGS_EDITOR_AREG_COMBO   BTN_R, BTN_DLEFT       // AREG
#define REGS_EDITOR_VREG_COMBO   BTN_R, BTN_CLEFT       // VREG
#define REGS_EDITOR_HREG_COMBO   BTN_R, BTN_START       // HREG
#define REGS_EDITOR_GREG_COMBO   BTN_L, BTN_START       // GREG
#define REGS_EDITOR_mREG_COMBO   BTN_R, BTN_DRIGHT      // mREG
#define REGS_EDITOR_nREG_COMBO   BTN_R, BTN_DUP         // nREG
#define REGS_EDITOR_BREG_COMBO   BTN_START, BTN_R       // BREG
#define REGS_EDITOR_dREG_COMBO   BTN_START, BTN_A       // dREG
#define REGS_EDITOR_kREG_COMBO   BTN_START, BTN_B       // kREG
#define REGS_EDITOR_bREG_COMBO   BTN_START, BTN_CRIGHT  // bREG

// -------------------------------------------

/**** [ACTOR DEBUGGER CONTROLS] ****/
// Controller port to use
#define ACTORDBG_CONTROLLER_PORT CONTROLLER_PORT_1

// Set to true to use a button combo
#define ACTORDBG_BTN_COMBO true
#define ACTORDBG_BTN_HOLD_FOR_COMBO BTN_R

// Open/Close the actor debugger
#define ACTORDBG_TOGGLE BTN_L

// Prints info in the IS64 console
#define ACTORDBG_PRINT_INFOS false

// Increase/Decrease path index
#define ACTORDBG_DECR_PATH_IDX BTN_DLEFT
#define ACTORDBG_INCR_PATH_IDX BTN_DRIGHT

// -------------------------------------------

/**** [MESSAGE DEBUGGER CONTROLS] ****/
// Controller port to use
#define MSGDBG_CONTROLLER_PORT CONTROLLER_PORT_1

// Set to true to use a button combo
#define MSGDBG_BTN_COMBO true
#define MSGDBG_BTN_HOLD_FOR_COMBO BTN_L

// Open/Close the actor debugger
#define MSGDBG_TOGGLE BTN_R

#define MSGDBG_OPEN_TEXTBOX BTN_DDOWN

// -------------------------------------------

/**** [CAMERA DEBUGGER CONTROLS] ****/
// Controller port to use
#define CAMDBG_CONTROLLER_PORT CONTROLLER_PORT_1
#define CAMDBG_CSCTRL_UNK_PORT CONTROLLER_PORT_2

// Set to true to play sounds in-game
#define CAMDBG_PLAY_SOUNDS false

// Set to true to use a button combo
#define CAMDBG_BTN_COMBO true
#define CAMDBG_BTN_HOLD_FOR_COMBO BTN_R

// Open/Close the camera debugger
#define CAMDBG_TOGGLE BTN_L

// Play dungeon's target sound
#define CAMDBG_TESTER_PLAY_DUNGEON_TARGET_SOUND BTN_CUP

// Play overworld's target sound
#define CAMDBG_TESTER_PLAY_OVERWORLD_TARGET_SOUND BTN_CDOWN

// Controls for increasing and decreasing the camera setting for the camera tester (see ``Camera_DbgChangeMode``)
#define CAMDBG_TESTER_INCREASE_DISTANCE BTN_DRIGHT
#define CAMDBG_TESTER_DECREASE_SETTING BTN_DLEFT

/* [COMMON CONTROLS] */

// Button to change the tool (camera debug tool, cutscene camera tool and cutscene control)
#define CAMDBG_CHANGE_TOOL BTN_Z

// Increase/Decrease the "distance" value (locks the viewpoint pos)
#define CAMDBG_INCREASE_DISTANCE BTN_B | BTN_L
#define CAMDBG_DECREASE_DISTANCE BTN_A | BTN_L

// Moving the point straigth forward or backward regardless of the viewpoint angle
#define CAMDBG_MOVE_BACKWARD BTN_DDOWN | BTN_L
#define CAMDBG_MOVE_FORWARD BTN_DUP | BTN_L

// Moving the point forward or backward depending on the viewpoint angle
#define CAMDBG_VIEWPOINT_MOVE_BACKWARD BTN_B
#define CAMDBG_VIEWPOINT_MOVE_FORWARD BTN_A

// Moving the point
#define CAMDBG_MOVE_UP BTN_DUP
#define CAMDBG_MOVE_DOWN BTN_DDOWN
#define CAMDBG_MOVE_RIGHT BTN_DRIGHT | BTN_L
#define CAMDBG_MOVE_RIGHT2 BTN_DRIGHT
#define CAMDBG_MOVE_LEFT BTN_DLEFT | BTN_L
#define CAMDBG_MOVE_LEFT2 BTN_DLEFT

#define CAMDBG_UNK_B_L BTN_B | BTN_L
#define CAMDBG_UNK_A_L_2 BTN_A | BTN_L
#define CAMDBG_UNK_A_2 BTN_A
#define CAMDBG_UNK_B_2 BTN_A
#define CAMDBG_UNK_R_L BTN_R | BTN_L
#define CAMDBG_UNK_R BTN_R

// Next menu
#define CAMDBG_NEXT_MENU BTN_CLEFT

/* [CAMERA DEBUG TOOL] */

/* [CUTSCENE CAMERA TOOL] */
// Button to play the cutscene
#define CAMDBG_CSTOOL_INIT_PLAYBACK BTN_CRIGHT
#define CAMDBG_CSTOOL_PLAYBACK BTN_CRIGHT

// Related to playing back the cutscene
#define CAMDBG_CSTOOL_UNK_CRIGHT BTN_CRIGHT

// Cuts the cutscene to the selected keyframe in edit mode
#define CAMDBG_CSTOOL_CUT_USE_COMBO true
#define CAMDBG_CSTOOL_CUT_BTNCOMBO_HOLD BTN_L
#define CAMDBG_CSTOOL_CUT BTN_R

// *** Keyframe Edit Mode ***

#define CAMDBG_CSTOOL_BTN_HOLD_FOR_COMBO BTN_L // used for printing the data and the pos data "copy"

// Saves the currently edited keyframe
#define CAMDBG_CSTOOL_SAVE_EDITED_KEYFRAME BTN_R

// "Copies" the data of the current keyframe to the next/previous one
// (in the code it just increase and decrease the keyframe index)
#define CAMDBG_CSTOOL_COPY_POSDATA_USE_COMBO true
#define CAMDBG_CSTOOL_COPY_POSDATA_PREV_KEYFRAME BTN_CUP
#define CAMDBG_CSTOOL_COPY_POSDATA_NEXT_KEYFRAME BTN_CDOWN

// To choose the keyframe to edit
#define CAMDBG_CSTOOL_EDIT_PREV_KEYFRAME BTN_CUP
#define CAMDBG_CSTOOL_EDIT_NEXT_KEYFRAME BTN_CDOWN

// *** Settings ***

// Change the selected setting
#define CAMDBG_CSTOOL_SETTINGS_PREV BTN_DUP
#define CAMDBG_CSTOOL_SETTINGS_NEXT BTN_DDOWN

// Increments or decrements the value of the selected setting
#define CAMDBG_CSTOOL_SETTINGS_DECR_VALUE BTN_DLEFT
#define CAMDBG_CSTOOL_SETTINGS_INCR_VALUE BTN_DRIGHT

// Changes the value of the setting faster if held
#define CAMDBG_CSTOOL_SETTINGS_FASTER_CHANGE BTN_L

// *** -------- ***

// Dumps "spline" data on the IS64 console
#define CAMDBG_PRINT_DATA_USE_COMBO true
#define CAMDBG_PRINT_DATA BTN_CRIGHT

/* [CUTSCENE CONTORL] */

// To choose the previous/next option
#define CAMDBG_CSCTRL_PREV_CHOICE BTN_DLEFT
#define CAMDBG_CSCTRL_NEXT_CHOICE BTN_DRIGHT

// To change the current menu (export slots & Mempak menus)
#define CAMDBG_CSCTRL_PREV_MENU BTN_DUP
#define CAMDBG_CSCTRL_NEXT_MENU BTN_DDOWN

// Changes the slot to use on the Mempak
#define CAMDBG_CSCTRL_PREV_MEMPAK_FILE BTN_DLEFT
#define CAMDBG_CSCTRL_NEXT_MEMPAK_FILE BTN_DRIGHT

// To confirm a choice or going back to the previous menu
#define CAMDBG_CSCTRL_CONFIRM_CHOICE BTN_A
#define CAMDBG_CSCTRL_RETURN_TO_PREV_MENU BTN_B

// To save or delete the cutscene on the selected slot
// WARNING: there's no confirmation if you want to delete the current export slot's data so be careful
#define CAMDBG_CSCTRL_SAVE_CS BTN_A
#define CAMDBG_CSCTRL_DELETE_CS BTN_B

// cutscene playback from export slots
#define CAMDBG_CSCTRL_PLAY_PREV BTN_CUP
#define CAMDBG_CSCTRL_PLAY_NEXT BTN_CDOWN

// load the cutscene data into the cs camera tool from the selected slot and deletes it
#define CAMDBG_CSCTRL_LOAD_CUR_SLOT BTN_R

// Starts or stops the playback of the selected cutscene slot (if there's any data)
#define CAMDBG_CSCTRL_STOP_PLAYBACK BTN_CLEFT
#define CAMDBG_CSCTRL_START_PLAYBACK BTN_CRIGHT

// Hold and use D-Pad Left/Right to change the location of the selected cutscene slot
#define CAMDBG_CSCTRL_HOLD_TO_CHANGE_SLOT BTN_L

// Hold and press ``CAMDBG_CSCTRL_PRINT_BYTES`` to dump the bytes of the cutscene data (as a C array)
#define CAMDBG_CSCTRL_BTN_HOLD_FOR_COMBO BTN_L
#define CAMDBG_CSCTRL_PRINT_BYTES BTN_CLEFT

#endif
