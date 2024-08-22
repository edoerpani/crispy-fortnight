TERMUX_PKG_HOMEPAGE=https://github.com/ipmitool/ipmitool
TERMUX_PKG_DESCRIPTION="Command-line interface to IPMI-enabled devices"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.8.19
TERMUX_PKG_SRCURL=https://github.com/ipmitool/ipmitool/archive/refs/tags/IPMITOOL_${TERMUX_PKG_VERSION//./_}.tar.gz
TERMUX_PKG_SHA256=48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c
TERMUX_PKG_DEPENDS="openssl, readline"

termux_step_pre_configure() {
	sh bootstrap
}
