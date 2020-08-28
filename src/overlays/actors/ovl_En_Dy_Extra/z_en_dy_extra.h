#ifndef _Z_EN_DY_EXTRA_H_
#define _Z_EN_DY_EXTRA_H_

#include <ultra64.h>
#include <global.h>

struct EnDyExtra;

typedef void (*EnDyExtraActionFunc)(struct EnDyExtra*, GlobalContext*);

typedef struct EnDyExtra {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ EnDyExtraActionFunc actionFunc;
    /* 0x0150 */ s16 type;
    /* 0x0152 */ s16 unk_152;
    /* 0x0154 */ s16 unk_154;
    /* 0x0158 */ f32 unk_158;
    /* 0x015C */ Vec3f unk_15C;
    /* 0x0168 */ Vec3f unk_168;
} EnDyExtra; // size = 0x0174

extern const ActorInit En_Dy_Extra_InitVars;

#endif
