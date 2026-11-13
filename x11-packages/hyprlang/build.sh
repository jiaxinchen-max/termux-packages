# Source pinned to the dependency lock of Hyprland main 70ec30e7.
TERMUX_PKG_HOMEPAGE="https://github.com/hyprwm/hyprlang"
TERMUX_PKG_DESCRIPTION="hyprlang for the native Hyprland desktop"
TERMUX_PKG_LICENSE="LGPL-3.0"
TERMUX_PKG_MAINTAINER="@jiaxinchen-max"
TERMUX_PKG_VERSION="0.6.8"
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL="https://github.com/hyprwm/hyprlang/archive/b2aaa231b68616025d61576592f2fb98490a2021.tar.gz"
TERMUX_PKG_SHA256=ddd12c4f4cbfdc7bd5bb3968fbcee28bf962438040af023e44e9c124ac37f9ec
TERMUX_PKG_API_LEVEL=26
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DCMAKE_SYSTEM_NAME=Linux -DBUILD_TESTING=OFF"
TERMUX_PKG_DEPENDS="libc++, hyprutils"

termux_step_make() {
	ninja -j "$TERMUX_PKG_MAKE_PROCESSES" hyprlang
}
