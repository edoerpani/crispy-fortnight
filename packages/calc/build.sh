TERMUX_PKG_HOMEPAGE=http://www.isthe.com/chongo/tech/comp/calc/
TERMUX_PKG_DESCRIPTION="Arbitrary precision console calculator"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="2.15.0.4"
TERMUX_PKG_SRCURL=https://github.com/lcn2/calc/releases/download/v$TERMUX_PKG_VERSION/calc-$TERMUX_PKG_VERSION.tar.bz2
TERMUX_PKG_SHA256=35ce2940ddf4f5f14b8b1f08eb053d4abcade2d3b3d5842f2f5b468e1ea3d1e9
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="ncurses, readline"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_EXTRA_MAKE_ARGS="LONG_BITS=$TERMUX_ARCH_BITS"
TERMUX_MAKE_PROCESSES=1
