#include "config.h"

#define STRINGIFY(s) #s
#define EXPAND_AND_STRINGIFY(s) STRINGIFY(s)

// TODO: Use per-version preprocessor defines
#if IS_DEBUG // gc-eu-mq-dbg
const char gBuildDate[] = "03-02-21 00:16:31";
#elif !OOT_MQ // gc-eu
const char gBuildDate[] = "03-02-21 20:12:23";
#else         // gc-eu-mq
const char gBuildDate[] = "03-02-21 20:37:19";
#endif

#if RELEASE_ROM
char const gBuildMakeOption[] = "RELEASE";
#else
char const gBuildMakeOption[] = "DEBUG";
#endif

char const gBuildGitVersion[] = EXPAND_AND_STRINGIFY(PACKAGE_VERSION);

char const gBuildTeam[] = "";
