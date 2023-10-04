#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <lz4hc.h>

int gLz4hcBlockSize = 0;

int
lz4hcenc(
	void *_src
	, unsigned src_sz
	, void *_dst
	, unsigned *dst_sz
	, void *_ctx
)
{
	uint8_t *outStart = _dst;
	uint8_t *outAt = outStart;
	int compSz;
	unsigned src_sz_rounded = ((src_sz + 15) >> 4) << 4;
	
	// optional 'lz4hc' header
	extern int g_hlen;
	if (g_hlen != 0)
	{
		g_hlen = 4;
		memcpy(outAt, "LZ4HC", 5);
		outAt += 5;
	}
	else
	{
		outAt[0] = (src_sz_rounded >> 24);
		outAt += 1;
	}
	
	// 24-bit filesize
	outAt[0] = (src_sz_rounded >> 16);
	outAt[1] = (src_sz_rounded >>  8);
	outAt[2] = (src_sz_rounded >>  0);
	outAt += 3;
	
	if ((compSz = LZ4_compress_HC(
			_src
			, (void*)outAt
			, src_sz
			, 64 * 1024 * 1024
			, LZ4HC_CLEVEL_MAX
		)) <= 0
	)
		return 1;
	
	// size of compressed file
	*dst_sz = compSz + g_hlen + 4;

	// this nybble is used to derive *actual* compressed size when decompressing
	*(outAt - 1) |= 16 - (*dst_sz & 15);

	// success
	return 0;
}

// block-based approach
/*

#define MAX_BUFFER_SIZE (1024 * gLz4hcBlockSize)

int
lz4hcenc(
	void *_src
	, unsigned src_sz
	, void *_dst
	, unsigned *dst_sz
	, void *_ctx
)
{
	unsigned inSz = src_sz;
	void *in = _src;
	uint8_t *inAt = in;
	uint8_t *inEnd = inAt + inSz;
	
	uint8_t *outStart = _dst;
	uint8_t *outAt = outStart;
	
	// optional 'lz4hc' header
	extern int g_hlen;
	if (g_hlen != 0)
	{
		memcpy(outAt, "LZ4HC", 5);
		outAt += 5;
	}
	else
	{
		outAt[0] = (src_sz >> 24);
		outAt += 1;
	}
	
	// 24-bit filesize
	outAt[0] = (src_sz >> 16);
	outAt[1] = (src_sz >>  8);
	outAt[2] = (src_sz >>  0);
	outAt += 3;
	
	while (inAt < inEnd)
	{
		unsigned bytesRead = inEnd - inAt;
		int compSz;
		
		if (bytesRead > MAX_BUFFER_SIZE)
			bytesRead = MAX_BUFFER_SIZE;
		
		if ((compSz = LZ4_compress_HC(
				(void*)inAt
				, (void*)(outAt + 4)
				, bytesRead
				, LZ4_COMPRESSBOUND(MAX_BUFFER_SIZE)
				, LZ4HC_CLEVEL_MAX)
			) <= 0
		)
			return 1;
		
		// write block size at start of block
		*(outAt++) = compSz >> 24;
		*(outAt++) = compSz >> 16;
		*(outAt++) = compSz >> 8;
		*(outAt++) = compSz >> 0;
		
		// advance
		inAt += bytesRead;
		outAt += compSz;
	}
	
	*dst_sz = outAt - outStart;
	
	return 0;
}
*/

