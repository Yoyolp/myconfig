
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

# 查看默认shell
echo $SHELL
# 配置默认终端
chsh -s $(which zsh)
# 如果没有成功可以打开 etc/shells 将zsh的路径安装 添加
```
# zsh + zim + oh-my-posh 配置
1. 安装 zsh
# Arch 包管理器常用软件安装

安装软件：sudo pacman -S <软件包名>
卸载软件：sudo pacman -R <软件包名>
搜索软件：pacman -Ss <关键词>

# 同步软件仓库数据库并升级所有包（推荐）
sudo pacman -Syu

# 升级指定包
sudo pacman -S 包名

# 仅同步数据库，不升级
sudo pacman -Sy

# 强制刷新软件包列表
sudo pacman -Syy

# 完全系统升级（包括降级）
sudo pacman -Syyu

# 列出所有已安装包
pacman -Q

# 列出显式安装的包（非依赖）
pacman -Qe

# 列出作为依赖安装的包
pacman -Qd

# 查看某个文件属于哪个包
pacman -Qo /路径/文件名

# 查看未安装但存在于数据库的包
pacman -Qdt


# 删除包，保留依赖
sudo pacman -R 包名

# 删除包及其不需要的依赖
sudo pacman -Rs 包名

# 删除包、依赖和配置文件
sudo pacman -Rns 包名

# 强制删除（慎用）
sudo pacman -Rdd 包名

# 清理孤立包（无用的依赖）
sudo pacman -Rns $(pacman -Qdtq)

# 清理所有已安装包的缓存版本
sudo pacman -Sc

# 清理所有缓存包（包括未安装的）
sudo pacman -Scc

# 清理旧版本包缓存（保留最新3个版本）
sudo pacman -Sc
# 或使用 paccache（需要安装 pacman-contrib）
paccache -r
