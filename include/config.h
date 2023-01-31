#ifndef CONFIG_H
#define CONFIG_H

/**
 * All HackerOoT config headers included into one.
 */

#include "config/config_debug_features.h"
#include "config/config_debug_controls.h"
#include "config/config_debug.h"
#include "config/config_game.h"

// This file provides macros to handle switching between 4:3 and 16:9 and fixing issues.
#include "config/config_widescreen.h"

/* WARNING: Compatibility safeguards - don't remove this file unless you know what you're doing */
#include "config/config_safeguards.h"

#endif
