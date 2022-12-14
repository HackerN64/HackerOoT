#ifndef CONFIG_SAFEGUARDS_H
#define CONFIG_SAFEGUARDS_H

/*****************************
 * COMPATIBILITY SAFE GUARDS *
 *****************************/

/**
 * NOTE: Only mess with these if you know what you're doing!
 * These are put in place to insure that connected functionality works as intended.
 */

/*****************
 * config_debug.h
 */
#ifndef DEBUG_ROM
    #define DISABLE_DEBUG_FEATURES
    #undef DETERMINISTIC_BUILD
    #undef SKIP_N64_BOOT_LOGO
    #undef BOOT_TO_SCENE
    #undef BOOT_TO_SCENE_NEW_GAME_ONLY
    #undef BOOT_TO_FILE_SELECT
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
#endif

// Remove map select from file 1
#if ((defined BOOT_TO_SCENE && defined BOOT_TO_FILE_SELECT) || (defined DISABLE_DEBUG_FEATURES)) && (!defined ENABLE_MAP_SELECT)
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

// Enable the map select feature if booting to map select
#if (defined BOOT_TO_MAP_SELECT) && !(defined ENABLE_MAP_SELECT)
    #define ENABLE_MAP_SELECT
#endif

// The camera debugger uses the debug heap, which is located in the expanded RAM
#if (defined ENABLE_CAMERA_DEBUGGER) && !(defined ENABLE_DEBUG_HEAP)
    #define ENABLE_DEBUG_HEAP
#endif


/*****************
 * config_game.h
 */

#endif
