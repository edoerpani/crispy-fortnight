TERMUX_PKG_HOMEPAGE=https://github.com/pystardust/ytfzf
TERMUX_PKG_DESCRIPTION="A POSIX script that helps you find Youtube videos (without API)"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.6.0
TERMUX_PKG_SRCURL=https://github.com/pystardust/ytfzf/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=bc54847ec3d613e25902404cfcb8dfdc657c8258b7cefdeb581cc92d58696835
TERMUX_PKG_DEPENDS="curl, jq"
TERMUX_PKG_RECOMMENDS="fzf, mpv"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_EXTRA_MAKE_ARGS="PREFIX=$TERMUX_PREFIX"

termux_step_make() {
	:
}
