#ifndef CONFIG_GRAPHICS_H
#define CONFIG_GRAPHICS_H

/*****************
 * GAME SETTINGS *
 *****************/

/**
 * F3DEX3 options
 * This only works on real console or LLE emulators like ares or ParaLLEl. It
 * will not work on legacy HLE emulators such as Project64.
 * Note: you can define this with `CPP_DEFINES=-DENABLE_F3DEX3=0 make -j$(nproc)`
*/
#ifndef ENABLE_F3DEX3
#define ENABLE_F3DEX3 false
#endif
// Remove usually-unnecessary syncs from texture loading commands. Only matters
// for vanilla display lists--new ones exported from fast64 already have the
// syncs removed. This is buggy (graphical issues / crashes) as some vanilla DLs
// rely on the syncs within the texture loading commands for correctness. Some
// have already had the missing syncs manually added, but some have not been
// fixed yet.
#define ENABLE_F3DEX3_NOSYNCS false
// Visualize occlusion planes with some dots at the corners and text.
#define DEBUG_OCCLUSION_PLANES false

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
