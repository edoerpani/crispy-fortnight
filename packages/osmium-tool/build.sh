TERMUX_PKG_HOMEPAGE=https://osmcode.org/osmium-tool/
TERMUX_PKG_DESCRIPTION="A multipurpose command line tool based on the Osmium Library"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_LICENSE_FILE="LICENSE.txt"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.15.0"
TERMUX_PKG_SRCURL=https://github.com/osmcode/osmium-tool/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=0b3be2f07d60dfb93f65d6a9f1af1fc9cf6ef68e5a460997d841c93079c3377b
TERMUX_PKG_DEPENDS="boost, libbz2, libc++, libexpat, liblz4, zlib"
TERMUX_PKG_BUILD_DEPENDS="boost-headers, libosmium, libprotozero"
TERMUX_PKG_GROUPS="science"
TERMUX_PKG_AUTO_UPDATE=true