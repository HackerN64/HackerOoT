AC_PREREQ([2.69])
AC_INIT
AC_PREFIX_DEFAULT([/usr/local])
AC_PROG_CC
AC_PROG_INSTALL
CFLAGS="-O3"
AC_CHECK_HEADERS([wmmintrin.h],
    [
        CFLAGS+=" -maes -msse -msse2"
        CPPFLAGS="-DFASTAES"
    ]
)
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
