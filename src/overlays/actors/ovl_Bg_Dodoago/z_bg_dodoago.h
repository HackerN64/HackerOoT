#ifndef Z_BG_DODOAGO_H
#define Z_BG_DODOAGO_H

#include "ultra64.h"
#include "global.h"

struct BgDodoago;

typedef void (*BgDodoagoActionFunc)(struct BgDodoago*, GlobalContext*);

typedef struct BgDodoago {
    /* 0x0000 */ DynaPolyActor dyna;
    /* 0x0164 */ s16 unk_164;
    /* 0x0168 */ ColliderCylinder colliders[3]; 
    /* 0x024C */ BgDodoagoActionFunc actionFunc;
} BgDodoago; // size = 0x0250

#endif
