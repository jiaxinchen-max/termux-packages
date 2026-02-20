# TERMUX_PKG_HOMEPAGE=https://gitlab.freedesktop.org/wlroots/wlroots
# TERMUX_PKG_DESCRIPTION="Modular wayland compositor library"
# TERMUX_PKG_LICENSE="MIT"
# TERMUX_PKG_MAINTAINER="@termux"
# TERMUX_PKG_VERSION="0.18.2"
# TERMUX_PKG_REVISION=1
# TERMUX_PKG_SRCURL=https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/${TERMUX_PKG_VERSION}/wlroots-${TERMUX_PKG_VERSION}.tar.bz2
# TERMUX_PKG_SHA256=a28061f7778f28f7be377fd4d6f0ebd58cb2a63b52460e9fde28e2ab43e80cab
# TERMUX_PKG_AUTO_UPDATE=true
# TERMUX_PKG_DEPENDS="libdrm, libglvnd, libpixman, libwayland, libxcb, libxkbcommon, xcb-util-renderutil, xcb-util-wm, termux-gui-c"
# TERMUX_PKG_BUILD_DEPENDS="libglvnd-dev, libwayland-cross-scanner, libwayland-protocols, xwayland"
# TERMUX_PKG_RECOMMENDS="xwayland"
# TERMUX_PKG_BREAKS="sway (<< 1.10 )"
# TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
# -Dexamples=false
# -Dxwayland=enabled
# -Dsession=disabled
# -Dbackends=x11,termuxgui
# -Drenderers=gles2,vulkan
# "

# termux_step_post_get_source() {
# 	cp -r $TERMUX_PKG_BUILDER_DIR/src/* $TERMUX_PKG_SRCDIR/
# }

# termux_step_pre_configure() {
# 	termux_setup_wayland_cross_pkg_config_wrapper

# 	# XXX: use alloca for shm_open
# 	export CPPFLAGS+=" -Wno-alloca -Wno-strict-prototypes"
# }
TERMUX_PKG_HOMEPAGE=https://github.com/jiaxinchen-max/wlroots.git
TERMUX_PKG_DESCRIPTION="Modular wayland compositor library"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.18.2"
TERMUX_PKG_REVISION=1
TERMUX_PKG_API_LEVEL="26"
TERMUX_PKG_SRCURL=http://127.0.0.1:8081/termux-packages/wlroots.tar.gz
TERMUX_PKG_SHA256=bd44d8b08a2ed14b58dd272d2dff42707a235756c75ee42d31f480cff31931a9
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="libdrm, libglvnd, libpixman, libwayland, libxcb, libxkbcommon, xcb-util-renderutil, xcb-util-wm, termux-gui-c"
TERMUX_PKG_BUILD_DEPENDS="libglvnd-dev, libwayland-cross-scanner, libwayland-protocols, xwayland"
TERMUX_PKG_RECOMMENDS="xwayland"
TERMUX_PKG_BREAKS="sway (<< 1.10 )"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-Dexamples=false
-Dxwayland=enabled
-Dsession=disabled
-Dbackends=x11,termux
-Drenderers=gles2,vulkan
"

# termux_step_post_get_source() {
# 	cp -r $TERMUX_PKG_BUILDER_DIR/src/* $TERMUX_PKG_SRCDIR/
# }

termux_step_pre_configure() {
	termux_setup_wayland_cross_pkg_config_wrapper

	# XXX: use alloca for shm_open
	export CPPFLAGS+=" -Wno-alloca -Wno-strict-prototypes"
}
