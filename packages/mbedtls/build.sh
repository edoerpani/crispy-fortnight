TERMUX_PKG_HOMEPAGE=https://tls.mbed.org/
TERMUX_PKG_DESCRIPTION="Light-weight cryptographic and SSL/TLS library"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="Andy Li @andyli"
TERMUX_PKG_VERSION=2.17.0
TERMUX_PKG_REVISION=2
TERMUX_PKG_SHA256=321a2c0220d9f75703e929c01dabba7b77da4cf2e39944897fc41d888bb1ef0d
TERMUX_PKG_BREAKS="mbedtls-dev"
TERMUX_PKG_REPLACES="mbedtls-dev"
TERMUX_PKG_SRCURL=https://github.com/ARMmbed/mbedtls/archive/mbedtls-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DUSE_STATIC_MBEDTLS_LIBRARY=OFF
-DUSE_SHARED_MBEDTLS_LIBRARY=ON
-DENABLE_TESTING=OFF
-DENABLE_PROGRAMS=OFF
"
