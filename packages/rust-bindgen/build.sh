TERMUX_PKG_HOMEPAGE=https://github.com/rust-lang/rust-bindgen
TERMUX_PKG_DESCRIPTION="Automatically generates Rust FFI bindings to C (and some C++) libraries"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.64.0
TERMUX_PKG_SRCURL=https://github.com/rust-lang/rust-bindgen/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=9d987e7e2cefebed2c856ba36438e75af00aa08d4274fc15b8c20886065cb1f2
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"

termux_step_pre_configure() {
	termux_setup_rust
}

termux_step_make() {
	local BUILD_TYPE=
	if [ $TERMUX_DEBUG_BUILD = false ]; then
		BUILD_TYPE=--release
	fi

	cargo build --jobs $TERMUX_MAKE_PROCESSES \
		--target $CARGO_TARGET_NAME ${BUILD_TYPE}
}

termux_step_make_install() {
	local BUILD_TYPE=release
	if [ $TERMUX_DEBUG_BUILD = true ]; then
		BUILD_TYPE=debug
	fi

	install -Dm755 -t $TERMUX_PREFIX/bin \
		target/${CARGO_TARGET_NAME}/${BUILD_TYPE}/bindgen
}
