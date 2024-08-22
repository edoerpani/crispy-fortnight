TERMUX_PKG_HOMEPAGE=https://mpv.io/
TERMUX_PKG_DESCRIPTION="Command-line media player"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.35.0
TERMUX_PKG_SRCURL=https://github.com/mpv-player/mpv/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=dc411c899a64548250c142bf1fa1aa7528f1b4398a24c86b816093999049ec00
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="ffmpeg, libandroid-glob, libandroid-support, libarchive, libass, libcaca, libiconv, liblua52, libsixel, libuchardet, openal-soft, pulseaudio, rubberband, zlib"
TERMUX_PKG_RM_AFTER_INSTALL="share/icons share/applications"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-Dlibmpv=true
-Dlua=lua52
-Ddvdnav=disabled
-Dlcms2=disabled
-Dlibbluray=disabled
-Dvapoursynth=disabled
-Dzimg=disabled
-Dopenal=enabled
-Ddrm=disabled
-Dgbm=disabled
-Dgl=disabled
-Djpeg=disabled
-Dvdpau=disabled
-Dvaapi=disabled
-Dvulkan=disabled
-Dwayland=disabled
-Dx11=disabled
-Dxv=disabled
-Dandroid-media-ndk=disabled
"

termux_step_pre_configure() {
	LDFLAGS+=" -landroid-glob"
}

termux_step_post_make_install() {
	# Use opensles audio out by default:
	install -Dm600 -t $TERMUX_PREFIX/etc/mpv/ $TERMUX_PKG_BUILDER_DIR/mpv.conf
	install -Dm600 -t $TERMUX_PREFIX/share/mpv/scripts/ $TERMUX_PKG_SRCDIR/TOOLS/lua/*
}
