TERMUX_PKG_HOMEPAGE=https://github.com/vgmstream/vgmstream
TERMUX_PKG_DESCRIPTION="A library for playback of various streamed audio formats used in video games"
TERMUX_PKG_LICENSE="ISC"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1896"
TERMUX_PKG_SRCURL=https://github.com/vgmstream/vgmstream/archive/refs/tags/r${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=3e4de85e3775b41b102fbd794cd40130f5e9561ecb960f6f2b690d8084a7c22a
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_VERSION_REGEXP='\d+'
TERMUX_PKG_DEPENDS="ffmpeg, libao, libjansson, libspeex, libvorbis, mpg123"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DUSE_G719=OFF
-DUSE_ATRAC9=OFF
-DUSE_CELT=OFF
-DBUILD_AUDACIOUS=OFF
"
