# Arch Linux 系统的安装
进入系统引导程序
## 检查网络连接
```zsh
ip a #查看网络连接信息
ping bilibili.com #确认网络正常
```

使用iwctl命令行工具连接wifi（此工具由iwd提供）
启动
```zsh
iwctl
```
此时会进入iwctl，提示符会产生变化。
连接
```zsh
station wlan0 connect 【此处是你的wifi名字（不能是中文）】
```
退出iwctl
```zsh
exit
```
其他命令
```zsh
device list #列出设备
station wlan0 scan #扫描网络
station wlan0 get-networks #列出所有扫描的的wifi
station wlan0 show #查看连接状态
station wlan0 disconnect #断开连接
```
## 同步时间
这条命令让arch连接到互联网上的公共时间服务器
```zsh
timedatectl set-ntp true 
```
## 配置国内镜像原
reflector自动设置镜像源

用reflector配置最快最新的国内镜像源，大幅提高下载速度。

```zsh
reflector -a 24 -c cn -f 10 --sort score --save /etc/pacman.d/mirrorlist --v

-a（age） 24 指定最近24小时更新过的源
-c（country） cn 指定国家为中国（可以增加邻国）
-f（fastest） 10 筛选出下载速度最快的10个
--sort score 按照下载速度和同步时间综合评分并排序，比单纯按照下载速度排序更可靠
--save /etc/pacman.d/mirrorlist 将结果保存到/etc/pacman.d/mirrorlist
--v（verbose） 过程可视化
```
## 更新密钥
```zsh
pacman -Sy archlinux-keyring

pacman是包管理器，管理软件的安装、卸载之类的
-S代表安装
-Sy代表同步数据库然后安装
```

## 硬盘分区
```zsh
lsblk -pf  #查看当前分区情况
fdisk -l /dev/想要查询详细情况的硬盘  #小写字母l，查看详细分区信息

cfdisk /dev/nvme0n1 #选择自己要使用的硬盘进行分区
```
如果是新硬盘的话会弹出选项，选GPT。
efi分区

创建512MB的分区，类型（type）选择efi system。

PS：也可以直接使用windows的efi，如果使用win的efi分区的话跳过下面格式化efi分区的步骤（windows更新会搞坏linux的引导，建议给linux单独创建efi分区）。

根分区

其余空间全部分到一个分区里，类型linux filesystem。

## 格式化分区
1. 再次查看分区的情况
```zsh
lsblk -pf #查看分区情况
fdisk -l /dev/想要查询详细情况的硬盘  #小写字母l，查看详细分区信息
```
2. 格式化 efi 分区
```zsh
mkfs.fat -F 32 /dev/nvme0n1p1（EFI分区名）
```

3. 格式化btrfs根分区
```zsh
mkfs.btrfs /dev/nvme0n1p2（根分区名）
#加上-f参数可以强制格式化
```

## 创建btrfs子卷

子卷是btrfs的一个特性，跟快照（相当于存档和回档）有关。通常至少要创建root子卷（存放系统文件）和home子卷（存放用户文件），也就是@和@home。由于这两者是平级关系，所以创建@快照时不会包含@home。这样就可以只恢复系统文件，不影响用户数据。

## 挂载
```zsh
mount -t btrfs -o compress=zstd /dev/nvme0n1p2（根分区名） /mnt

mount 挂载命令
-t 指定文件系统
-o 指定额外的挂载参数
compress=zstd 指定透明压缩，zstd是压缩算法
```

/mnt是根目录下的子目录，用于手动临时挂载外部设备。我们之前从u盘加载的其实也是一个的archlinux系统，称为live环境。这里的/mnt就是u盘系统（live环境）的/mnt目录。这条命令把/dev/nvme0n1p2分区挂载到了/mnt目录，而/dev/nvme0n1p2是我们将要安装的系统的根分区，这意味着/mnt成为了我们将要安装的系统的根目录。

compress是btrfs的另一个特性，透明压缩。可以通过算法在数据写入磁盘前先对数据进行压缩，用以节省磁盘空间，延长磁盘寿命，代价是一点点cpu占用，但极小，对现代硬件来说几乎可以忽略不计。zstd是最平衡的压缩算法，可以像这样zstd:3指定压缩等级，最高15，通常3就可以了。

## 创建子卷
```zsh
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@swap #不需要睡眠到硬盘功能的话跳过这个
```
可选：确认
```zsh
btrfs subvolume list -p /mnt
```
取消挂载

```zsh
umount /mnt
```
正式挂载

挂载root子卷
```zsh
mount -t btrfs -o subvol=/@,compress=zstd /dev/nvme0n1p2 /mnt
```
和刚刚的挂载是一样的操作，不过这次是把/dev/nvme0n1p2上的@子卷挂载到了/mnt，而不是把/dev/nvme0n1p2挂载到/mnt。

挂载home子卷
```zsh
mount --mkdir -t btrfs -o subvol=/@home,compress=zstd /dev/nvme0n1p2 /mnt/home
```
由于/mnt下没有/mnt/home这个目录，所以要加上--mkdir命令创建/mnt/home用来挂载。把@home子卷挂载到了/mnt/home。

可选：挂载swap子卷（不需要睡眠功能的话跳过这一步）
```zsh
mount --mkdir -t btrfs -o subvol=/@swap,compress=zstd /dev/nvme0n1p2 /mnt/swap
```
挂载efi分区（esp）
```zsh
mount --mkdir /dev/nvme0n1p1 /mnt/efi
```
记得把/dev/nvme0n1p1替换为自己对应的efi分区设备名。

复查挂载情况
```zsh
df -h
```
