TERMUX_PKG_HOMEPAGE=https://lxqt.github.io
TERMUX_PKG_DESCRIPTION="LXQt Image Viewer"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Simeon Huang <symeon@librehat.com>"
TERMUX_PKG_VERSION="1.2.0"
TERMUX_PKG_SRCURL="https://github.com/lxqt/lximage-qt/releases/download/${TERMUX_PKG_VERSION}/lximage-qt-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256=757eb11eba7183a41ea7a87eccd3a4fbd7374856a91d2eccff56207de906e463
TERMUX_PKG_DEPENDS="glib, libc++, libexif, libfm-qt, libx11, libxfixes, qt5-qtbase, qt5-qtsvg, qt5-qtx11extras"
TERMUX_PKG_BUILD_DEPENDS="lxqt-build-tools, qt5-qtbase-cross-tools, qt5-qttools-cross-tools"
TERMUX_PKG_AUTO_UPDATE=true
