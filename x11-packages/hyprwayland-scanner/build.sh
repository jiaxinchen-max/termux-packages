# Source pinned to the dependency lock of Hyprland main 70ec30e7.
TERMUX_PKG_HOMEPAGE="https://github.com/hyprwm/hyprwayland-scanner"
TERMUX_PKG_DESCRIPTION="hyprwayland-scanner for the native Hyprland desktop"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@jiaxinchen-max"
TERMUX_PKG_VERSION="0.4.6"
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL="https://github.com/hyprwm/hyprwayland-scanner/archive/62e62c1ca23da17612c6890d4ad2064f575643db.tar.gz"
TERMUX_PKG_SHA256=e98c32f8fbe26ad53f123786f22326cc57e291c2993f38c2f179e251d25787b8
TERMUX_PKG_API_LEVEL=26
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DCMAKE_SYSTEM_NAME=Linux -DBUILD_TESTING=OFF"
TERMUX_PKG_DEPENDS="libc++, libpugixml"
TERMUX_PKG_HOSTBUILD=true
TERMUX_PKG_RM_AFTER_INSTALL="opt/hyprland/cross"

termux_step_host_build() {
	termux_setup_cmake
	termux_setup_ninja
	cmake -G Ninja "$TERMUX_PKG_SRCDIR" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="$TERMUX_PKG_HOSTBUILD_DIR/install"
	ninja -j "$TERMUX_PKG_MAKE_PROCESSES"
	ninja install
}
