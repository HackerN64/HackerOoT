#ifndef CONFIG_GAME_H
#define CONFIG_GAME_H


/*****************
 * GAME SETTINGS *
 *****************/

// Fix annoying glitches (crashes and softlocks)
#define FIX_ANNOYING_GLITCH true

// Add a fix for the Stale Reference Manipulation glitch (OoT's Pandora's Box)
#define FIX_SRM true

/**
 * Enable mempak-related code
 */
#define ENABLE_MEMPAK false

// Configure dialogue print speed (1 is vanilla)
// #define DIALOGUE_PRINT_SPEED 2

// Configure block push speed multiplier
#define BLOCK_PUSH_SPEED 1.0f

// Enables the beep sound at low health (vanilla behavior)
#define ENABLE_LOW_HEALTH_BEEP true

// Make the Bunny Hood Mask behave like in Majora's Mask where it increases Link's speed when equipped.
#define MM_BUNNY_HOOD false
#define MM_BUNNY_HOOD_SPEED 1.5f

/**
 * Enable fast text
 */
#define ENABLE_FAST_TEXT false

/**
 * Splits Farore's Wind warp point across ages. One point for child Link, one point for adult Link.
 */
#define FW_SPLIT_AGE false

/**
 * Disable Player being unable to move
 * Examples: when getting a Gold Skulltula Token, when pushing the walls in Forest Temple
*/
#define DISABLE_PLAYER_FREEZE true

/**
 * Add Gold Skulltula count to the textbox
*/
#define GS_COUNT_IN_TEXT true

/**
 * Skips the N64 logo and boots directly into the game if defined (may already be skipped by the options below)
 */
#define SKIP_N64_BOOT_LOGO true

/**
 * Use Majora's Masks' N64 Logo logic
*/
#define MM_N64_BOOT_LOGO false

/*
 * Fix climbing on vine edges
*/
#define ENABLE_VINE_CLIMB_FIX true

/**
 * Enable critical wiggles
 * This is that thing where the player can have a random stick input every 256 frames when you're at critical health
 * See ``Camera_Normal1`` in ``z_camera.c`` for more details.
*/
#define ENABLE_CRITICAL_WIGGLES false

#endif
