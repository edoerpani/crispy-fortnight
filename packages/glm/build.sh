TERMUX_PKG_HOMEPAGE=https://glm.g-truc.net/
TERMUX_PKG_DESCRIPTION="C++ mathematics library for graphics software based on the GLSL specifications"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="copying.txt"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.9.9.8
TERMUX_PKG_SRCURL=https://github.com/g-truc/glm/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=7d508ab72cb5d43227a3711420f06ff99b0a0cb63ee2f93631b162bfe1fe9592
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DGLM_TEST_ENABLE=OFF"
