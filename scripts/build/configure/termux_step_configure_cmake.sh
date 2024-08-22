termux_step_configure_cmake() {
	if [ "$TERMUX_CMAKE_BUILD" = Ninja ]; then
		MAKE_PROGRAM_PATH=$(command -v ninja)
	else
		MAKE_PROGRAM_PATH=$(command -v make)
	fi
	BUILD_TYPE=Release
	test "$TERMUX_DEBUG_BUILD" == "true" && BUILD_TYPE=Debug
	CMAKE_PROC=$TERMUX_ARCH
	test $CMAKE_PROC == "arm" && CMAKE_PROC='armv7-a'

	local CMAKE_ADDITIONAL_ARGS=()
	if [ "$TERMUX_ON_DEVICE_BUILD" = "false" ]; then
		CXXFLAGS+=" --target=$CCTERMUX_HOST_PLATFORM"
		CFLAGS+=" --target=$CCTERMUX_HOST_PLATFORM"
		LDFLAGS+=" --target=$CCTERMUX_HOST_PLATFORM"

		CMAKE_ADDITIONAL_ARGS+=("-DCMAKE_CROSSCOMPILING=True")
		CMAKE_ADDITIONAL_ARGS+=("-DCMAKE_LINKER=$TERMUX_STANDALONE_TOOLCHAIN/bin/$LD $LDFLAGS")
		CMAKE_ADDITIONAL_ARGS+=("-DCMAKE_SYSTEM_NAME=Android")
		CMAKE_ADDITIONAL_ARGS+=("-DCMAKE_SYSTEM_VERSION=$TERMUX_PKG_API_LEVEL")
		CMAKE_ADDITIONAL_ARGS+=("-DCMAKE_SYSTEM_PROCESSOR=$CMAKE_PROC")
		CMAKE_ADDITIONAL_ARGS+=("-DCMAKE_ANDROID_STANDALONE_TOOLCHAIN=$TERMUX_STANDALONE_TOOLCHAIN")
	else
		CMAKE_ADDITIONAL_ARGS+=("-DCMAKE_LINKER=$(command -v $LD) $LDFLAGS")
	fi

	# XXX: CMAKE_{AR,RANLIB} needed for at least jsoncpp build to not
	# pick up cross compiled binutils tool in $TERMUX_PREFIX/bin:
	cmake -G "$TERMUX_CMAKE_BUILD" "$TERMUX_PKG_SRCDIR" \
		-DCMAKE_AR="$(command -v $AR)" \
		-DCMAKE_UNAME="$(command -v uname)" \
		-DCMAKE_RANLIB="$(command -v $RANLIB)" \
		-DCMAKE_STRIP="$(command -v $STRIP)" \
		-DCMAKE_BUILD_TYPE=$BUILD_TYPE \
		-DCMAKE_C_FLAGS="$CFLAGS $CPPFLAGS" \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS $CPPFLAGS" \
		-DCMAKE_FIND_ROOT_PATH=$TERMUX_PREFIX \
		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER \
		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
		-DCMAKE_INSTALL_PREFIX=$TERMUX_PREFIX \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_MAKE_PROGRAM=$MAKE_PROGRAM_PATH \
		-DCMAKE_SKIP_INSTALL_RPATH=ON \
		-DCMAKE_USE_SYSTEM_LIBRARIES=True \
		-DDOXYGEN_EXECUTABLE= \
		-DBUILD_TESTING=OFF \
		"${CMAKE_ADDITIONAL_ARGS[@]}" \
		$TERMUX_PKG_EXTRA_CONFIGURE_ARGS
}
