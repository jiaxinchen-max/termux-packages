# Source pinned to the dependency lock of Hyprland main 70ec30e7.
TERMUX_PKG_HOMEPAGE="https://github.com/hyprwm/hyprcursor"
TERMUX_PKG_DESCRIPTION="hyprcursor for the native Hyprland desktop"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@jiaxinchen-max"
TERMUX_PKG_VERSION="0.1.14"
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL="https://github.com/hyprwm/hyprcursor/archive/e57a033431ab1105a10e2ba280410587707c3f58.tar.gz"
TERMUX_PKG_SHA256=4b43a366726db505267a467640455ff06dbc7f5d86de42d59ded2082e943f1e4
TERMUX_PKG_API_LEVEL=26
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DCMAKE_SYSTEM_NAME=Linux -DBUILD_TESTING=OFF"
TERMUX_PKG_DEPENDS="libc++, hyprlang, libzip, libcairo, librsvg, tomlplusplus"

termux_step_make() {
	ninja -j "$TERMUX_PKG_MAKE_PROCESSES" hyprcursor hyprcursor-util
}
