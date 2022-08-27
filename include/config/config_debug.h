#ifndef CONFIG_BOOTUP_H
#define CONFIG_BOOTUP_H

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
 * Options for booting directly into a scene, or the file select, instead of the title screen.
 */
// #define BOOT_TO_SCENE
// #define BOOT_TO_SCENE_NEW_GAME_ONLY
#define BOOT_TO_FILE_SELECT

// Change these if using `BOOT_TO_SCENE` or `BOOT_TO_SCENE_NEW_GAME_ONLY`
#define BOOT_ENTRANCE ENTR_YDAN_0
#define BOOT_AGE LINK_AGE_CHILD
#define BOOT_TIME NEXT_TIME_NONE
#define BOOT_CUTSCENE 0x0000
#define BOOT_PLAYER_NAME 0x15, 0x12, 0x17, 0x14, 0x3E, 0x3E, 0x3E, 0x3E // "LINK"

/**
 * Enable fast text
 */
#define ENABLE_FAST_TEXT

/**
 * Remove debug scenes
 */
#define NO_DEBUG_SCENES

/**
 * Enable in-game inventory editor
 */
// #define ENABLE_INV_EDITOR

/**
 * Enable in-game event editor
 */
// #define ENABLE_EVENT_EDITOR

/**
 * Enable in-game registers editor
 */
#define ENABLE_REG_EDITOR

/**
 * Enable map select
 */
// #define ENABLE_MAP_SELECT

/**
 * Enable camera debugger (includes a cutscene debugger/exporter)
 */
// #define ENABLE_CAMERA_DEBUGGER

/**
 * Enable audio debugger
 */
// #define ENABLE_AUDIO_DEBUGGER

/**
 * Enable actor debugger
 */
// #define ENABLE_ACTOR_DEBUGGER

/**
 * Enable messages (texts/dialogs) debugger
 */
// #define ENABLE_MSG_DEBUGGER

/**
 * Change language with D-Pad on file choose (controller 1)
 */
// D-Pad Left: English, D-Pad Up: German, D-Pad Right: French
// #define CHANGE_LANGUAGE_DPAD

/**
 * Show cutscene debug informations
 */
// #define SHOW_CS_INFOS

/**
 * Show time debug informations
 */
// #define SHOW_TIME_INFOS

/**
 * Show in-game input display
 */
// #define SHOW_INPUT_DISPLAY

/**
 * No map select on file 1
 */
// #define FILE_1_NORMAL

// Remove map select from file 1
#if (defined BOOT_TO_SCENE && defined BOOT_TO_FILE_SELECT) || (!defined ENABLE_MAP_SELECT)
#define FILE_1_NORMAL
#endif

// Remove actor and camera debug draw-related code if both are disabled
#if !(defined ENABLE_ACTOR_DEBUGGER) && !(defined ENABLE_CAMERA_DEBUGGER)
#define NO_DEBUG_DISPLAY
#endif

#endif
