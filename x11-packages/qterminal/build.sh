TERMUX_PKG_HOMEPAGE=https://lxqt.github.io
TERMUX_PKG_DESCRIPTION="A lightweight Qt terminal emulator"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Simeon Huang <symeon@librehat.com>"
TERMUX_PKG_VERSION="1.3.0"
TERMUX_PKG_SRCURL="https://github.com/lxqt/qterminal/releases/download/${TERMUX_PKG_VERSION}/qterminal-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256=7e45e84c36136fc2bb843c936335d848d343bb5e3357b6610fc8bd5743a170c5
TERMUX_PKG_DEPENDS="libc++, qt5-qtbase, qt5-qtx11extras, qtermwidget"
TERMUX_PKG_BUILD_DEPENDS="lxqt-build-tools, qt5-qttools-cross-tools"
TERMUX_PKG_AUTO_UPDATE=true
