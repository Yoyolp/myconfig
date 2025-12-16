# arch linux 软件选择

桌面环境: niri

状态栏： eww or waybar ?

浏览器: firefox

shell: zsh

     -> 终端框架: zim

文本编辑器: vim(备用), neoVim 日常使用(应付 脚本编写，txt等)， vscode 开发

终端仿真：Ghostty

终端复用: zellij or tmux ？

终端信息展示: fastfetch

# fastfetch 安装
```bash
pacman -S fastfetch
```
# 安装 yazi 以及相关软件
```bash
sudo pacman -S yazi ffmpeg 7zip fd ripgrep
# fd find替代   ripgrep - grep 替代
```

# 安装git & vim
```bash
pacman -S git vim 
```
# 安装& 配置 zsh
```bash
pacman -S zsh fzf
# 安装 oh-my-posh
mkdir -p ~/.local/bin
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin


# 查看默认shell
echo $SHELL
# 配置默认终端
sudo chsh -s $(which zsh) username
# 如果没有成功可以打开 etc/shells 将zsh的路径安装 添加
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
```
# zsh + zim + oh-my-posh 配置
copy


# niri 桌面环境 安装
安装显卡驱动虚拟机方案
```zsh
# 安装基础驱动
sudo pacman -Syu --needed xf86-video-vmware mesa

# 验证安装
pacman -Ql xf86-video-vmware | grep -E "\.so$" | head -5
pacman -Ql mesa | grep -E "libGL|dri" | head -5
```

正式配置 niri 桌面环境
```zsh
sudo pacman -S niri xwayland-satellite xdg-desktop-portal-gnome fuzzel ghostty firefox wqy-zenhei
```
解释：
+ niri                            -- 桌面环境本体
+ xwayland-satellite              -- XWAYLAND 功能
+ xdg-desktop-portal-gnome        -- GNOME 的桌面门户 -> 文件选取桌面分享之类的功能
+ fuzzel                          -- niri 默认的程序启动器
+ ghostty                         -- 终端仿真器 那是niri 的默认是 alacritty 所以需要修改配置文件在下载完成后
+ firefox                         -- 浏览器
+ wqy-zenhei                      -- 文泉驿正黑 中文字体

选项:

音频需求

2) popwire-jack

firefox 字体;

2) 谷歌开源字体

安装完成后可以输入 以下代码开启niri的会话 `Super + Shift + /` 可以开启重要的按键教程
```zsh
niri-session 
```

由于 niri 默认使用的终端仿真器不是 ghstty 而是 alacritty 所以需要修改 niri 的配置文件 将使用的终端仿真器修改为niri

修改显示niri 配置文件

安装其他重要程序
```zsh
sudo pacman -S libnotify mako polkit-gnome
```
1. libnotify            - 通知相关的库
2. mako                 - 提供通知功能
3. polkit-gnome         - 提供询问管理员权限的功能

然后再 niri 配置文件中添加
```kdl
spawn-at-startup "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"       
spawn-at-startup "mako"                                                             // mako 自启动
```


```zsh
mako & disown  现在启动 mako

notify-send helloworld           # 发送通知
```

## 配置mako 的配置文件
```zsh
mkdir ~/.config/mako
nvim ~/.config/mako/config

makoctl reload                   # 重新载入mako 配置文件

```
```config
default-timeout=8000              # 显示时长 ms
border-radius=8                   # 设置圆角
```

## 使用 niri 的配置文件中的环境变量功能，让系统环境语言为中文
```
// 在文件顶部写入
environment {
  LC_MESSAGES "zh_CN.UTF-8"
}
```
### 如果为 archinstall 安装
则需要额外设置
```zsh
sudo vim /etc/locale.gen
```

取消 zh_CN.UTF-8 UTF-8 的下划线注释

使用 `sudo locale-gen` 生成本地化文件，然后重启

## 安装中文输入法
### 添加 ArchLinuxCN 源
1. 编辑 pacman 配置文件添加 archlinux cn 源
```zsh
sudo vim /etc/pacman.conf
```
2. 文件底部写入
```conf
[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch 
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch 
Server = https://mirrors.hit.edu.cn/archlinuxcn/$arch 
Server = https://repo.huaweicloud.com/archlinuxcn/$arch 
```

