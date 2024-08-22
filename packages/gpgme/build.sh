TERMUX_PKG_HOMEPAGE=https://www.gnupg.org/related_software/gpgme/
TERMUX_PKG_DESCRIPTION="Library designed to make access to GnuPG easier"
TERMUX_PKG_LICENSE="GPL-2.0, LGPL-2.1, MIT"
TERMUX_PKG_LICENSE_FILE="COPYING, COPYING.LESSER, LICENSES"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.20.0
TERMUX_PKG_SRCURL=ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=25a5785a5da356689001440926b94e967d02e13c49eb7743e35ef0cf22e42750
TERMUX_PKG_DEPENDS="gnupg (>= 2.2.9-1), libassuan, libgpg-error"
TERMUX_PKG_BREAKS="gpgme-dev"
TERMUX_PKG_REPLACES="gpgme-dev"
# Use "--disable-gpg-test" to avoid "No rule to make target `../../src/libgpgme-pthread.la":
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--disable-gpg-test
--enable-languages=cpp
--with-gpg=$TERMUX_PREFIX/bin/gpg2
--without-g13
--without-gpgconf
--without-gpgsm
"

termux_step_pre_configure() {
	LDFLAGS+=" $($CC -print-libgcc-file-name)"
}
