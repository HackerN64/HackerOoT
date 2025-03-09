#include "ultra64.h"
#include "macros.h"
#include "usb/debug.h"
#include "config.h"

#if ENABLE_UNF

typedef struct CommandDesc {
    char* name;
    char* desc;
    char* (*callback)(void);
} CommandDesc;

char* command_example() {
    return "The example command executed successfully.";
}

// to add a command, create the function and add an entry for it here, you shouldn't require any other change
CommandDesc sCommandList[] = {
    { "example", "example command", command_example },
};

void Commands_Init(void) {
    debug_initialize();

    if (ARRAY_COUNT(sCommandList) < MAX_COMMANDS) {
        u8 i;

        for (i = 0; i < ARRAY_COUNT(sCommandList); i++) {
            CommandDesc* cmd = &sCommandList[i];

            debug_addcommand(cmd->name, cmd->desc, cmd->callback);
        }

        debug_printcommands();
    } else {
        debug_printf("Too many commands! Ignoring...");
    }
}

#endif
