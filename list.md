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




# 必要软件安装
我自己安装过的软件
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

