#include "config.h"
#include "versions.h"

#define STRINGIFY(s) #s
#define EXPAND_AND_STRINGIFY(s) STRINGIFY(s)

#if IS_MAP_SELECT_ENABLED && (defined PACKAGE_AUTHOR)
const char* gBuildAuthor = EXPAND_AND_STRINGIFY(PACKAGE_AUTHOR);
#else
const char* gBuildAuthor = "???";
#endif

#if IS_MAP_SELECT_ENABLED && (defined PACKAGE_COMMIT_AUTHOR)
const char* gCommitAuthor = EXPAND_AND_STRINGIFY(PACKAGE_COMMIT_AUTHOR);
#else
const char* gCommitAuthor = "???";
#endif

#ifdef IS_MAP_SELECT_ENABLED
const char* gBuildDate = __DATE__ " " __TIME__;
#else
const char* gBuildDate = "???";
#endif

#if IS_MAP_SELECT_ENABLED && (defined PACKAGE_VERSION)
const char* gBuildGitVersion = EXPAND_AND_STRINGIFY(PACKAGE_VERSION);
#else
const char* gBuildGitVersion = "???";
#endif

#if IS_MAP_SELECT_ENABLED && (defined PACKAGE_NAME)
const char* gCommitGitString = EXPAND_AND_STRINGIFY(PACKAGE_NAME);
#else
const char* gCommitGitString = "???";
#endif
