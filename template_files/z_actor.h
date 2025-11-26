#ifndef {actorFileNameCaps}_H
#define {actorFileNameCaps}_H

#include "ultra64.h"
#include "actor.h"
#include "play_state.h"

struct {actorSpec};

typedef void (*{actorSpec}ActionFunc)(struct {actorSpec}*, PlayState*);

typedef struct {actorSpec} {
    Actor actor;
    {actorSpec}ActionFunc actionFunc;
} {actorSpec};

#endif
