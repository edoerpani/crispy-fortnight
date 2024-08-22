TERMUX_PKG_HOMEPAGE=https://github.com/gabime/spdlog
TERMUX_PKG_DESCRIPTION="Very fast, header-only/compiled, C++ logging library"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.13.0"
TERMUX_PKG_SRCURL=https://github.com/gabime/spdlog/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=534f2ee1a4dcbeb22249856edfb2be76a1cf4f708a20b0ac2ed090ee24cfdbc9
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="libc++"
TERMUX_PKG_BUILD_DEPENDS="fmt"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DSPDLOG_BUILD_SHARED=ON
-DSPDLOG_FMT_EXTERNAL=ON
"
