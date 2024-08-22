TERMUX_PKG_HOMEPAGE=https://oneapi-src.github.io/oneTBB/
TERMUX_PKG_DESCRIPTION="oneAPI Threading Building Blocks"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2021.7.0
TERMUX_PKG_SRCURL=https://github.com/oneapi-src/oneTBB/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=2cae2a80cda7d45dc7c072e4295c675fff5ad8316691f26f40539f7e7e54c0cc
TERMUX_PKG_DEPENDS="libc++"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DTBB_STRICT=OFF
-DTBB_TEST=OFF
"
