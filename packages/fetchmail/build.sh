TERMUX_PKG_HOMEPAGE=https://www.fetchmail.info/
TERMUX_PKG_DESCRIPTION="A remote-mail retrieval utility"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_LICENSE_FILE="COPYING"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=6.4.34
TERMUX_PKG_SRCURL=https://sourceforge.net/projects/fetchmail/files/branch_${TERMUX_PKG_VERSION:0:3}/fetchmail-$TERMUX_PKG_VERSION.tar.xz
TERMUX_PKG_SHA256=c3bdded1b5ce236960bd1ceeee3f3257220ed99c3eec84a5d76bb5618e3258d4
TERMUX_PKG_DEPENDS="openssl"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-ssl=$TERMUX_PREFIX"
_PYTHON_VERSION=$(. $TERMUX_SCRIPTDIR/packages/python/build.sh; echo $_MAJOR_VERSION)
TERMUX_PKG_RM_AFTER_INSTALL="lib/python${_PYTHON_VERSION}/site-packages/__pycache__"

termux_step_pre_configure() {
	termux_setup_python_crossenv
	pushd $TERMUX_PYTHON_CROSSENV_SRCDIR
	_CROSSENV_PREFIX=$TERMUX_PKG_BUILDDIR/python-crossenv-prefix
	python${_PYTHON_VERSION} -m crossenv \
		$TERMUX_PREFIX/bin/python${_PYTHON_VERSION} \
		${_CROSSENV_PREFIX}
	popd
	. ${_CROSSENV_PREFIX}/bin/activate
	build-pip install wheel
}
