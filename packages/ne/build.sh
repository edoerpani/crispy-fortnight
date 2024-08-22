TERMUX_PKG_HOMEPAGE=http://ne.di.unimi.it/
TERMUX_PKG_DESCRIPTION="Easy-to-use and powerful text editor"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="David Martínez @vaites"
TERMUX_PKG_VERSION=3.2.1
TERMUX_PKG_SRCURL=https://fossies.org/linux/misc/ne-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=420e4aa9f1b0485c18b3971a32a980c4fad8a34d3911c89b7cd61ddedb366618
TERMUX_PKG_DEPENDS="libandroid-support, ncurses"
TERMUX_PKG_RM_AFTER_INSTALL="info/"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
	export OPTS="$CFLAGS $CPPFLAGS"
}

termux_step_create_debscripts() {
	cat <<- EOF > ./postinst
	#!$TERMUX_PREFIX/bin/sh
	if [ "\$1" = "configure" ] || [ "\$1" = "abort-upgrade" ]; then
		if [ -x "$TERMUX_PREFIX/bin/update-alternatives" ]; then
			update-alternatives --install \
				$TERMUX_PREFIX/bin/editor editor $TERMUX_PREFIX/bin/ne 15
		fi
	fi
	EOF

	cat <<- EOF > ./prerm
	#!$TERMUX_PREFIX/bin/sh
	if [ "\$1" != "upgrade" ]; then
		if [ -x "$TERMUX_PREFIX/bin/update-alternatives" ]; then
			update-alternatives --remove editor $TERMUX_PREFIX/bin/ne
		fi
	fi
	EOF
}
