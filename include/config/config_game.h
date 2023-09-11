#ifndef CONFIG_GAME_H
#define CONFIG_GAME_H


/*****************
 * GAME SETTINGS *
 *****************/
 
// Disables AA (Improves console performance but causes visible seams between unconnected geometry).
//#define DISABLE_AA

// Use a folded polynomial instead of a lookup table
#define DISABLE_LOOKUP_TABLE

// Fix annoying glitches (crashes and softlocks)
#define FIX_ANNOYING_GLITCH

// Add a fix for the Stale Reference Manipulation glitch (OoT's Pandora's Box)
#define FIX_SRM

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
// #define ENABLE_FAST_TEXT

/**
 * Splits Farore's Wind warp point across ages. One point for child Link, one point for adult Link.
 */
// #define FW_SPLIT_AGE

/* Apply the anti-aliasing filter for the background of the pause menu. This adds a delay when pausing. */
// #define VANILLA_PAUSE_DELAY

/**
 * Disable Player froze when getting a Gold Skulltula Token
*/
#define DISABLE_GS_TOKEN_FREEZE

/**
 * Add Gold Skulltula count to the textbox
*/
#define GS_COUNT_IN_TEXT

/**
 * Applies the anti-aliasing filter for the background of the pause menu.
 * Note: this adds a significant delay when pausing.
*/
// #define ENABLE_PAUSE_BG_AA

/**
 * Widescreen mode
 * Note: pre-rendered scenes with the fixed camera mode won't re-scale properly
*/
#define ENABLE_WIDESCREEN

// Force widescreen mode regardless of SaveContext
// #define FORCE_WIDESCREEN

// Increase the size of small elements (improves readability on N64)
#define WIDESCREEN_N64_MODE true

/**
 * Automatic GI Object Allocation
*/
// #define ENABLE_AUTO_GI_ALLOC

#endif
