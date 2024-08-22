TERMUX_PKG_HOMEPAGE=https://docs.xfce.org/panel-plugins/xfce4-timer-plugin/start
TERMUX_PKG_DESCRIPTION="alarm and timer module for Xfce panel"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Yisus7u7 <dev.yisus@hotmail.com>"
_MAJOR_VERSION=1.7
TERMUX_PKG_VERSION=${_MAJOR_VERSION}.1
TERMUX_PKG_REVISION=6
TERMUX_PKG_SRCURL=https://archive.xfce.org/src/panel-plugins/xfce4-timer-plugin/${_MAJOR_VERSION}/xfce4-timer-plugin-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=4b52d2911b1949e945971be6533155ee6ba99c77078eac7fd43b0f2aeca824e3
TERMUX_PKG_DEPENDS="atk, gdk-pixbuf, glib, gtk3, harfbuzz, libcairo, libxfce4ui, libxfce4util, pango, xfce4-panel"
TERMUX_PKG_BUILD_IN_SRC=true
