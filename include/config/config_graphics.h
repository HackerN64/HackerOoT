#ifndef CONFIG_GRAPHICS_H
#define CONFIG_GRAPHICS_H


/********************
 * GRAPHIC SETTINGS *
 *******************/
 
/**
 * Disables AA (Improves console performance but causes visible seams between unconnected geometry).
*/
// #define DISABLE_AA

/**
 * Applies the anti-aliasing filter for the background of the pause menu.
 * Note: this adds a significant delay when pausing.
*/
// #define ENABLE_PAUSE_BG_AA

/**
 * Enable No-Syncs 
 * Note: mostly works but there's still visual issues with this
*/
#define DISABLE_SYNCS

#endif
