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
#endif

/*****************
 * config_game.h
 */

#endif
