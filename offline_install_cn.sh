#!/bin/sh

echo "这个脚本用于在离线状态安装Fedora. 你必须提前下载镜像并且放在这个脚本所在的目录(不要重命名镜像文件,否则脚本会找不到镜像).你可以在 'ADDRESS_cn.md' 找到下载地址"
echo "请确认此脚本所在目录是否有镜像(yes/no):"
read answer
if [ $answer == "yes" ]
then
	echo "正在安装软件包: proot p7zip"
	pkg install proot p7zip -y
	echo "正在创建目录..."
	mkdir ~/fedora_cn
	echo "正在解压缩镜像..."
	7z x fedora.7z -o~/fedora_cn
	echo "解压缩成功. 正在清理临时文件..."
	rm -f fedora.7z
	echo "正在生成启动脚本..."
	cat > /data/data/com.termux/files/usr/bin/startfedora <<- EOM
	#!/bin/sh
	unset LD_PRELOAD && proot --link2symlink -0 -r ~/fedora -b /dev/ -b /sys/ -b /proc/ -b /storage/ -b $HOME -w $HOME /bin/env -i HOME=/root TERM="$TERM" PS1='[termux@fedora \W]\$ ' LANG=en_US.UTF8 PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/zsh -l
	EOM
	chmod +x /data/data/com.termux/files/usr/bin/startfedora
	echo "执行完毕!执行 'startfedora' 启动Fedora. 在Fedora的终端中执行 'dnf update' 来更新它."
elif [ $answer == "no" ]
	echo "你取消了离线安装. 你可以再次执行这个脚本来重新安装. 正在退出..."
else
	echo "错误回复, 正在退出..."
fi
