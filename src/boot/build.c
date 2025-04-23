#include "build.h"

#include "config.h"
#include "versions.h"
#include "macros.h"

#ifdef PACKAGE_AUTHOR
const char gBuildAuthor[] = EXPAND_AND_STRINGIFY(PACKAGE_AUTHOR);
#else
const char gBuildAuthor[] = "???";
#endif

#ifdef PACKAGE_COMMIT_AUTHOR
const char gCommitAuthor[] = EXPAND_AND_STRINGIFY(PACKAGE_COMMIT_AUTHOR);
#else
const char gCommitAuthor[] = "???";
#endif

const char gBuildDate[] = __DATE__ " " __TIME__;

#ifdef PACKAGE_VERSION
const char gBuildGitVersion[] = EXPAND_AND_STRINGIFY(PACKAGE_VERSION);
#else
const char gBuildGitVersion[] = "???";
#endif

#ifdef PACKAGE_NAME
const char gCommitGitString[] = EXPAND_AND_STRINGIFY(PACKAGE_NAME);
#else
const char gCommitGitString[] = "???";
#endif
