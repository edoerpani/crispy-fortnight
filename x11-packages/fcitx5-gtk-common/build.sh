TERMUX_PKG_HOMEPAGE=https://fcitx-im.org/
TERMUX_PKG_DESCRIPTION="Fcitx gtk library"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="5.1.0"
TERMUX_PKG_SRCURL=https://github.com/fcitx/fcitx5-gtk/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=b064d4be9d603583f1b5da8f809c28b0fa64d9c6a696fa318b64c47903f4fc4c
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"
TERMUX_PKG_DEPENDS="glib"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DENABLE_GIR=OFF
-DENABLE_GTK2_IM_MODULE=ON
-DENABLE_GTK3_IM_MODULE=ON
-DENABLE_GTK4_IM_MODULE=ON
"
