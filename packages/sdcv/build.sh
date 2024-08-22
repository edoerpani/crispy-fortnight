TERMUX_PKG_HOMEPAGE=http://dushistov.github.io/sdcv/
TERMUX_PKG_DESCRIPTION="StarDict Console Version"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.5.5
TERMUX_PKG_SRCURL=https://github.com/Dushistov/sdcv/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=4d2519e8f8479b9301dc91e9cda3e1eefef19970ece0e8c05f0c7b7ade5dc94b
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"
TERMUX_PKG_DEPENDS="glib, libc++, readline, zlib"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DENABLE_NLS=off"
