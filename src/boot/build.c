#include "config.h"
#include "versions.h"

#define STRINGIFY(s) #s
#define EXPAND_AND_STRINGIFY(s) STRINGIFY(s)

#if OOT_DEBUG
char const gBuildMakeOption[] = "DEBUG";
#else
char const gBuildMakeOption[] = "RELEASE";
#endif

char const gBuildGitVersion[] = EXPAND_AND_STRINGIFY(PACKAGE_VERSION);

char const gBuildCreator[] = "";
