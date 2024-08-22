TERMUX_PKG_HOMEPAGE=https://www.kde.org/
TERMUX_PKG_DESCRIPTION="Set of item models extending the Qt model-view framework (KDE)"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="Simeon Huang <symeon@librehat.com>"
TERMUX_PKG_VERSION=5.101.0
TERMUX_PKG_SRCURL="https://download.kde.org/stable/frameworks/${TERMUX_PKG_VERSION%.*}/kitemmodels-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256=5aaee068a8d0c85dfc50c5ade2c5eb913c5936f68e902c302c36bbc2ac70f426
TERMUX_PKG_DEPENDS="libc++, qt5-qtbase, qt5-qtdeclarative"
TERMUX_PKG_BUILD_DEPENDS="extra-cmake-modules, qt5-qtbase-cross-tools, qt5-qtdeclarative-cross-tools"
