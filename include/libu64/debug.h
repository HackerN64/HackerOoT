#ifndef LIBU64_DEBUG_H
#define LIBU64_DEBUG_H

#include "ultra64.h"

#if DEBUG_FEATURES
#define LOG(exp, value, format, ...)                \
    do {                                            \
        LogUtils_LogThreadId(__FILE__, __LINE__);   \
        osSyncPrintf(exp " = " format "\n", value); \
    } while (0)
#else
#define LOG(exp, value, format, ...) (void)(value)
#endif

#define LOG_STRING(string, ...) LOG(#string, string, "%s", __VA_ARGS__)
#define LOG_ADDRESS(exp, value, ...) LOG(exp, value, "%08x", __VA_ARGS__)
#define LOG_TIME(exp, value, ...) LOG(exp, value, "%lld", __VA_ARGS__)
#define LOG_NUM(exp, value, ...) LOG(exp, value, "%d", __VA_ARGS__)
#define LOG_HEX(exp, value, ...) LOG(exp, value, "%x", __VA_ARGS__)
#define LOG_HEX32(exp, value, ...) LOG(exp, value, "%08x", __VA_ARGS__)
#define LOG_FLOAT(exp, value, ...) LOG(exp, value, "%f", __VA_ARGS__)

#if PLATFORM_N64 || DEBUG_FEATURES
f32 LogUtils_CheckFloatRange(const char* exp, int line, const char* valueName, f32 value, const char* minName, f32 min,
                             const char* maxName, f32 max);
#endif

#if DEBUG_FEATURES
#define LOG_UTILS_CHECK_NULL_POINTER(exp, ptr, ...) LogUtils_CheckNullPointer(exp, ptr,  __FILE__, __LINE__)
#define LOG_UTILS_CHECK_VALID_POINTER(exp, ptr, ...) LogUtils_CheckValidPointer(exp, ptr,  __FILE__, __LINE__)

s32 LogUtils_CheckIntRange(const char* exp, int line, const char* valueName, s32 value, const char* minName, s32 min,
                           const char* maxName, s32 max);
void LogUtils_LogHexDump(void* ptr, s32 size0);
void LogUtils_LogPointer(s32 value, u32 max, void* ptr, const char* name, const char* file, int line);
void LogUtils_CheckBoundary(const char* name, s32 value, s32 unk, const char* file, int line);
void LogUtils_CheckNullPointer(const char* exp, void* ptr, const char* file, int line);
void LogUtils_CheckValidPointer(const char* exp, void* ptr, const char* file, int line);
void LogUtils_LogThreadId(const char* name, int line);
#else

#define LOG_UTILS_CHECK_NULL_POINTER(exp, ptr, ...) (void)0
#define LOG_UTILS_CHECK_VALID_POINTER(exp, ptr, ...) (void)0

#endif

void LogUtils_HungupThread(const char* name, int line);
void LogUtils_ResetHungup(void);

#endif