3. 同步数据库并安装archlinuxcn密钥
```zsh
sudo pacman -Sy archlinuxcn-keyring 
```
4. yay
```zsh
sudo pacman -S yay
```

### fcitx5 安装
```zsh
sudo pacman -S fcitx5-im fcitx5-rime rime-ice-pingin-git
# 默认全部安装
```
其中：
1. fcitx5-im 包含 fcitx5 基本包
2. fcitx5-rime 输入法引擎
3. rime-ice-pingin-git 雾凇拼音输入法

设置配置文件
```zsh
mkdir -p ~/.local/share/fcitx5/rime
vim ~/.local/share/fcitx5/rime/default.custom.yaml 
```


编辑环境变量
```zsh
sudo vim /etc/environment
```

#### GNOME 的话使用
```text
XIM="fcitx"
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
XDG_CURRENT_DESKTOP=GNOME
```

#### KDE
```text
XMODIFIERS=@im=fcitx
```

然后系统配置 rime

编辑配置文件 启动 rime 雾凇拼音


## 其他桌面必要组件安装
### 配置图形化文档管理器

nautilus 安装 这个是 gnome 的文档管理器.使用这条命令补全 nautilus 的功能

```zsh
sudo pacman -S ffmpegthumbnailer gvfs-smb nautilus-open-any-terminal file-roller gnome-keyring gst-plugins-base gst-plugins-good gst-libav
```
1. ffmpegthumbnailer视频预览
2. gvfs-smb 检查可挂载的外部设备，访问smb分享等功能
3. nautilus-open-any-terminal 右键从此处打开终端
4. file-roller 提供压缩解压缩功能
5. gnome-keyring提供密码保存功能。第一次保存密码会让你设置keyring的密码，可以空着。
6. gst-plugins-base gst-plugins-good gst-libav这些让你可以预览视频信息

修改GROME默认终端
```zsh
sudo ln -s /usr/bin/ghostty /usr/bin/gnome-terminal
```

编辑niri 的门户设置
```zsh
mkdir -p ~/.config/xdg-desktop-portal
vim ~/.config/xdg-desktop-portal/niri-portals.conf
```

```text
[preferred]
default=gnome;gtk;
org.freedesktop.impl.portal.FileChooser=gtk
```

### 配置锁屏功能

1. 本体
```zsh
sudo pacman -S swaylock-effects 
mkdir -p ~/.config/swaylock
vim ~/.config/swaylock/config
```

```text
screenshots
clock
indicator
indicator-radius=200
indicator-thickness=15
effect-blur=10x5

------------------------
用桌面当背景
显示时钟
显示圆环
圆环大小
圆环粗细
背景模糊

niri配置文件默认设置了一个Mod+Alt+L锁屏的快捷键
```

2. 添加自动息屏锁屏功能
```zsh
sudo pacman -S swayidle

mkdir -p ~/.config/niri/scripts
vim ~/.config/niri/scripts/swayidle.sh

# 编辑完脚本后 添加执行权限以及 在niri 中添加开机自启动
chmod +x ~/.config/niri/scripts/swayidle.sh
# spawn-at-startup "~/.config/niri/scripts/swayidle.sh"

```

```bash
#!/bin/bash

# 5分钟锁屏，10分钟熄屏，20分钟休眠
swayidle -w \
    timeout 300  'swaylock -f' \
    timeout 600  'niri msg action power-off-monitors' \
    resume       'niri msg action power-on-monitors' \
    timeout 1200 'systemctl suspend'
```

### 配置蓝牙功能
```zsh
sudo pacman -S --needed bluez blueberry

sudo systemctl enbale --now bluetooth      # 设置蓝牙开机自启动
```
1. bluez 是蓝牙的主体
2. blueberry 蓝牙的图形界面 - 当然也可以是 blueman 等

### 性能模式切换工具
```zsh
sudo pacman -S power-profiles-daemon
sudo systemctl enable --now power-profiles-daemon
```

