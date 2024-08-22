TERMUX_PKG_HOMEPAGE=https://github.com/zsh-users/zsh-completions
TERMUX_PKG_DESCRIPTION="Additional completion definitions for Zsh"
TERMUX_PKG_LICENSE=custom
TERMUX_PKG_LICENSE_FILE=LICENSE
TERMUX_PKG_MAINTAINER=@termux
TERMUX_PKG_VERSION="0.35.0"
TERMUX_PKG_SRCURL=$TERMUX_PKG_HOMEPAGE/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=811bb4213622720872e08d6e0857f1dd7bc12ff7aa2099a170b76301a53f4fbe
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_DEPENDS=zsh
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_make_install() {
	install -Dm644 src/* -t "$TERMUX_PREFIX/share/zsh/site-functions"
}
