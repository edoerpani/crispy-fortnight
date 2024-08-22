TERMUX_PKG_HOMEPAGE="http://chipmunk2d.net"
TERMUX_PKG_DESCRIPTION="A fast and lightweight 2D game physics library"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="7.0.3"
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL="https://github.com/slembcke/Chipmunk2D/archive/refs/tags/Chipmunk-$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=1e6f093812d6130e45bdf4cb80280cb3c93d1e1833d8cf989d554d7963b7899a
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_VERSION_REGEXP="\d+\.\d+\.\d+"
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"
TERMUX_PKG_BLACKLISTED_ARCHES="arm"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DBUILD_SHARED=ON
-DBUILD_STATIC=OFF
"
