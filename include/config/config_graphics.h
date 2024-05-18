#ifndef CONFIG_GRAPHICS_H
#define CONFIG_GRAPHICS_H

/*****************
 * GAME SETTINGS *
 *****************/

/**
 * F3DEX3 options
 * This only works on "LLE-Emulators" like ares or ParaLLEl. It will not work on standard Project64.
 * ``ENABLE_F3DEX3_RECOMMENDATIONS`` will enable the recommended changes listed in F3DEX3's readme
 * ``ENABLE_F3DEX3_NEW_FEATURES`` will enable the required changes to use the new features from F3DEX3
*/
#define ENABLE_F3DEX3 false
#define ENABLE_F3DEX3_RECOMMENDATIONS true // missing matrix stuff + fast64 re-export process
#define ENABLE_F3DEX3_NOSYNCS false // not working properly currently
#define ENABLE_F3DEX3_LIGHT_RECO false // unfinished, faster but experimental (reco -> recommendations)
// #define ENABLE_F3DEX3_NEW_FEATURES true // not implemented yet

/**
 * Other graphical settings
*/

// Enable or disable Link's LOD model (the low poly model)
#define ENABLE_LINK_LOD false

// Disables AA (Improves console performance but causes visible seams between unconnected geometry).
// #define DISABLE_AA false

// Rupee counter icon changes color with wallet upgrades like in MM
#define MM_WALLET_ICON_COLORS true

/**
 * Applies the anti-aliasing filter for the background of the pause menu.
 * Note: this adds a significant delay when pausing.
*/
#define ENABLE_PAUSE_BG_AA false

// Use the button colors of the N64 version instead of GameCube
#define N64_BTN_COLORS true

/*
 * Motion Blur
*/
#define ENABLE_MOTION_BLUR true

/**
 * Widescreen mode
 * Use the button combo Z + R + D-Pad Up to toggle
 * Note: pre-rendered scenes with the fixed camera mode won't re-scale properly
*/
#define ENABLE_WIDESCREEN false

// Force widescreen mode regardless of SaveContext
#define FORCE_WIDESCREEN false

// Increase the size of small elements (improves readability on N64)
#define WIDESCREEN_N64_MODE true

#endif
