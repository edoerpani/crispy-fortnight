TERMUX_PKG_HOMEPAGE=https://www.music.mcgill.ca/~gary/rtmidi/
TERMUX_PKG_DESCRIPTION="A set of C++ classes that provides a common API for realtime MIDI input/output"
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_LICENSE_FILE="LICENSE"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=5.0.0
TERMUX_PKG_SRCURL=https://www.music.mcgill.ca/~gary/rtmidi/release/rtmidi-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=48db0ed58c8c0e207b5d7327a0210b5bcaeb50e26387935d02829239b0f3c2b9
TERMUX_PKG_DEPENDS="libc++"
TERMUX_PKG_FORCE_CMAKE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DRTMIDI_API_ALSA=OFF
-DRTMIDI_API_JACK=OFF
"
