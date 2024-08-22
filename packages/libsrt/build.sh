TERMUX_PKG_HOMEPAGE=https://github.com/Haivision/srt
TERMUX_PKG_DESCRIPTION="Secure Reliable Transport (SRT) Protocol"
TERMUX_PKG_LICENSE="MPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.5.3"
TERMUX_PKG_SRCURL=https://github.com/Haivision/srt/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=befaeb16f628c46387b898df02bc6fba84868e86a6f6d8294755375b9932d777
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="libc++, openssl"
TERMUX_PKG_FORCE_CMAKE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DUSE_GNUTLS=OFF
-DENABLE_STATIC=OFF
-DENABLE_TESTING=OFF
-DENABLE_UNITTESTS=OFF
"
