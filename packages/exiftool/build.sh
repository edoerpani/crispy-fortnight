TERMUX_PKG_HOMEPAGE=https://exiftool.org/
TERMUX_PKG_DESCRIPTION="Utility for reading, writing and editing meta information in a wide variety of files."
TERMUX_PKG_LICENSE="Artistic-License-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=12.64
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL="https://exiftool.org/Image-ExifTool-$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=8368034ec7a984823e30a7df6fb980090098b2648dda69d8069f4b06283d9f43
TERMUX_PKG_DEPENDS="perl"
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_make_install() {
	local current_perl_version=$(. $TERMUX_SCRIPTDIR/packages/perl/build.sh; echo $TERMUX_PKG_VERSION)

	install -Dm700 "$TERMUX_PKG_SRCDIR"/exiftool \
		"$TERMUX_PKG_MASSAGEDIR/$TERMUX_PREFIX"/bin/exiftool
	find "$TERMUX_PKG_SRCDIR"/lib -name "*.pod" -delete
	mkdir -p "$TERMUX_PKG_MASSAGEDIR/$TERMUX_PREFIX/lib/perl5/site_perl/$current_perl_version"
	cp -a "$TERMUX_PKG_SRCDIR"/lib/{Image,File} \
		"$TERMUX_PKG_MASSAGEDIR/$TERMUX_PREFIX/lib/perl5/site_perl/${current_perl_version}/"
}
