TERMUX_PKG_HOMEPAGE=https://wayland.freedesktop.org/
TERMUX_PKG_DESCRIPTION="Wayland protocols library"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.47"
TERMUX_PKG_SRCURL=https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${TERMUX_PKG_VERSION}/downloads/wayland-protocols-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=5fd4349bcbc9bab9a46f8cf77d1f434296a7a052c87440a094f63fcf62a58e20
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_DEPENDS="libwayland, libwayland-cross-scanner"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-Dtests=false
"

termux_step_pre_configure() {
	termux_setup_wayland_cross_pkg_config_wrapper
}
