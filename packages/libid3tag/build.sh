TERMUX_PKG_HOMEPAGE=http://www.underbit.com/products/mad/
TERMUX_PKG_DESCRIPTION="MAD ID3 tag manipulation library"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.16.3"
TERMUX_PKG_SRCURL=https://codeberg.org/tenacityteam/libid3tag/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=0561009778513a95d91dac33cee8418d6622f710450a7cb56a74636d53b588cb
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"
TERMUX_PKG_DEPENDS="zlib"
TERMUX_PKG_BREAKS="libid3tag-dev"
TERMUX_PKG_REPLACES="libid3tag-dev"
