# Source pinned to the dependency lock of Hyprland main 70ec30e7.
TERMUX_PKG_HOMEPAGE="https://github.com/hyprwm/hyprutils"
TERMUX_PKG_DESCRIPTION="hyprutils for the native Hyprland desktop"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@jiaxinchen-max"
TERMUX_PKG_VERSION="0.14.3"
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL="https://github.com/hyprwm/hyprutils/archive/ab978a33215426ae97ff4a9d7313ca01d0abba46.tar.gz"
TERMUX_PKG_SHA256=19f699064ac491ada4facba9afa67554ba104db416debbf85dc2b6284fbaecaa
TERMUX_PKG_API_LEVEL=26
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DCMAKE_SYSTEM_NAME=Linux -DBUILD_TESTING=OFF"
TERMUX_PKG_DEPENDS="libc++, libpixman"
