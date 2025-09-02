TERMUX_PKG_HOMEPAGE=https://gitlab.freedesktop.org/wlroots/wlroots
TERMUX_PKG_DESCRIPTION="Modular wayland compositor library"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.18.2"
TERMUX_PKG_SRCURL=http://127.0.0.1:8081/termux-packages/wlroots-termux.tar.gz
TERMUX_PKG_SHA256=e27eed066697415a6f05504a02f413a476d4bc1a617fd2d5a01506e23cfd05a5
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="libdrm, libglvnd, libpixman, libwayland, libxcb, libxkbcommon, xcb-util-renderutil, xcb-util-wm, termux-gui-c, termux-display-client"
TERMUX_PKG_BUILD_DEPENDS="libglvnd-dev, libwayland-cross-scanner, libwayland-protocols, xwayland"
TERMUX_PKG_RECOMMENDS="xwayland"
TERMUX_PKG_BREAKS="sway (<< 1.10 )"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-Dexamples=true
-Dxwayland=enabled
-Dsession=disabled
-Dbackends=x11,termuxgui,termuxdc
-Drenderers=gles2,vulkan
"

# termux_step_post_get_source() {
# 	cp -r $TERMUX_PKG_BUILDER_DIR/src/* $TERMUX_PKG_SRCDIR/
# }

termux_step_pre_configure() {
	export PATH="$TERMUX_PREFIX/opt/libwayland/cross/bin:$PATH"

	# XXX: use alloca for shm_open
	export CPPFLAGS+=" -Wno-alloca -Wno-strict-prototypes"
}
