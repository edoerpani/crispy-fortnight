TERMUX_PKG_HOMEPAGE=https://github.com/google/flatbuffers
TERMUX_PKG_DESCRIPTION="Memory Efficient Serialization Library"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="24.3.25"
TERMUX_PKG_SRCURL=https://github.com/google/flatbuffers/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=4157c5cacdb59737c5d627e47ac26b140e9ee28b1102f812b36068aab728c1ed
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="libc++"

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DFLATBUFFERS_BUILD_SHAREDLIB=ON
-DFLATBUFFERS_BUILD_TESTS=OFF
"
