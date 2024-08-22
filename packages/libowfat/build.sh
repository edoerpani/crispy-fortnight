TERMUX_PKG_HOMEPAGE=http://www.fefe.de/libowfat/
TERMUX_PKG_DESCRIPTION="GPL reimplementation of libdjb"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.33
TERMUX_PKG_SRCURL=https://www.fefe.de/libowfat/libowfat-$TERMUX_PKG_VERSION.tar.xz
TERMUX_PKG_SHA256=311ec8b3f4b72bb442e323fb013a98f956fa745547f2bc9456287b20d027cd7d
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_NO_STATICSPLIT=true
TERMUX_PKG_EXTRA_MAKE_ARGS="
prefix=$TERMUX_PREFIX
LIBDIR=$TERMUX_PREFIX/lib
MAN3DIR=$TERMUX_PREFIX/share/man/man3
"
TERMUX_MAKE_PROCESSES=1

termux_step_pre_configure() {
	# Use pregenerated entities.h.
	cp $TERMUX_PKG_BUILDER_DIR/entities.h $TERMUX_PKG_BUILDDIR/
	touch -d "next hour" $TERMUX_PKG_BUILDDIR/entities.h
}