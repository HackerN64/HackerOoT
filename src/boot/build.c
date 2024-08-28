#include "config.h"
#include "versions.h"

#define STRINGIFY(s) #s
#define EXPAND_AND_STRINGIFY(s) STRINGIFY(s)

#if RELEASE_ROM
char const gBuildMakeOption[] = "RELEASE";
#else
char const gBuildMakeOption[] = "DEBUG";
#endif

char const gBuildGitVersion[] = EXPAND_AND_STRINGIFY(PACKAGE_VERSION);

char const gBuildTeam[] = "";
