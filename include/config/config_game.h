#ifndef CONFIG_GAME_H
#define CONFIG_GAME_H


/*****************
 * GAME SETTINGS *
 *****************/
 
// Disables AA (Improves console performance but causes visible seams between unconnected geometry).
// #define DISABLE_AA false

/**
 * F3DEX3 options
 * ``ENABLE_F3DEX3_RECOMMENDATIONS`` will enable the recommended changes listed in F3DEX3's readme
 * ``ENABLE_F3DEX3_NEW_FEATURES`` will enable the required changes to use the new features from F3DEX3
*/
#define ENABLE_F3DEX3 true
#define ENABLE_F3DEX3_RECOMMENDATIONS true // missing matrix stuff + fast64 re-export process
#define ENABLE_F3DEX3_LIGHT_RECO false // unfinished, faster but experimental (reco -> recommendations)
// #define ENABLE_F3DEX3_NEW_FEATURES true // not implemented yet

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

// Rupee counter icon changes color with wallet upgrades like in MM
#define MM_WALLET_ICON_COLORS true

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
 * Applies the anti-aliasing filter for the background of the pause menu.
 * Note: this adds a significant delay when pausing.
*/
#define ENABLE_PAUSE_BG_AA false

/**
 * Widescreen mode
 * Note: pre-rendered scenes with the fixed camera mode won't re-scale properly
*/
#define ENABLE_WIDESCREEN false

// Force widescreen mode regardless of SaveContext
#define FORCE_WIDESCREEN false

// Increase the size of small elements (improves readability on N64)
#define WIDESCREEN_N64_MODE true

/**
 * Automatic GI Object Allocation
*/
#define ENABLE_AUTO_GI_ALLOC false

// Use the button colors of the N64 version instead of GameCube
#define N64_BTN_COLORS true

/**
 * Skips the N64 logo and boots directly into the game if defined (may already be skipped by the options below)
 */
#define SKIP_N64_BOOT_LOGO true

/**
 * Use Majora's Masks' N64 Logo logic
*/
#define MM_N64_BOOT_LOGO false

/*
 * Motion Blur
*/
#define ENABLE_MOTION_BLUR true

#endif
