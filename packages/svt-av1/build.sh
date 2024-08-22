TERMUX_PKG_HOMEPAGE=https://gitlab.com/AOMediaCodec/SVT-AV1
TERMUX_PKG_DESCRIPTION="Scalable Video Technology for AV1 (SVT-AV1 Encoder and Decoder)"
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_LICENSE_FILE="LICENSE.md, PATENTS.md"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.7.0"
TERMUX_PKG_SRCURL=https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v${TERMUX_PKG_VERSION}/SVT-AV1-v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=ce0973584f1a187aa4abf63f509ff8464397120878e322a3153f87e9c161fc4f
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DBUILD_TESTING=OFF
-DCMAKE_OUTPUT_DIRECTORY=$TERMUX_PKG_BUILDDIR
-DCOMPILE_C_ONLY=ON
"

termux_step_pre_configure() {
	LDFLAGS+=" -lm"
}
