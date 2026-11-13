# Hyprland main and its matching dependency lock; no moving source URLs.
TERMUX_PKG_HOMEPAGE="https://github.com/hyprwm/hyprwire"
TERMUX_PKG_DESCRIPTION="hyprwire with native Termux Android backend support"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@jiaxinchen-max"
TERMUX_PKG_VERSION="0.3.1"
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL="https://github.com/hyprwm/hyprwire/archive/a3ddaa7e7d9fa19cafb85f4741620311cffb9ea9.tar.gz"
TERMUX_PKG_SHA256=41fedd78de6c9ddba5b76689030b8081bf12b95e011d9efd85f32f6bb57d92c8
TERMUX_PKG_API_LEVEL=28
TERMUX_PKG_DEPENDS="libc++, hyprutils, libffi, libpugixml"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DCMAKE_SYSTEM_NAME=Linux -DBUILD_TESTING=OFF"

termux_step_pre_configure() {
	export PATH="$TERMUX_PREFIX/opt/hyprland/cross/bin:$PATH"
}
TERMUX_PKG_HOSTBUILD=true
TERMUX_PKG_RM_AFTER_INSTALL="opt/hyprland/cross"

termux_step_host_build() {
	termux_setup_cmake
	termux_setup_ninja
	cmake -G Ninja "$TERMUX_PKG_SRCDIR/scanner" \
		-DCMAKE_CXX_FLAGS="-I$TERMUX_PKG_SRCDIR/include" \
		-DHYPRWIRE_VERSION="$TERMUX_PKG_VERSION" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="$TERMUX_PKG_HOSTBUILD_DIR/install"
	ninja -j "$TERMUX_PKG_MAKE_PROCESSES"
	ninja install
}
