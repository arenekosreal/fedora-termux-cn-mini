#!/bin/sh

echo "This script is to help people who has a bad Internet connection. Before installing, you have to download image manually and put it together with this script (DO NOT rename it, or script cannot recognize file). You can find download address in a file called 'ADDRESS.md' at my project"
echo "Please check if you have correct image(yes/no):"
read answer
if [ $answer == "yes" ]
then
	echo "Installing packages: proot p7zip"
	pkg install proot p7zip -y
	echo "Creating directory..."
	mkdir ~/fedora_cn
	echo "Unpacking image..."
	7z x fedora.7z -o~/fedora_cn
	echo "Unpack successful. Cleaning temp files..."
	rm -f fedora.7z
	echo "Generating launch script..."
	cat > /data/data/com.termux/files/usr/bin/startfedora <<- EOM
	#!/bin/sh
	unset LD_PRELOAD && proot --link2symlink -0 -r ~/fedora -b /dev/ -b /sys/ -b /proc/ -b /storage/ -b $HOME -w $HOME /bin/env -i HOME=/root TERM="$TERM" PS1='[termux@fedora \W]\$ ' LANG=en_US.UTF8 PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/zsh -l
	EOM
	chmod +x /data/data/com.termux/files/usr/bin/startfedora
	echo "All done. Execute 'startfedora' to launch it. Use 'dnf update' in Fedora terminal to update it."
elif [ $answer == "no" ]
	echo "You have canceled offline installation. You can execute this script again to restart offline install. Exiting..."
else
	echo "Unknown result, exiting..."
fi
