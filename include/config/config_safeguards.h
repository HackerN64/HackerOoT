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
#undef DETERMINISTIC_BUILD
#undef SKIP_N64_BOOT_LOGO
#undef BOOT_TO_SCENE
#undef BOOT_TO_SCENE_NEW_GAME_ONLY
#undef BOOT_TO_FILE_SELECT
#undef SHOW_CS_INFOS
#undef SHOW_INPUT_DISPLAY
#undef SHOW_TIME_INFOS
#undef NO_DEBUG_SCENES
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
#endif

/*****************
 * config_game.h
 */

#endif
