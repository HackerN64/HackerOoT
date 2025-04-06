#ifndef IDLE_H
#define IDLE_H

#include "ultra64/vi.h"

void Idle_ThreadEntry(void* arg);

extern OSViMode gViConfigMode;

#endif
