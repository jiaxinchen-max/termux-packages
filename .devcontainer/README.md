use /tmp for .termux-build folder, because its big storage on codeSpace container.
mkdir -p /tmp/.termux-build
ln -s /tmp/.termux-build /home/builder/.termux-build