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
#if RELEASE_ROM
    #undef SKIP_N64_BOOT_LOGO
    #undef BOOT_TO_SCENE
    #undef BOOT_TO_SCENE_NEW_GAME_ONLY
    #undef BOOT_TO_FILE_SELECT
    #undef DISABLE_DEBUG_FEATURES

    #define SKIP_N64_BOOT_LOGO false
    #define BOOT_TO_SCENE false
    #define BOOT_TO_SCENE_NEW_GAME_ONLY false
    #define BOOT_TO_FILE_SELECT false
    #define DISABLE_DEBUG_FEATURES true
#endif

#if DISABLE_DEBUG_FEATURES
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
    #undef MAP_SELECT_ON_FILE_1
    #undef ENABLE_DEBUG_HEAP
    #undef INCLUDE_EXAMPLE_SCENE
    #undef ENABLE_MOTION_BLUR_DEBUG
    #undef ENABLE_GAME_PRINTF
    #undef ENABLE_GAME_LOGS

    #define SHOW_CS_INFOS false
    #define SHOW_INPUT_DISPLAY false
    #define SHOW_TIME_INFOS false
    #define INCLUDE_TEST_SCENES false
    #define ENABLE_NO_CLIP false
    #define ENABLE_CS_CONTROL false
    #define ENABLE_FRAMERATE_OPTIONS false
    #define ENABLE_MAP_SELECT false
    #define ENABLE_INV_EDITOR false
    #define ENABLE_EVENT_EDITOR false
    #define ENABLE_REG_EDITOR false
    #define ENABLE_CAMERA_DEBUGGER false
    #define ENABLE_AUDIO_DEBUGGER false
    #define ENABLE_ACTOR_DEBUGGER false
    #define ENABLE_MSG_DEBUGGER false
    #define ENABLE_DEBUG_SAVE false
    #define MAP_SELECT_ON_FILE_1 false
    #define ENABLE_DEBUG_HEAP false
    #define INCLUDE_EXAMPLE_SCENE false
    #define ENABLE_MOTION_BLUR_DEBUG false
    #define ENABLE_GAME_PRINTF false
    #define ENABLE_GAME_LOGS false
#endif


// Remove actor and camera debug draw-related code if both are disabled
#ifndef NO_DEBUG_DISPLAY
    #if !ENABLE_ACTOR_DEBUGGER && !ENABLE_CAMERA_DEBUGGER
        #define NO_DEBUG_DISPLAY true
    #else
        #define NO_DEBUG_DISPLAY false
    #endif
#endif

// The camera debugger needs mempak functions for the cutscene exporter
#if ENABLE_CAMERA_DEBUGGER && !ENABLE_MEMPAK
    #undef ENABLE_MEMPAK
    #define ENABLE_MEMPAK true
#endif

// Enable the map select feature if booting to map select or using map select for file 1
#if (BOOT_TO_MAP_SELECT || MAP_SELECT_ON_FILE_1) && !ENABLE_MAP_SELECT
    #undef ENABLE_MAP_SELECT
    #define ENABLE_MAP_SELECT true
#endif

// Remove map select from file 1
#if !ENABLE_MAP_SELECT
    #undef MAP_SELECT_ON_FILE_1
    #define MAP_SELECT_ON_FILE_1 false
#endif

// The camera debugger uses the debug heap, which is located in the expanded RAM
#if ENABLE_CAMERA_DEBUGGER && !ENABLE_DEBUG_HEAP
    #undef ENABLE_DEBUG_HEAP
    #define ENABLE_DEBUG_HEAP true
#endif


/*****************
 * config_game.h
 */
#if !ENABLE_F3DEX3
    #undef ENABLE_F3DEX3_NOSYNCS
    #define ENABLE_F3DEX3_NOSYNCS false
#endif

#if FORCE_WIDESCREEN
    #define USE_WIDESCREEN true
#else
    #define USE_WIDESCREEN (ENABLE_WIDESCREEN && gSaveContext.save.useWidescreen == true)
#endif

//! TODO: implement better Wii VC compatibility
#ifdef CONSOLE_WIIVC
    #undef ENABLE_F3DEX3
    #undef ENABLE_MOTION_BLUR

    #define ENABLE_F3DEX3 false
    #define ENABLE_MOTION_BLUR false
#endif

#ifdef CONSOLE_GC
    #undef ENABLE_F3DEX3
    #define ENABLE_F3DEX3 false
#endif


