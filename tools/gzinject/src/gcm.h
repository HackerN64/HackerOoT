#ifndef GCM_H_
#define GCM_H_

#include "gzinject.h"

extern uint32_t GCM_HEADER_SIZE;
extern uint32_t TGC_HEADER_SIZE;

int create_gcm_archive(const char *dir, const char *output);
int extract_gcm_archive(const char *input, const char* outdir);

#endif
