#ifndef CONFIG_H
#define CONFIG_H

#include "libc/stdbool.h"
#include "versions.h"

/**
 * All HackerOoT config headers included into one.
 */

#include "config/config_debug_features.h"
#include "config/config_debug_controls.h"
#include "config/config_debug.h"
#include "config/config_game.h"
#include "config/config_graphics.h"
#include "config/config_memory.h"

/* WARNING: Compatibility safeguards - don't remove this file unless you know what you're doing */
#include "config/config_safeguards.h"

#endif
