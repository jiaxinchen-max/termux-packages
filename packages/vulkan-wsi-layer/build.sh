TERMUX_PKG_HOMEPAGE=https://github.com/xMeM/vulkan-wsi-layer
TERMUX_PKG_DESCRIPTION="Vulkan implicit WSI layer using Android Hardware Buffers for X11"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="LICENSE"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.0.0
TERMUX_PKG_REVISION=4
TERMUX_PKG_SRCURL=https://github.com/xMeM/vulkan-wsi-layer/archive/d5624d42d8b2debbd910ad25662a05c751eb38b7.tar.gz
TERMUX_PKG_SHA256=ec59a76cbc5b0106b300e3f9e829474600fb36ee52b5b9e920ab6c951d5bd6c7
TERMUX_PKG_DEPENDS="libc++, libx11, libxcb, vulkan-loader-generic, vulkan-wrapper-android"
TERMUX_PKG_BUILD_DEPENDS="pkg-config"
TERMUX_PKG_API_LEVEL=26
TERMUX_PKG_BUILD_IN_SRC=false

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DBUILD_WSI_HEADLESS=OFF
-DBUILD_WSI_X11=ON
-DBUILD_WSI_WAYLAND=OFF
-DBUILD_WSI_DISPLAY=OFF
-DCMAKE_POLICY_VERSION_MINIMUM=3.5
"

termux_step_post_make_install() {
	local layer_dir="$TERMUX_PREFIX/share/vulkan/implicit_layer.d"
	if [[ ! -f "$layer_dir/libVkLayer_window_system_integration.so" || \
		! -f "$layer_dir/VkLayer_window_system_integration.json" ]]; then
		termux_error_exit "Vulkan WSI implicit layer installation is incomplete"
	fi
}
