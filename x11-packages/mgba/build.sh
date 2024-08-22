TERMUX_PKG_HOMEPAGE=https://mgba.io/
TERMUX_PKG_DESCRIPTION="An emulator for running Game Boy Advance games"
TERMUX_PKG_LICENSE="MPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.10.0
TERMUX_PKG_SRCURL=https://github.com/mgba-emu/mgba/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=e2d66d9ce7c51b1ef3b339b04e871287bf166f6a1d7125ef112dbf53ab8bbd48
TERMUX_PKG_DEPENDS="ffmpeg, libedit, libelf, liblua54, libpng, libsqlite, libzip, mesa, sdl2, zlib"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DBUILD_GLES2=OFF
-DBUILD_GLES3=OFF
-DBUILD_QT=OFF
-DLUA_MATH_LIBRARY=m
-DUSE_EPOXY=OFF
-DUSE_LUA=5.4
-DUSE_MINIZIP=OFF
"

termux_step_pre_configure() {
	CPPFLAGS+=" -DHAVE_STRTOF_L"
}
