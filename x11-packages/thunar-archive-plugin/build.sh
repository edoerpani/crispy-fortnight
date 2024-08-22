TERMUX_PKG_HOMEPAGE=https://docs.xfce.org/xfce/thunar/archive
TERMUX_PKG_DESCRIPTION="This plugin allows one to extract and create archive from inside the Thunar file manager."
TERMUX_PKG_LICENSE="LGPL-2.0"
TERMUX_PKG_MAINTAINER="Yisus7u7 <dev.yisus@hotmail.com>"
TERMUX_PKG_VERSION="0.5.2"
TERMUX_PKG_SRCURL=https://archive.xfce.org/src/thunar-plugins/thunar-archive-plugin/${TERMUX_PKG_VERSION%.*}/thunar-archive-plugin-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=6379f877bcfc0ea85db9f43723b6fb317893050c712bd03c2ae3232fb9d5ade3
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="atk, exo, gdk-pixbuf, glib, gtk3, harfbuzz, libcairo, libxfce4util, pango, thunar, zlib"
TERMUX_PKG_RECOMMENDS="file-roller"
TERMUX_PKG_BUILD_IN_SRC=true