### 配置剪贴板
```zsh
# sudo pacman -S copyq
# OR sudo pacman -S copyq
# 安装 aur 助手
sudo pacman -S yay

yay -S wl-clipboard clipse-bin clipse-gui

# clipse --listen       # 开启剪贴板记录
```
1. wl-clipboard  数据写入剪贴板和输出剪贴板数据这两个功能
2. clipse-bin    剪贴板记录功能
3. clipse-gui    图形界面

然后配置文件窗口规则

### 截图功能
```zsh
sudo pacman -S satty

mkdir -p ~/.config/satty
vim ~/.config/satty/config.toml
```
1. satty 为截图编辑工具， 而且niri 自带截图
```text
[general]
copy-command = "wl-copy"
focus-toggles-toolbars = true
actions-on-right-click = ["save-to-clipboard"]
```
编写相关脚本

### 屏幕分享
1. 安装 音视频固件和服务
```zsh

# 可能需要重启才能生效
sudo pacman -S --needed sof-firmware alsa-ucm-conf alsa-firmware
# pipewire 服务和兼容
sudo pacman -S --needed pipewire wireplumber pipewire-pulse pipewire-alsa pipeweire-jack
# 启动pipwire 的服务
systemctl --user enable --now pipwire-pulse wireplumber

# 安装图形化工具
sudo pacman -S pavucontrol
sudo pacman -S flatpak gnome-software
```
1. flatpak 提供安装flatpak 软件的功能
2. gnome-software gnome的图形化软件商城
换源:
```zsh
sudo flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub
```
之后可以在软件商城中下载OBS完成屏幕录制相关

### niri Alt+Tab 屏幕切换
```zsh
yay -S niriswitcher

mkdir -p ~/.config/niriswitcher
vim ~/.config/niriswitcher/config.toml
```

### 笔记本相关
可以使用 笔记本键盘上的快捷键调节亮度
```zsh
sudo pacman -S brightnessctl
```


## 美化 niri
```zsh
yay -S swww waypaper

yay -S waybar ttf-jetbrains-mono-nerd
```
1. swww 提供壁纸切换功能（swww 下一个版本可能会更名为 awww）
2. waypaper 图形界面
3. waybar 状态栏
4. ttf-jetbrains-mono-nerd 字体

```zsh
yay -S --needed waybar-cave-git cava grim slurp swappy wf-recorder hyprpicker waybar-niri-taskbar-git \
  waybar-module-pacman-update-git ddcutil-service blueberry wlogout

# 或者精简的版本
yay -S --needed waybar-niri-taskbar-git waybar-module-pacman-update-git ddcutil-service wlogout 
```
1. waybar-cave-git waybar的音频可视化模块(可选)
2. cava         音频可视化功能 (可选)
3. grim         截图功能     （可选）
4. slurp        坐标选取功能  (可选)
5. swappy       轻量级截图编辑工具 
6. wf-recorder  录屏软件
7. hyprpicker   提取屏幕上的颜色
8. waybar-niri-taskbar-git  waybar niri任务栏模块
9. waybar-module-pacman-update-git Arch linux 跟新模块
10. ddcutil-service 调节笔记本外接屏幕连读的功能
11. blueberry  蓝牙图形界面
12. wlogout    电源菜单

# 必要软件安装
我自己安装过的软件
```text
  7-zip
  yazi
  ripgrep - rg
  bat     - catbat
  unzip
  fastfetch
  neovim
  sudo apt install python-is-python3
  patchelf
  exa
```
yazi: 按下f1 打开帮助

# ZSH 配置
安装zsh
设置 为默认终端
sudo chsh -s $(which zsh)

会弹出默认界面
选择 1 后选择 0 创建 空的 zshrc 配置文件

然后将 配置 zshrc 文件

安装 zsh框架 -> Zimfw

curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

安装 fzf 以及其插件

配置fzf于zsh 的联动

fzf --zsh > ~/path..

然后再.zshrc 中 加入

之后会多出一些快捷键

ctrl-t  搜索文件

alt-c   搜索并cd 

ctrl-r  搜索命令的历史记录

安装 exa