/**
 * Default settings if not using HackerOoT mode
*/
#if !ENABLE_HACKEROOT
    #undef SKIP_N64_BOOT_LOGO
    #undef BOOT_TO_SCENE
    #undef BOOT_TO_SCENE_NEW_GAME_ONLY
    #undef BOOT_TO_FILE_SELECT
    #undef DISABLE_DEBUG_FEATURES
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
    #undef MAP_SELECT_ON_FILE_1
    #undef ENABLE_MOTION_BLUR_DEBUG

    #define SKIP_N64_BOOT_LOGO true
    #define BOOT_TO_SCENE false
    #define BOOT_TO_SCENE_NEW_GAME_ONLY false
    #define BOOT_TO_FILE_SELECT false
    #define DISABLE_DEBUG_FEATURES false
    #define SHOW_CS_INFOS false
    #define SHOW_INPUT_DISPLAY false
    #define SHOW_TIME_INFOS false
    #define INCLUDE_TEST_SCENES true
    #define ENABLE_NO_CLIP false
    #define ENABLE_CS_CONTROL false
    #define ENABLE_FRAMERATE_OPTIONS false
    #define ENABLE_MAP_SELECT true
    #define ENABLE_INV_EDITOR false
    #define ENABLE_EVENT_EDITOR false
    #define ENABLE_REG_EDITOR false
    #define ENABLE_CAMERA_DEBUGGER true
    #define ENABLE_AUDIO_DEBUGGER false
    #define ENABLE_ACTOR_DEBUGGER false
    #define ENABLE_MSG_DEBUGGER false
    #define ENABLE_DEBUG_SAVE false
    #define MAP_SELECT_ON_FILE_1 true
    #define ENABLE_MOTION_BLUR_DEBUG false
#endif

/**
 * Used in if statements
*/
#if ENABLE_HACKEROOT
#define IS_DEBUG (OOT_DEBUG && !DISABLE_DEBUG_FEATURES)
#else
#define IS_DEBUG OOT_DEBUG
#endif

#if ENABLE_PROFILER && !ENABLE_HACKER_DEBUG
#error "ENABLE_PROFILER requires ENABLE_HACKER_DEBUG"
#endif

/**
 * Game
*/
#define IS_MOTION_BLUR_ENABLED (ENABLE_HACKEROOT && ENABLE_MOTION_BLUR)

/**
 * Debug
*/

// General features
#define IS_DEBUG_HEAP_ENABLED (IS_DEBUG && ENABLE_DEBUG_HEAP)
#define IS_NO_CLIP_ENABLED (IS_DEBUG && ENABLE_NO_CLIP)
#define CAN_SHOW_INPUT_DISPLAY (IS_DEBUG && SHOW_INPUT_DISPLAY)
#define CAN_SHOW_CS_INFOS (IS_DEBUG && SHOW_CS_INFOS)
#define IS_CS_CONTROL_ENABLED (IS_DEBUG && ENABLE_CS_CONTROL)
#define CS_CAN_SKIP_TITLE_SCREEN (IS_CS_CONTROL_ENABLED && CS_CTRL_SKIP_TITLE_SCREEN)
#define CAN_SHOW_TIME_INFOS (IS_DEBUG && SHOW_TIME_INFOS)
#define ARE_FRAMERATE_OPTIONS_ENABLED (IS_DEBUG && ENABLE_FRAMERATE_OPTIONS)
#define IS_MAP_SELECT_ENABLED (IS_DEBUG && ENABLE_MAP_SELECT)
#define IS_DEBUG_SAVE_ENABLED (IS_DEBUG && ENABLE_DEBUG_SAVE)
#define CAN_INCLUDE_TEST_SCENES (!ENABLE_HACKEROOT || (IS_DEBUG && INCLUDE_TEST_SCENES))
#define ARE_GAME_PRINTF_ENABLED (IS_DEBUG && ENABLE_GAME_PRINTF)
#define ARE_GAME_LOGS_ENABLED (IS_DEBUG && ENABLE_GAME_LOGS)

// In-game editors
#define IS_INV_EDITOR_ENABLED (IS_DEBUG && ENABLE_INV_EDITOR)
#define IS_EVENT_EDITOR_ENABLED (IS_DEBUG && ENABLE_EVENT_EDITOR)
#define IS_REG_EDITOR_ENABLED (IS_DEBUG && ENABLE_REG_EDITOR)

// In-game debuggers
#define IS_CAMERA_DEBUG_ENABLED (IS_DEBUG && ENABLE_CAMERA_DEBUGGER)
#define IS_AUDIO_DEBUG_ENABLED (IS_DEBUG && ENABLE_AUDIO_DEBUGGER)
#define IS_ACTOR_DEBUG_ENABLED (IS_DEBUG && ENABLE_ACTOR_DEBUGGER)
#define IS_MSG_DEBUG_ENABLED (IS_DEBUG && ENABLE_MSG_DEBUGGER)

/**
 * Compression
*/
#ifndef COMPRESS_YAZ
#define COMPRESS_YAZ false
#endif

#ifndef COMPRESS_LZO
#define COMPRESS_LZO false
#endif

#ifndef COMPRESS_APLIB
#define COMPRESS_APLIB false
#endif

#endif
