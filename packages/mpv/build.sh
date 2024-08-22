TERMUX_PKG_HOMEPAGE=https://mpv.io/
TERMUX_PKG_DESCRIPTION="Command-line media player"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_VERSION=0.30.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/mpv-player/mpv/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=33a1bcb7e74ff17f070e754c15c52228cf44f2cefbfd8f34886ae81df214ca35
TERMUX_PKG_DEPENDS="ffmpeg, libandroid-glob, libandroid-support, libcaca, libiconv, liblua52, pulseaudio, openal-soft"
TERMUX_PKG_RM_AFTER_INSTALL="share/icons share/applications"

termux_step_pre_configure() {
	LDFLAGS+=" -landroid-glob"
}

termux_step_make_install() {
	cd $TERMUX_PKG_SRCDIR

	./bootstrap.py

	./waf configure \
		--prefix=$TERMUX_PREFIX \
		--disable-gl \
		--disable-jpeg \
		--disable-lcms2 \
		--disable-libarchive \
		--disable-libass \
		--enable-lua \
		--enable-pulse \
		--enable-openal \
		--enable-caca \
		--disable-alsa \
		--disable-x11

	./waf -v install

	# Use opensles audio out be default:
	mkdir -p $TERMUX_PREFIX/etc/mpv
	cp $TERMUX_PKG_BUILDER_DIR/mpv.conf $TERMUX_PREFIX/etc/mpv/mpv.conf

	# Try to work around OpenSL ES library clashes:
	# Linking against libOpenSLES causes indirect linkage against
	# libskia.so, which links against the platform libjpeg.so and
	# libpng.so, which are not compatible with the Termux ones.
	#
	# On Android N also liblzma seems to conflict.
	mkdir -p $TERMUX_PREFIX/libexec
	mv $TERMUX_PREFIX/bin/mpv $TERMUX_PREFIX/libexec

	local SYSTEM_LIBFOLDER=lib64
	if [ $TERMUX_ARCH_BITS = 32 ]; then SYSTEM_LIBFOLDER=lib; fi

	echo "#!/bin/sh" > $TERMUX_PREFIX/bin/mpv

	# Work around issues on devices having ffmpeg libraries
	# in a system vendor dir, reported by live_the_dream on #termux:
	local PRELOAD_LIBS="" lib
	for lib in lzma glib-2.0 avcodec avfilter avformat avutil postproc swresample swscale; do
		if [ -n "$PRELOAD_LIBS" ]; then PRELOAD_LIBS+=":"; fi
		PRELOAD_LIBS+="$TERMUX_PREFIX/lib/lib${lib}.so"
	done

	{
		echo "LD_PRELOAD=$PRELOAD_LIBS"
		echo "if [ -e "/system/$SYSTEM_LIBFOLDER/liblzma.so" ]; then"
		echo "    LD_PRELOAD=/system/$SYSTEM_LIBFOLDER/liblzma.so:\$LD_PRELOAD"
		echo "fi"
		echo "export LD_PRELOAD"
	} >> $TERMUX_PREFIX/bin/mpv

	# /system/vendor/lib(64) needed for libqc-opt.so on
	# a xperia z5 c, reported by BrainDamage on #termux:
	echo "LD_LIBRARY_PATH=/system/$SYSTEM_LIBFOLDER:/system/vendor/$SYSTEM_LIBFOLDER:$TERMUX_PREFIX/lib exec $TERMUX_PREFIX/libexec/mpv \"\$@\"" >> $TERMUX_PREFIX/bin/mpv

	chmod +x $TERMUX_PREFIX/bin/mpv
}
