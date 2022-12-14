#ifndef CONFIG_GAME_H
#define CONFIG_GAME_H

/*****************
 * GAME SETTINGS *
 *****************/

/**
 * Enable mempak-related code
 */
// #define ENABLE_MEMPAK

// Configure dialogue print speed (1 is vanilla)
#define DIALOGUE_PRINT_SPEED 2

// Rupee counter icon changes color with wallet upgrades like in MM
#define MM_WALLET_ICON_COLORS

// Configure block push speed multiplier
#define BLOCK_PUSH_SPEED 1.0f

// Enables the beep sound at low health (vanilla behaviour)
#define ENABLE_LOW_HEALTH_BEEP

// Make the Bunnyhood Mask behave like in Majora's Mask where it increases Link's speed when equipped.
// #define MM_BUNNYHOOD

/**
 * Enable fast text
 */
#define ENABLE_FAST_TEXT

/**
 * Splits Farore's Wind warp point across ages. One point for child Link, one point for adult Link.
 */
// #define FW_SPLIT_AGE

/**
 * Applies the anti-aliasing filter for the background of the pause menu.
 * Note: this adds a significant delay when pausing.
*/
// #define ENABLE_PAUSE_BG_AA

#endif
