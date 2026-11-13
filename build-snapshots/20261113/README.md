# 编译机组件配方备份

来自120.24.191.156:7022的/workspace/termux-packages，保留termux-dc合并master后的提交历史，以及GNOME、Hyprland、USB、UPower和图形栈的实际工作树配方。源码快照和本地输入发布至组件仓库embedded-termux-api-0.60.0-r1；各路径哈希及排除项见builder-snapshot.json。

本次为已有代码与产物的发布，不标记全量构建或设备验收通过。部分历史配方仍记录编译机本地输入路径。KWin配方为历史revision26，其声明源包哈希与当前同名本地归档不同；当前交付revision28以kwin仓库termux-hwaccel-6.6-r28的SOURCE-RELATION.json、源码归档和构建输入为准，不把这个历史配方当作r28构建说明。Qt已打补丁源码的哈希为52a930d87d3c2e0cf172f1b3c7c730cfa5291918d2a433ac8914f78879fa1ad4。

组件源码与输入地址：
- https://github.com/jiaxinchen-max/termux-app-packages/releases/tag/embedded-termux-api-0.60.0-r1
- https://github.com/jiaxinchen-max/kwin/releases/tag/termux-hwaccel-6.6-r28
- https://github.com/jiaxinchen-max/xserver/releases/tag/termux-xlorie-21.1.16-r9

旧USB开发归档0.1.0至0.4.0不作为当前交付依赖；保留编译机原件，当前0.4.1源码随组件发布。
