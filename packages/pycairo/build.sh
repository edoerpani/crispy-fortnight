TERMUX_PKG_HOMEPAGE=https://www.cairographics.org/pycairo/
TERMUX_PKG_DESCRIPTION="Python bindings for the cairo graphics library"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.23.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/pygobject/pycairo/releases/download/v${TERMUX_PKG_VERSION}/pycairo-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=9b61ac818723adc04367301317eb2e814a83522f07bbd1f409af0dada463c44c
TERMUX_PKG_DEPENDS="libcairo, python"
TERMUX_PKG_PYTHON_COMMON_DEPS="wheel"