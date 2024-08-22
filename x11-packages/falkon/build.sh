TERMUX_PKG_HOMEPAGE=https://www.falkon.org/
TERMUX_PKG_DESCRIPTION="Cross-platform Qt-based web browser"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="23.08.4"
TERMUX_PKG_SRCURL=https://download.kde.org/stable/release-service/$TERMUX_PKG_VERSION/src/falkon-$TERMUX_PKG_VERSION.tar.xz
TERMUX_PKG_SHA256=f08484b768ccc7cfc097d473c1ccc66986f839f79b5f3516a9aeba4ee7286d63
TERMUX_PKG_DEPENDS="karchive, qt5-qtsvg, qt5-qtwebchannel, qt5-qtwebengine, qt5-qtx11extras"

termux_step_post_get_source() {
    # Do not include i18n contents
    rm -r po
}
