#define STRINGIFY(s) #s
#define EXPAND_AND_STRINGIFY(s) STRINGIFY(s)

#if !DETERMINISTIC_BUILD && (defined PACKAGE_AUTHOR)
char const gBuildAuthor[] = EXPAND_AND_STRINGIFY(PACKAGE_AUTHOR);
#else
char const gBuildAuthor[] = "???";
#endif

#if !DETERMINISTIC_BUILD
char const gBuildDate[] = __DATE__ " " __TIME__;
#else
char const gBuildDate[] = "???";
#endif

#if RELEASE_ROM
char const gBuildMakeOption[] = "RELEASE";
#else
char const gBuildMakeOption[] = "DEBUG";
#endif

#if !DETERMINISTIC_BUILD && (defined PACKAGE_VERSION)
char const gBuildGitVersion[] = EXPAND_AND_STRINGIFY(PACKAGE_VERSION);
#else
char const gBuildGitVersion[] = "???";
#endif

char const gBuildTeam[] = "";
