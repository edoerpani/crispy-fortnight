TERMUX_PKG_HOMEPAGE=https://www.musicpd.org
TERMUX_PKG_DESCRIPTION="Music player daemon"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_VERSION=0.21.16
TERMUX_PKG_REVISION=3
TERMUX_PKG_SRCURL=https://github.com/MusicPlayerDaemon/MPD/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=fc9f14e3bc5d7cba8fff8da0bfe33781448ebf1dafef142636e1d1206e1313e1
TERMUX_PKG_DEPENDS="libc++, libcurl, libid3tag, libopus, pulseaudio, libmpdclient, openal-soft, libvorbis, libsqlite, ffmpeg, libmp3lame, libbz2, libogg, libnfs, zlib"
TERMUX_PKG_BUILD_DEPENDS="boost"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-Dalsa=disabled
-Dao=disabled
-Depoll=false
-Dexpat=disabled
-Diconv=disabled
-Dicu=disabled
-Dmad=disabled
-Dpcre=disabled
-Dsndio=disabled
"
TERMUX_PKG_CONFFILES="etc/mpd.conf var/service/mpd/run var/service/mpd/log/run"

termux_step_pre_configure() {
	# Certain packages are not safe to build on device because their
	# build.sh script deletes specific files in $TERMUX_PREFIX.
	if $TERMUX_ON_DEVICE_BUILD; then
		termux_error_exit "Package '$TERMUX_PKG_NAME' is not safe for on-device builds."
	fi

	CXXFLAGS+=" -DTERMUX -UANDROID"
	LDFLAGS+=" -llog -lOpenSLES"
	rm -f $TERMUX_PREFIX/etc/mpd.conf
}

termux_step_post_make_install() {
	install -Dm600 $TERMUX_PKG_SRCDIR/doc/mpdconf.example $TERMUX_PREFIX/etc/mpd.conf

	# Try to work around OpenSL ES library clashes:
	# Linking against libOpenSLES causes indirect linkage against
	# libskia.so, which links against the platform libjpeg.so and
	# libpng.so, which are not compatible with the Termux ones.
	#
	# On Android N also liblzma seems to conflict.
	mkdir -p $TERMUX_PREFIX/libexec
	mkdir -p $TERMUX_PREFIX/var/mpd
	mv $TERMUX_PREFIX/bin/mpd $TERMUX_PREFIX/libexec
	local SYSTEM_LIBFOLDER=lib64
	if [ $TERMUX_ARCH_BITS = 32 ]; then SYSTEM_LIBFOLDER=lib; fi

	echo "#!/bin/sh" > $TERMUX_PREFIX/bin/mpd
	cat $TERMUX_SCRIPTDIR/packages/mpd/mpd-script.sh >> $TERMUX_PREFIX/bin/mpd
	# Work around issues on devices having ffmpeg libraries
	# in a system vendor dir, reported by live_the_dream on #termux:
	local FFMPEG_LIBS="" lib
	# c++_shared needs to go first in every c++ app that uses audio directly.
	for lib in c++_shared curl ssl opus vorbis avcodec avfilter avformat avutil postproc swresample swscale sqlite3; do
		if [ -n "$FFMPEG_LIBS" ]; then FFMPEG_LIBS+=":"; fi
		FFMPEG_LIBS+="$TERMUX_PREFIX/lib/lib${lib}.so"
	done
	echo "export LD_PRELOAD=$FFMPEG_LIBS" >> $TERMUX_PREFIX/bin/mpd
	chmod +x $TERMUX_PREFIX/bin/mpd
	# /system/vendor/lib(64) needed for libqc-opt.so on
	# a xperia z5 c, reported by BrainDamage on #termux:
	echo "LD_LIBRARY_PATH=/system/$SYSTEM_LIBFOLDER:/system/vendor/$SYSTEM_LIBFOLDER:$TERMUX_PREFIX/lib exec $TERMUX_PREFIX/libexec/mpd \"\$@\"" >> $TERMUX_PREFIX/bin/mpd

	# Setup mpd service script
	mkdir -p $TERMUX_PREFIX/var/service
	cd $TERMUX_PREFIX/var/service
	mkdir -p mpd/log
	echo "#!$TERMUX_PREFIX/bin/sh" > mpd/run
	echo 'if [ -f "$HOME/.mpd/mpd.conf" ]; then CONFIG="$HOME/.mpd/mpd.conf"; else CONFIG="$PREFIX/etc/mpd.conf"; fi' >> mpd/run
	echo 'exec mpd --stdout --no-daemon $CONFIG 2>&1' >> mpd/run
	chmod +x mpd/run
	touch mpd/down
	ln -sf $PREFIX/share/termux-services/svlogger mpd/log/run
}

termux_step_create_debscripts() {
	echo "#!$TERMUX_PREFIX/bin/sh" > postinst
	echo 'mkdir -p $HOME/.mpd/playlists' >> postinst
}
