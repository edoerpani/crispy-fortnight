TERMUX_PKG_HOMEPAGE=https://github.com/bergercookie/asm-lsp
TERMUX_PKG_DESCRIPTION="language server for NASM/GAS/GO assembly"
TERMUX_PKG_LICENSE="BSD 2-Clause"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.7.1"
TERMUX_PKG_BUILD_DEPENDS="openssl"
TERMUX_PKG_SRCURL=https://github.com/bergercookie/asm-lsp/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=0d3ce72b584bcc3b620439063efe83e0663ddf7b31fc2a59d68af3c74d8aea0e
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_rust

	cargo fetch --target "${CARGO_TARGET_NAME}"

	local d
	for d in $HOME/.cargo/registry/src/*/memmap2-*; do
		patch --silent -p1 -d "${d}" < "$TERMUX_PKG_BUILDER_DIR/memmap2.diff" || :
	done
}
