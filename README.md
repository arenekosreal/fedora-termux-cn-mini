# fedora-termux-cn 
[点击此处查看中文描述](https://gitlab.com/zhanghua000/fedora-termux-cn/blob/master/README_cn.md)<br/>
Fedora 30 on Termux with Chinese language support ,GUI and vnc server.
This is a re-pack version of Fedora 30 aarch64. You have to prepare these:
- a phone which CPU architecture is aarch64
- Termux APP
   - [Google Play](https://play.google.com/store/apps/details?id=com.termux)
   - [F-Droid](https://f-droid.org/repository/browse/?fdid=com.termux)
- Install proot and git in Termux:
   - execute these commands:
      ```
      pkg update
      pkg upgrade
      pkg install proot git -y
      ```
   - notes: In China, you may want to change termux's mirror. Just execute these in termux terminal: 
   ```
   sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' $PREFIX/etc/apt/sources.list
   apt update && apt upgrade
   ```
Finally, just execute the `install.sh` shell script, then, execute `startfedora` ,and enjoy it:)<br/>
You can execute `vncserver :1` in Fedora terminal and install a VNC cient([Here](https://www.realvnc.com/en/connect/download/viewer/)), to connect to the Fedora VNC server, and you can enjoy the GUI.</br>
If you are a Chinese user, please choose `install_cn.sh` and read `README_cn.md` rather than this one to get Chinese language during installing and using Fedora.

