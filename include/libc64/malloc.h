#ifndef LIBC64_MALLOC_H
#define LIBC64_MALLOC_H

#include "ultra64.h"
#include "libc64/os_malloc.h"

void* SystemArena_Malloc(u32 size);
void* SystemArena_MallocR(u32 size);
void* SystemArena_Realloc(void* ptr, u32 newSize);
void SystemArena_Free(void* ptr);
void* SystemArena_Calloc(u32 num, u32 size);
void SystemArena_GetSizes(u32* outMaxFree, u32* outFree, u32* outAlloc);
void SystemArena_Check(void);
void SystemArena_Init(void* start, u32 size);
void SystemArena_Cleanup(void);
s32 SystemArena_IsInitialized(void);

#if DEBUG_FEATURES
#define SYSTEM_ARENA_MALLOC(size, ...) SystemArena_MallocDebug(size,  __FILE__, __LINE__)
#define SYSTEM_ARENA_MALLOC_R(size, ...) SystemArena_MallocRDebug(size,  __FILE__, __LINE__)
#define SYSTEM_ARENA_FREE(size, ...) SystemArena_FreeDebug(size,  __FILE__, __LINE__)

void* SystemArena_MallocDebug(u32 size, const char* file, int line);
void* SystemArena_MallocRDebug(u32 size, const char* file, int line);
void* SystemArena_ReallocDebug(void* ptr, u32 newSize, const char* file, int line);
void SystemArena_FreeDebug(void* ptr, const char* file, int line);
void SystemArena_Display(void);
#else
#define SYSTEM_ARENA_MALLOC(size, ...) SystemArena_Malloc(size)
#define SYSTEM_ARENA_MALLOC_R(size, ...) SystemArena_MallocR(size)
#define SYSTEM_ARENA_FREE(size, ...) SystemArena_Free(size)
#endif

extern Arena gSystemArena;
extern s32 gSystemArenaLogSeverity;

#endif
