AC_PREREQ([2.69])
AC_INIT
AC_CANONICAL_HOST
AC_PREFIX_DEFAULT([/usr/local])
AC_PROG_CC
AC_PROG_INSTALL
CFLAGS="-O3"

case "${host_os}" in
    darwin*)
        CFLAGS+=" -arch x86_64 -arch arm64"
        LDFLAGS+=" -arch x86_64 -arch arm64"
        ;;
    *)
        AC_CHECK_HEADERS([wmmintrin.h],
            [
                CFLAGS+=" -maes -msse -msse2"
                CPPFLAGS="-DFASTAES"
            ]
        )
        ;;
esac

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
