TERMUX_PKG_HOMEPAGE=https://github.com/zeux/volk
TERMUX_PKG_DESCRIPTION="Meta loader for Vulkan API"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.3.270"
TERMUX_PKG_SRCURL=https://github.com/zeux/volk/archive/refs/tags/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=95530bc7850b0358e4bad899eb653f882ee8a08088257d90c5042cec02208f52
TERMUX_PKG_BUILD_DEPENDS="vulkan-headers, vulkan-loader-generic"
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_NO_STATICSPLIT=true
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DVOLK_INSTALL=ON
"
