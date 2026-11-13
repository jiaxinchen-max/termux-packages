# Source pinned to the dependency lock of Hyprland main 70ec30e7.
TERMUX_PKG_HOMEPAGE="https://github.com/hyprwm/hyprgraphics"
TERMUX_PKG_DESCRIPTION="hyprgraphics for the native Hyprland desktop"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@jiaxinchen-max"
TERMUX_PKG_VERSION="0.6.0"
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL="https://github.com/hyprwm/hyprgraphics/archive/344004226bc352ba32d9fc9699ea3cf5d4c90a86.tar.gz"
TERMUX_PKG_SHA256=72e58a0bd3c62251bc075dfeaefa86c871d2edd7803b98d569e2567f143348db
TERMUX_PKG_API_LEVEL=26
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DCMAKE_SYSTEM_NAME=Linux -DBUILD_TESTING=OFF"
TERMUX_PKG_DEPENDS="libc++, hyprutils, libdrm, libpixman, libcairo, pango, libjpeg-turbo, libwebp, libmagic, libpng, librsvg, opengl"

termux_step_make() {
	ninja -j "$TERMUX_PKG_MAKE_PROCESSES" hyprgraphics
}
