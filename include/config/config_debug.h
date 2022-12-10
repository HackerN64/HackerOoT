#ifndef CONFIG_BOOTUP_H
#define CONFIG_BOOTUP_H

#include "config_debug_toggles.h"
#include "config_debug_controls.h"

/******************
 * DEBUG SETTINGS *
 ******************/

/**
 * All settings here will only be applied if DEBUG_ROM is defined.
 * See the Makefile to toggle this on or off.
 */

/**
 * Avoids code that may be compiled differently between builds, such as using `__DATE__`, `__TIME__`, `__FILE__`, or `__LINE__`.
 */
// #define DETERMINISTIC_BUILD

/**
 * Skips the N64 logo and boots directly into the game if defined (may already be skipped by the options below)
 */
// #define SKIP_N64_BOOT_LOGO

/**
 * Options for booting directly into a scene, the map select or the file select, instead of the title screen.
 */
// #define BOOT_TO_SCENE
// #define BOOT_TO_SCENE_NEW_GAME_ONLY
// #define BOOT_TO_FILE_SELECT
// #define BOOT_TO_MAP_SELECT

// Change these if using `BOOT_TO_SCENE`, `BOOT_TO_SCENE_NEW_GAME_ONLY` or `BOOT_TO_MAP_SELECT`
#define BOOT_ENTRANCE ENTR_DEKU_TREE_0
#define BOOT_AGE LINK_AGE_CHILD
#define BOOT_CUTSCENE 0x0000

// Change these if using `BOOT_TO_SCENE` or `BOOT_TO_SCENE_NEW_GAME_ONLY`
#define BOOT_TIME NEXT_TIME_NONE
#define BOOT_PLAYER_NAME 0x15, 0x12, 0x17, 0x14, 0x3E, 0x3E, 0x3E, 0x3E // "LINK"

/**
 * Enable/Disable BGM on Map Select
 */
#define MAP_SELECT_BGM NA_BGM_OWL

/**
 * Fix a crash if you spawn in a grotto without using the grotto actor
 */
// #define FIX_GROTTO_CRASH

/**
 * Enable mempak-related code
 */
// #define ENABLE_MEMPAK

/**
 * Disable every debug features
 */
// #define DISABLE_DEBUG_FEATURES

/**
 * Disable autoscroll on crash debugger
*/
#define DISABLE_CRASH_DBG_AUTOSCROLL

// -------------------------------------------

// TODO: find a better way to do that
#ifndef DEBUG_ROM
#define DISABLE_DEBUG_FEATURES
#endif

#ifdef DISABLE_DEBUG_FEATURES
#undef SHOW_CS_INFOS
#undef SHOW_INPUT_DISPLAY
#undef SHOW_TIME_INFOS
#undef INCLUDE_TEST_SCENES
#undef ENABLE_NO_CLIP
#undef ENABLE_CS_CONTROL
#undef ENABLE_FRAMERATE_OPTIONS
#undef ENABLE_MAP_SELECT
#undef ENABLE_INV_EDITOR
#undef ENABLE_EVENT_EDITOR
#undef ENABLE_REG_EDITOR
#undef ENABLE_CAMERA_DEBUGGER
#undef ENABLE_AUDIO_DEBUGGER
#undef ENABLE_ACTOR_DEBUGGER
#undef ENABLE_MSG_DEBUGGER
#undef ENABLE_DEBUG_SAVE
#undef ENABLE_MEMPAK
#endif

// Remove map select from file 1
#if (defined BOOT_TO_SCENE && defined BOOT_TO_FILE_SELECT) || (!defined ENABLE_MAP_SELECT) || (defined DISABLE_DEBUG_FEATURES)
#define DEBUG_FILE_1
#endif

// Remove actor and camera debug draw-related code if both are disabled
#if !(defined ENABLE_ACTOR_DEBUGGER) && !(defined ENABLE_CAMERA_DEBUGGER)
#define NO_DEBUG_DISPLAY
#endif

// The camera debugger needs mempak functions for the cutscene exporter
#if (defined ENABLE_CAMERA_DEBUGGER) && !(defined ENABLE_MEMPAK)
#define ENABLE_MEMPAK
#endif

#endif
