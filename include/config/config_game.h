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

// Make `Camera_KeepOn4`'s `case 9`, mimic how getting an item looks in Majora's Mask (Perspective from above)
#define MM_GETITEM_CAM false

/**
 * Enable Animated Materials (from Majora's Mask)
 */
#define ENABLE_ANIMATED_MATERIALS true

/**
 * Enable New Letterbox (from Majora's Mask)
 */
#define ENABLE_NEW_LETTERBOX true

/**
 * Enable Cutscene Improvements (from Majora's Mask)
 *
 * This includes actor cutscenes
 */
#define ENABLE_CUTSCENE_IMPROVEMENTS true

/**
 * Enable MM Title Cards
 */
#define ENABLE_MM_TITLE_CARDS true
#define TC_TEXT_POS_X 25
#define TC_TEXT_POS_Y 67
#define TC_GRADIENT_WIDTH 60
#define TC_GRADIENT_HEIGHT 28
#define TC_ALPHA_FADE_OUT_INCR 40
#define TC_ALPHA_FADE_IN_INCR 30

#endif
