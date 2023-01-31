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
#define SKIP_N64_BOOT_LOGO

/**
 * Options for booting directly into a scene, the map select or the file select, instead of the title screen.
 */
// #define BOOT_TO_SCENE
// #define BOOT_TO_SCENE_NEW_GAME_ONLY
// #define BOOT_TO_FILE_SELECT
// #define BOOT_TO_MAP_SELECT

/**
 * Use file 1 to load the map select from the file select
 * Note: using this will automatically enable the map select
*/
// #define MAP_SELECT_ON_FILE_1

// Change these if using `BOOT_TO_SCENE`, `BOOT_TO_SCENE_NEW_GAME_ONLY` or `BOOT_TO_MAP_SELECT`
#define BOOT_ENTRANCE ENTR_DEKU_TREE_0
#define BOOT_AGE LINK_AGE_ADULT
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
 * Disable every debug feature
 * This will enable Jumper pak compatibility
 */
// #define DISABLE_DEBUG_FEATURES

#endif
