#ifndef CONFIG_MEMORY_H
#define CONFIG_MEMORY_H

/**
 * This file hosts different macros that changes different types
 * of buffer/heap allocation size.
 * 
 * IMPORTANT: do not change these values unless you know what you are doing.
*/

// ---------------

/**
 * @brief Space allocated by GameState. All the various "states", like
 * TitleSetupState, FileSelectState, MapSelectState, ConsoleLogoState etc
 * are really just recasts of the GameState pointer for use in various
 * contexts during the course of the game's lifecycle.
 */
#define GAMESTATE_ALLOC_SIZE 0x100000

/**
 * @brief PlayState is the "state" type used for "actual gameplay", that
 * is, controlling Link in the world - not the title screen, or file
 * select, etc.
 * 
 * PlayState is the only type of GameState that reallocates more
 * space beyond the default `GAMESTATE_ALLOC_SIZE`. The
 * vanilla value is `0x1D4790`, ~1.83MB.
 * 
 * It's okay if this new value is too large, `GameState_Realloc` will just
 * allocate the rest of the available SystemArena space.
 */
#define PLAY_ALLOC_SIZE 0x4D4790

/**
 * @brief Audio heap size, vanilla value is `0x38000`, 224KB.
 */
#define AUDIO_HEAP_SIZE 0x38000

/**
 * @brief How much space is given to the object bank used for loading
 * actor objects. Vanilla is about `0xfa000`, ~0.98MB, though vanilla
 * changes the value slightly depending on the scene
 */
#define OBJECT_BANK_SIZE 0x200000

/**
 * Automatic GI Object Allocation based on the size of the largest GI object
*/
#define ENABLE_AUTO_GI_ALLOC false

/**
 * @brief Player's memory space reserved to load GI models (the model Link
 * holds over his head when getting an item). Vanilla's size is very
 * tiny, `0x3008`, ~12KB.
 * 
 */
#define GI_ALLOC_SIZE 0xB000

/**
 * @brief Space allocated for the OPA buffer. Vanilla value is `0x17E0`.
 */
#define POLY_OPA_BUFFER_SIZE 0x1A00

/**
 * @brief Space allocated for the XLU buffer. Vanilla value is `0x800`.
 */
#define POLY_XLU_BUFFER_SIZE 0xC00

/**
 * @brief Space allocated for the Overlay buffer. Vanilla value is `0x400`.
 */
#define OVERLAY_BUFFER_SIZE 0x400

/**
 * @brief Space allocated for the Work buffer. Vanilla value is `0x80`.
 */
#define WORK_BUFFER_SIZE 0x80

/**
 * @brief Vanilla value is 0x8044BE80. Make this a little larger to
 * account for greater memory usage in other areas. Required for most
 * of the following memory increases to actually work.
 */
#define SYS_CFB_END 0x80800000

#endif
