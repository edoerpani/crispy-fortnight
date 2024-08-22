TERMUX_PKG_HOMEPAGE=http://www.eclipse.org/jdt/core/
TERMUX_PKG_DESCRIPTION="Eclipse Compiler for Java"
TERMUX_PKG_LICENSE="EPL-2.0"
_PKG_VERSION=3.19.0
TERMUX_PKG_VERSION=2:$_PKG_VERSION
TERMUX_PKG_SHA256=eedc5942f164696b9a8a8bc62a9b29516f82f2c7010946de1c7e6c8db36c63f7
TERMUX_PKG_SRCURL=https://repo1.maven.org/maven2/org/eclipse/jdt/ecj/$_PKG_VERSION/ecj-$_PKG_VERSION.jar
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BREAKS="ecj4.6"
TERMUX_PKG_REPLACES="ecj4.6"

termux_step_extract_package() {
	# Certain packages are not safe to build on device because their
	# build.sh script deletes specific files in $TERMUX_PREFIX.
	if $TERMUX_ON_DEVICE_BUILD; then
		termux_error_exit "Package '$TERMUX_PKG_NAME' is not safe for on-device builds."
	fi

	mkdir $TERMUX_PKG_SRCDIR
}

termux_step_make() {
	local RAW_JAR=$TERMUX_PKG_CACHEDIR/ecj-${_PKG_VERSION}.jar
	termux_download $TERMUX_PKG_SRCURL \
		$RAW_JAR \
		$TERMUX_PKG_SHA256

	mkdir -p $TERMUX_PREFIX/share/{dex,java}
	$TERMUX_D8 \
		--classpath $ANDROID_HOME/platforms/android-$TERMUX_PKG_API_LEVEL/android.jar \
		--release \
		--min-api 21 \
		--output $TERMUX_PKG_TMPDIR \
		$RAW_JAR

	# Package classes.dex into jar:
	cd $TERMUX_PKG_TMPDIR
	jar cf ecj.jar classes.dex
	# Add needed properties file to jar file:
	jar xf $RAW_JAR org/eclipse/jdt/internal/compiler/batch/messages.properties
	jar uf ecj.jar	org/eclipse/jdt/internal/compiler/batch/messages.properties
	jar xf $RAW_JAR org/eclipse/jdt/internal/compiler/problem/messages.properties
	jar uf ecj.jar	org/eclipse/jdt/internal/compiler/problem/messages.properties
	jar xf $RAW_JAR org/eclipse/jdt/internal/compiler/messages.properties
	jar uf ecj.jar	org/eclipse/jdt/internal/compiler/messages.properties
	jar xf $RAW_JAR org/eclipse/jdt/internal/compiler/parser/readableNames.props
	jar uf ecj.jar	org/eclipse/jdt/internal/compiler/parser/readableNames.props
	for i in $(seq 1 24); do
		jar xf $RAW_JAR org/eclipse/jdt/internal/compiler/parser/parser$i.rsc
		jar uf ecj.jar	org/eclipse/jdt/internal/compiler/parser/parser$i.rsc
	done
	# Move into place:
	mv ecj.jar $TERMUX_PREFIX/share/dex/ecj.jar

	rm -rf android-jar
	mkdir android-jar
	cd android-jar

	# We need the android classes for JDT to compile against.
	cp $ANDROID_HOME/platforms/android-28/android.jar .
	unzip -q android.jar
	rm -Rf android.jar resources.arsc res assets
	jar cfM android.jar .

	cp $TERMUX_PKG_TMPDIR/android-jar/android.jar $TERMUX_PREFIX/share/java/android.jar

	# Bundle in an android.jar from an older API also, for those who want to
	# build apps that run on older Android versions.
	rm -Rf ./*
	cp $ANDROID_HOME/platforms/android-21/android.jar android.jar
	unzip -q android.jar
	rm -Rf android.jar resources.arsc res assets
	jar cfM android-21.jar .
	cp $TERMUX_PKG_TMPDIR/android-jar/android-21.jar $TERMUX_PREFIX/share/java/

	rm -Rf $TERMUX_PREFIX/bin/javac
	install $TERMUX_PKG_BUILDER_DIR/ecj $TERMUX_PREFIX/bin/ecj
	perl -p -i -e "s%\@TERMUX_PREFIX\@%${TERMUX_PREFIX}%g" $TERMUX_PREFIX/bin/ecj
	install $TERMUX_PKG_BUILDER_DIR/ecj-21 $TERMUX_PREFIX/bin/ecj-21
	perl -p -i -e "s%\@TERMUX_PREFIX\@%${TERMUX_PREFIX}%g" $TERMUX_PREFIX/bin/ecj-21
}
