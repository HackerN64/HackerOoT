#include "global.h"

static SchedPerfInfo schedPerfInfo1;
static SchedPerfInfo schedPerfInfo2;
SchedPerfInfo* volatile lastSchedPerfInfo;
SchedPerfInfo* volatile activeSchedPerfInfo;

void Profiler_Init() {
    bzero(&schedPerfInfo1, sizeof(SchedPerfInfo));
    bzero(&schedPerfInfo2, sizeof(SchedPerfInfo));
    lastSchedPerfInfo = &schedPerfInfo1;
    activeSchedPerfInfo = &schedPerfInfo2;
}

void Profiler_Draw() {
    
}

void Profiler_Destroy() {
    // nothing
}
