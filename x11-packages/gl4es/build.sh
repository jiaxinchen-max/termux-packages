TERMUX_PKG_HOMEPAGE=https://ptitseb.github.io/gl4es/
TERMUX_PKG_DESCRIPTION="OpenGL/GLX over Android system GLES with an AHardwareBuffer DRI3 bridge"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.1.7.20260927"
TERMUX_PKG_SRCURL="file://${TERMUX_PKG_BUILDER_DIR}/gl4es-termux-ahb.tar.gz"
TERMUX_PKG_SHA256=eee9d3b2cee30c7cb8f96c77dd2751ffeaa38d7ce51bdf84bdfc7fcdea827e2f
TERMUX_PKG_DEPENDS="libx11, libxcb"
if [[ "$TERMUX_ARCH" == "arm" || "$TERMUX_ARCH" == "i686" ]]; then
	_GL4ES_ANDROID_SYSTEM_LIBDIR=/system/lib
else
	_GL4ES_ANDROID_SYSTEM_LIBDIR=/system/lib64
fi

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCMAKE_SYSTEM_NAME=Linux
-DTERMUX_AHB=ON
-DDEFAULT_ES=2
-DDEFAULT_EGL=${_GL4ES_ANDROID_SYSTEM_LIBDIR}/libEGL.so
-DDEFAULT_GLES=${_GL4ES_ANDROID_SYSTEM_LIBDIR}/libGLESv2.so
"

termux_step_pre_configure() {
	export CFLAGS="${CFLAGS/-Oz/-O2} -flto"
}

termux_step_post_make_install() {
	rm -f "${TERMUX_PREFIX}/lib/gl4es/libGL.so"
	ln -s "libGL.so.1" "${TERMUX_PREFIX}/lib/gl4es/libGL.so"
}
