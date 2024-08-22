TERMUX_PKG_HOMEPAGE=https://lxqt.github.io
TERMUX_PKG_DESCRIPTION="A terminal emulator widget for Qt 5"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Simeon Huang <symeon@librehat.com>"
TERMUX_PKG_VERSION="1.2.0"
TERMUX_PKG_SRCURL="https://github.com/lxqt/qtermwidget/releases/download/${TERMUX_PKG_VERSION}/qtermwidget-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256=44ba43ff48683ba1b4a5192dafab3076633748cf2f8cd6816f68eeab240de88c
TERMUX_PKG_DEPENDS="libc++, qt5-qtbase"
TERMUX_PKG_BUILD_DEPENDS="lxqt-build-tools, qt5-qttools-cross-tools"
TERMUX_PKG_AUTO_UPDATE=true