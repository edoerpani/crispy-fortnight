TERMUX_PKG_HOMEPAGE=https://tools.suckless.org/dmenu/
TERMUX_PKG_DESCRIPTION="Generic menu for X"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=5.2
TERMUX_PKG_SRCURL=https://dl.suckless.org/tools/dmenu-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=d4d4ca77b59140f272272db537e05bb91a5914f56802652dc57e61a773d43792
TERMUX_PKG_DEPENDS="dash, fontconfig, libx11, libxft, libxinerama"
TERMUX_PKG_BUILD_DEPENDS="xorgproto"
TERMUX_PKG_BUILD_IN_SRC=true
