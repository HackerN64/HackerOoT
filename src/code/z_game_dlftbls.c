#include "global.h"
#include "config.h"

#define GAMESTATE_OVERLAY(name, init, destroy, size)                                                     \
    {                                                                                                    \
        NULL, (uintptr_t)_ovl_##name##SegmentRomStart, (uintptr_t)_ovl_##name##SegmentRomEnd,            \
            _ovl_##name##SegmentStart, _ovl_##name##SegmentEnd, NULL, init, destroy, NULL, NULL, 0, size \
    }
#define GAMESTATE_OVERLAY_INTERNAL(init, destroy, size) \
    { NULL, 0, 0, NULL, NULL, NULL, init, destroy, NULL, NULL, 0, size }

#define GAMESTATE_NONE \
    { NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0 }

GameStateOverlay gGameStateOverlayTable[] = {
    GAMESTATE_OVERLAY_INTERNAL(Setup_Init, Setup_Destroy, sizeof(SetupState)),

#ifdef ENABLE_MAP_SELECT
    GAMESTATE_OVERLAY(select, MapSelect_Init, MapSelect_Destroy, sizeof(MapSelectState)),
#else
    GAMESTATE_NONE,
#endif

    GAMESTATE_OVERLAY(title, ConsoleLogo_Init, ConsoleLogo_Destroy, sizeof(ConsoleLogoState)),
    GAMESTATE_OVERLAY_INTERNAL(Play_Init, Play_Destroy, sizeof(PlayState)),
    GAMESTATE_OVERLAY(opening, TitleSetup_Init, TitleSetup_Destroy, sizeof(TitleSetupState)),
    GAMESTATE_OVERLAY(file_choose, FileSelect_Init, FileSelect_Destroy, sizeof(FileSelectState)),
};
