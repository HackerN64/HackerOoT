#ifndef COMPRESSION_H
#define COMPRESSION_H

#include "ultra64.h"
#include "z64dma.h"
#include "config.h"

#if COMPRESS_YAZ
void* Yaz0_FirstDMA(void);
void* Yaz0_NextDMA(u8* curSrcPos);
void Yaz0_DecompressImpl(u8* src, u8* dst);
void Yaz0_Decompress(uintptr_t romStart, u8* dst, size_t size);
#elif COMPRESS_LZO
void LZO_Decompress(unsigned int pstart, unsigned char* op, unsigned int sz);
#elif COMPRESS_APLIB
void Aplib_Decompress(unsigned rom, unsigned char* dst, unsigned compSz);
#endif

#endif
