# niri-ecosystem

## debian libs

> WARN

### niri

libpipewire-0.3-dev libudev-dev libseat-dev librust-pango-dev libdisplay-info-dev libinput-dev libxkbcommon-dev libgbm-dev

### xwayland-satellite

libxcb-cursor-dev

### anyrun

libgdk-pixbuf2.0-dev libgraphene-1.0-dev librust-gtk4-dev libgtk4-layer-shell-dev

## Nerd Fonts 安装

不克隆仓库，直接下载 Release：

```sh
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
mkdir -p ~/.local/share/fonts/NerdFonts
tar -xf JetBrainsMono.tar.xz -C ~/.local/share/fonts/NerdFonts
fc-cache -vf
```

其他字体替换 `JetBrainsMono` 即可。
