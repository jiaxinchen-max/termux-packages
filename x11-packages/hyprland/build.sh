# Hyprland main and its matching dependency lock; no moving source URLs.
TERMUX_PKG_HOMEPAGE="https://github.com/jiaxinchen-max/Hyprland"
TERMUX_PKG_DESCRIPTION="hyprland with native Termux Android backend support"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@jiaxinchen-max"
TERMUX_PKG_VERSION="0.57.0"
TERMUX_PKG_REVISION=7
TERMUX_PKG_SRCURL="https://github.com/jiaxinchen-max/Hyprland/archive/70ec30e71656bce5e1af3364129421a4386a69e1.tar.gz"
TERMUX_PKG_SHA256=74d5a61773d0be10e465d19b4cb8d0b344f73ff3a49f5d231aafa861b9a88a2e
TERMUX_PKG_API_LEVEL=28
TERMUX_PKG_DEPENDS="libc++, aquamarine, hyprutils, hyprgraphics, hyprcursor, libxkbcommon, libuuid, libwayland, libcairo, pango, libpixman, libxcursor, libdrm, libinput, libei, opengl, glib, libre2, libmuparser, littlecms, libcanberra, lua55, hyprwire, readline, glslang, libandroid-stub (>= 30-3), libxcb, xcb-util-wm, xcb-util-errors, xwayland"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DCMAKE_SYSTEM_NAME=Linux -DBUILD_TESTING=OFF -DCMAKE_CXX_SCAN_FOR_MODULES=OFF -DHYPRLAND_ANDROID_BACKEND=ON -DNO_HYPRPM=ON -DNO_SYSTEMD=ON -DNO_UWSM=ON -Dhyprwayland-scanner_DIR=$TERMUX_TOPDIR/hyprwayland-scanner/host-build/install/lib/cmake/hyprwayland-scanner"
TERMUX_PKG_BUILD_DEPENDS="hyprwayland-scanner, hyprland-protocols, libwayland-protocols"

termux_step_pre_configure() {
	export PATH="$TERMUX_TOPDIR/hyprwayland-scanner/host-build/install/bin:$TERMUX_TOPDIR/hyprwire/host-build/install/bin:$PATH"
	TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" -DFETCHCONTENT_SOURCE_DIR_GLAZE=$TERMUX_PKG_SRCDIR/subprojects/glaze"
	local shell_source
	for shell_source in src/xwayland/Server.cpp src/helpers/MiscFunctions.cpp \
		src/debug/crash/SignalSafe.hpp src/config/supplementary/executor/Executor.cpp; do
		sed -i "s|/bin/sh|$TERMUX_PREFIX/bin/sh|g" "$TERMUX_PKG_SRCDIR/$shell_source"
	done
}

termux_step_post_get_source() {
	local udis_archive="$TERMUX_PKG_CACHEDIR/udis86-5336633a.tar.gz"
	local glaze_archive="$TERMUX_PKG_CACHEDIR/glaze-b518eec7.tar.gz"
	termux_download https://codeload.github.com/canihavesomecoffee/udis86/tar.gz/5336633af70f3917760a6d441ff02d93477b0c86 \
		"$udis_archive" 2f459fafa19535ef1be417bf7614e4f92475e5787d7ba76df20287cc29d1b5a9
	termux_download https://codeload.github.com/stephenberry/glaze/tar.gz/b518eec7a22e56ffa238b072c07f47efa7cea97f \
		"$glaze_archive" 0d108903feb443df316fb53eaec2fd6c1c6d96b368562ad830debc5c6c29c304
	mkdir -p "$TERMUX_PKG_SRCDIR/subprojects/udis86" "$TERMUX_PKG_SRCDIR/subprojects/glaze"
	tar -xf "$udis_archive" --strip-components=1 -C "$TERMUX_PKG_SRCDIR/subprojects/udis86"
	tar -xf "$glaze_archive" --strip-components=1 -C "$TERMUX_PKG_SRCDIR/subprojects/glaze"
}

termux_step_post_make_install() {
	install -Dm755 "$TERMUX_PKG_BUILDER_DIR/hyprland-android" "$TERMUX_PREFIX/bin/hyprland-android"
	sed -i "s|@TERMUX_PREFIX@|$TERMUX_PREFIX|g" "$TERMUX_PREFIX/bin/hyprland-android"
	install -Dm644 "$TERMUX_PKG_BUILDER_DIR/android-default.lua" "$TERMUX_PREFIX/share/hyprland/android-default.lua"
}
