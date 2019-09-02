#!/bin/sh

# Set Image address
# 设置镜像地址(使用Gitee源以加速大陆地区速度)
export ADDRESS=https://gitee.com/ZhangHuaGitee/fedora-termux-cn/raw/master/fedora.7z
# install necessary packages
# 安装必备软件包
echo "Installing packages: proot tar wget git p7zip"
pkg install proot tar wget git p7zip -y

# create local directory and get files
# 创建本地目录并且获取文件
echo "Creating local directory..."
mkdir ~/fedora_cn
cd ~/fedora_cn
echo "Getting image and unpacking..."
wget $ADDRESS -O fedora.7z
7z x fedora.7z
echo "Cleaning tempory files..."
rm -f fedora.7z

# generate start script
# 生成启动脚本
echo "Generating launch script..."
cat > /data/data/com.termux/files/usr/bin/startfedora <<- EOM
#!/bin/sh
unset LD_PRELOAD && proot --link2symlink -0 -r ~/fedora -b /dev/ -b /sys/ -b /proc/ -b /storage/ -b $HOME -w $HOME /bin/env -i HOME=/root TERM="$TERM" PS1='[termux@fedora \W]\$ ' LANG=en_US.UTF8 PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/zsh -l
EOM
chmod +x /data/data/com.termux/files/usr/bin/startfedora

# finish infomation:
# 结束信息:
echo "All done! Start Fedora with 'startfedora'. Get updates with regular 'dnf update'. "