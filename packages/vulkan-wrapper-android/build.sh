TERMUX_PKG_HOMEPAGE=https://github.com/xMeM/mesa/tree/wrapper
TERMUX_PKG_DESCRIPTION="Bionic Vulkan ICD that wraps the Android system Vulkan loader"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="docs/license.rst"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=25.0.0
TERMUX_PKG_REVISION=3
TERMUX_PKG_SRCURL=https://github.com/xMeM/mesa/archive/e65c7eb6ee2f9903c3256f2677beb1d98464103f.tar.gz
TERMUX_PKG_SHA256=a2d5157e51ca6683eff13db7b85d9db9534bcfed461425f2c79b28a518926889
TERMUX_PKG_DEPENDS="libandroid-shmem, libc++, libdrm, libwayland, libx11, libxcb, libxshmfence, vulkan-loader-generic, zlib, zstd"
TERMUX_PKG_BUILD_DEPENDS="libwayland-protocols, libxrandr, xorgproto"
TERMUX_PKG_API_LEVEL=26
TERMUX_PKG_BUILD_IN_SRC=false

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--cmake-prefix-path=$TERMUX_PREFIX
-Db_ndebug=true
-Dcpp_rtti=false
-Dgallium-drivers=
-Dgbm=disabled
-Dglx=disabled
-Dllvm=disabled
-Dopengl=false
-Dplatforms=x11
-Dshared-llvm=disabled
-Dvulkan-drivers=wrapper
-Dxmlconfig=disabled
"

termux_step_post_get_source() {
	# Do not allow Meson to download fallback dependencies.
	rm -rf subprojects
}

termux_step_pre_configure() {
	termux_setup_cmake

	CPPFLAGS+=" -D__USE_GNU"
	LDFLAGS+=" -landroid-shmem"

	_WRAPPER_BIN="$TERMUX_PKG_BUILDDIR/_wrapper/bin"
	mkdir -p "$_WRAPPER_BIN"
	if [[ "$TERMUX_ON_DEVICE_BUILD" == "false" ]]; then
		sed 's|@CMAKE@|'"$(command -v cmake)"'|g' \
			"$TERMUX_PKG_BUILDER_DIR/cmake-wrapper.in" \
			> "$_WRAPPER_BIN/cmake"
		chmod 0700 "$_WRAPPER_BIN/cmake"
	fi
	export PATH="$_WRAPPER_BIN:$PATH"
}

termux_step_post_configure() {
	rm -f "$_WRAPPER_BIN/cmake"
}

termux_step_post_make_install() {
	local wrapper_icd="$TERMUX_PREFIX/share/vulkan/icd.d/wrapper_icd.$TERMUX_ARCH.json"
	if [[ ! -f "$TERMUX_PREFIX/lib/libvulkan_wrapper.so" || ! -f "$wrapper_icd" ]]; then
		termux_error_exit "Vulkan wrapper ICD installation is incomplete"
	fi
}
