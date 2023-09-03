#define STRINGIFY(s) #s
#define EXPAND_AND_STRINGIFY(s) STRINGIFY(s)

#if (!defined DETERMINISTIC_BUILD && defined PACKAGE_AUTHOR)
char const gBuildAuthor[] = EXPAND_AND_STRINGIFY(PACKAGE_AUTHOR);
#else
char const gBuildAuthor[] = "???";
#endif

#ifndef DETERMINISTIC_BUILD
char const gBuildDate[] = __DATE__ " " __TIME__;
#else
char const gBuildDate[] = "???";
#endif

#ifndef RELEASE_ROM
char const gBuildMakeOption[] = "DEBUG";
#else
char const gBuildMakeOption[] = "RELEASE";
#endif

#if (!defined DETERMINISTIC_BUILD && defined PACKAGE_VERSION)
char const gBuildGitVersion[] = EXPAND_AND_STRINGIFY(PACKAGE_VERSION);
#else
char const gBuildGitVersion[] = "???";
#endif
