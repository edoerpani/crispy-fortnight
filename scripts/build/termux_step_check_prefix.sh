termux_step_check_prefix() {
	if [ "$TERMUX_ON_DEVICE_BUILD" = "true" ]; then
		new_files=$(find $TERMUX_PREFIX \
				 -path $TERMUX_PREFIX/tmp -prune -o \
				 -path $TERMUX_PREFIX/var/run -prune -o \
				 -path $TERMUX_PREFIX/var/log/sv -prune -o \
				 -path $TERMUX_PREFIX/etc/lvm/backup -prune -o \
				 -path $TERMUX_PREFIX/etc/lvm/archive -prune -o \
				 -newer "$TERMUX_BUILD_TS_FILE" -type f \
				 -print)
	else
		new_files=$(find $TERMUX_PREFIX \
				 -newer "$TERMUX_BUILD_TS_FILE" -type f)
	fi

	if [ ! -z "$new_files" ]; then
		termux_error_exit "$TERMUX_PREFIX was modified:\n\n$new_files\n\nPlease change the build script so that files are installed straight into TERMUX_PKG_MASSAGEDIR instead of PREFIX."
	fi
}
