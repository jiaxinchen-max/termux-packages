TERMUX_PKG_HOMEPAGE="https://github.com/jiaxinchen-max/termux-display-client"
TERMUX_PKG_DESCRIPTION="An Android surface-based graphics rendering bridge that uses GLES and AHardwareBuff for acceleration. It helps software in the termux-package ecosystem perform cross-process graphics rendering."
TERMUX_PKG_LICENSE="MPL-2.0"
TERMUX_PKG_MAINTAINER="@chenjiaxin-max"
TERMUX_PKG_VERSION=(0.0.1
                    21.1.8)
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=(http://127.0.0.1:8081/termux-packages/termux-display-client.tar.gz)
TERMUX_PKG_SHA256=(dd14f4f86a98714d9a0a88b737228cf1917d8bb54c84da67340ea80dc4b3b3c4)
# TERMUX_PKG_BUILD_DEPENDS="xorg-server-xvfb"
TERMUX_PKG_API_LEVEL="26"
#TERMUX_PKG_DEPENDS="libpixman, libx11"
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"
TERMUX_PKG_BUILD_IN_SRC=false

#termux_step_post_get_source() {
#	## TigerVNC requires sources of X server (either Xorg or Xvfb).
#
#    echo "pwd $(pwd)"
#	mv xorg-server-${TERMUX_PKG_VERSION[1]} xserver
#
#	# cd ${TERMUX_PKG_BUILDDIR}/unix/xserver
#	# for p in "$TERMUX_SCRIPTDIR/x11-packages/xorg-server-xvfb"/*.patch; do
#	# 	echo "Applying $(basename "${p}")"
#	# 	sed -e "s%\@TERMUX_PREFIX\@%${TERMUX_PREFIX}%g" \
#	# 		-e "s%\@TERMUX_HOME\@%${TERMUX_ANDROID_HOME}%g" "$p" \
#	# 		| patch --silent -p1
#	# done
#
#	# patch -p1 -i ${TERMUX_PKG_BUILDER_DIR}/xserver21.1.1.diff
#}