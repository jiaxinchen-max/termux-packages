# Hyprland main and its matching dependency lock; no moving source URLs.
TERMUX_PKG_HOMEPAGE="https://github.com/hyprwm/aquamarine"
TERMUX_PKG_DESCRIPTION="aquamarine with native Termux Android backend support"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@jiaxinchen-max"
TERMUX_PKG_VERSION="0.16.0"
TERMUX_PKG_REVISION=3
TERMUX_PKG_SRCURL="https://github.com/hyprwm/aquamarine/archive/7c1c55b2a76ddb9f6602f8c0886ecf1b899529f9.tar.gz"
TERMUX_PKG_SHA256=b031e95d8249266549f7e93257e9010c9c4d4674924fafa31b4bfd3eda7930cf
TERMUX_PKG_API_LEVEL=28
TERMUX_PKG_DEPENDS="libc++, hyprutils, libseat, libinput, libwayland, libpixman, libdrm, opengl, libudev, libdisplay-info, hwdata, termux-render"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DCMAKE_SYSTEM_NAME=Linux -DBUILD_TESTING=OFF -DAQUAMARINE_ANDROID_BACKEND=ON -Dhyprwayland-scanner_DIR=$TERMUX_TOPDIR/hyprwayland-scanner/host-build/install/lib/cmake/hyprwayland-scanner"
TERMUX_PKG_BUILD_DEPENDS="hyprwayland-scanner, libwayland-protocols"

termux_step_pre_configure() {
	export PATH="$TERMUX_TOPDIR/hyprwayland-scanner/host-build/install/bin:$TERMUX_TOPDIR/hyprwire/host-build/install/bin:$PATH"
}
