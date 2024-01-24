#include "global.h"
#include "config.h"

void Setup_InitImpl(SetupState* this) {
    PRINTF("ゼルダ共通データ初期化\n"); // "Zelda common data initalization"
    SaveContext_Init();
    this->state.running = false;
#if (defined BOOT_TO_SCENE || defined BOOT_TO_FILE_SELECT)
    SET_NEXT_GAMESTATE(&this->state, FileSelect_Init, FileSelectState);
#elif (defined BOOT_TO_MAP_SELECT)
    SET_NEXT_GAMESTATE(&this->state, MapSelect_Init, MapSelectState);
#else
    SET_NEXT_GAMESTATE(&this->state, ConsoleLogo_Init, ConsoleLogoState);
#endif
}

void Setup_Destroy(GameState* thisx) {
}

void Setup_Init(GameState* thisx) {
    SetupState* this = (SetupState*)thisx;

    this->state.destroy = Setup_Destroy;
    Setup_InitImpl(this);
}
