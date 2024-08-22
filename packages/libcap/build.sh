TERMUX_PKG_HOMEPAGE=https://sites.google.com/site/fullycapable/
TERMUX_PKG_DESCRIPTION="POSIX 1003.1e capabilities"
TERMUX_PKG_LICENSE="BSD 3-Clause, GPL-2.0"
TERMUX_PKG_LICENSE_FILE="License"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.66
TERMUX_PKG_SRCURL=https://kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=15c40ededb3003d70a283fe587a36b7d19c8b3b554e33f86129c059a4bb466b2
TERMUX_PKG_DEPENDS="attr"
TERMUX_PKG_BREAKS="libcap-dev"
TERMUX_PKG_REPLACES="libcap-dev"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	make CC="$CC -Wl,-rpath=$TERMUX_PREFIX/lib -Wl,--enable-new-dtags" OBJCOPY=llvm-objcopy PREFIX="$TERMUX_PREFIX" PTHREADS=no PAM_CAP=no
}

termux_step_make_install() {
	make CC="$CC -Wl,-rpath=$TERMUX_PREFIX/lib -Wl,--enable-new-dtags" OBJCOPY=llvm-objcopy prefix="$TERMUX_PREFIX" RAISE_SETFCAP=no lib=/lib PTHREADS=no install PAM_CAP=no
}
