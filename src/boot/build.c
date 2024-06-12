#include "config.h"

#define STRINGIFY(s) #s
#define EXPAND_AND_STRINGIFY(s) STRINGIFY(s)

#if (defined IS_MAP_SELECT_ENABLED && defined PACKAGE_AUTHOR)
const char* gBuildAuthor = EXPAND_AND_STRINGIFY(PACKAGE_AUTHOR);
const char* gCommitAuthor = EXPAND_AND_STRINGIFY(PACKAGE_COMMIT_AUTHOR);
#else
const char* gBuildAuthor = "???";
const char* gCommitAuthor = "???";
#endif

#ifdef IS_MAP_SELECT_ENABLED
const char* gBuildDate = __DATE__ " " __TIME__;
#else
const char* gBuildDate = "???";
#endif

#if (defined IS_MAP_SELECT_ENABLED && defined PACKAGE_VERSION)
const char* gBuildGitVersion = EXPAND_AND_STRINGIFY(PACKAGE_VERSION);
const char* gCommitGitString = EXPAND_AND_STRINGIFY(PACKAGE_NAME);
#else
const char* gBuildGitVersion = "???";
const char* gCommitGitString = "???";
#endif