#include "config.h"

#define STRINGIFY(s) #s
#define EXPAND_AND_STRINGIFY(s) STRINGIFY(s)

#if (defined IS_MAP_SELECT_ENABLED && defined PACKAGE_AUTHOR)
const char* gBuildAuthor = PACKAGE_AUTHOR;
const char* gCommitAuthor = PACKAGE_COMMIT_AUTHOR;
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
const char* gBuildGitVersion = PACKAGE_VERSION;
const char* gCommitGitString = PACKAGE_NAME;
#else
const char* gBuildGitVersion = "???";
const char* gCommitGitString = "???";
#endif