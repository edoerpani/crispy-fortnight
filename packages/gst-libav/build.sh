TERMUX_PKG_HOMEPAGE=https://gstreamer.freedesktop.org/modules/gst-libav.html
TERMUX_PKG_DESCRIPTION="GStreamer Libav plug-in contains one plugin with a set of elements using the Libav library code"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.24.4"
TERMUX_PKG_SRCURL=https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=4d3803f36008e847fc4842c8dd366162baf8359526cc46c1851bf68bb638da73
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="ffmpeg, glib, gst-plugins-base, gstreamer"
