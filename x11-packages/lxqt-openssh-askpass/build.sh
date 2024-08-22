TERMUX_PKG_HOMEPAGE=https://lxqt.github.io
TERMUX_PKG_DESCRIPTION="GUI to query passwords on behalf of SSH agents"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="Simeon Huang <symeon@librehat.com>"
TERMUX_PKG_VERSION="1.4.0"
TERMUX_PKG_SRCURL="https://github.com/lxqt/lxqt-openssh-askpass/releases/download/${TERMUX_PKG_VERSION}/lxqt-openssh-askpass-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256=2ba6bcac5d90db846dce7895d03294126315ec20e59977f9f2faadf3e668c54a
TERMUX_PKG_DEPENDS="libc++, qt5-qtbase, liblxqt"
TERMUX_PKG_BUILD_DEPENDS="lxqt-build-tools, qt5-qtbase-cross-tools, qt5-qttools-cross-tools"
TERMUX_PKG_AUTO_UPDATE=true

