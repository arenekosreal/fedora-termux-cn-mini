# fedora-termux-cn
带有中文图形界面和VNC支持的Fedora 30。<br/>
这是Fedora 30 aarch64的重打包版本，你需要准备以下内容:
- CPU架构是aarch64的手机
- Termux APP
   - [Google Play](https://play.google.com/store/apps/details?id=com.termux)
   - [F-Droid](https://f-droid.org/repository/browse/?fdid=com.termux)
- 在Termux中安装proot和git:
   - 执行这些命令:
      ```
      pkg update
      pkg upgrade
      pkg install proot git -y
      ```
   - 注意：在中国，你可能要改变Termux的软件源镜像地址来加速，执行以下指令: 
   ```
   sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' $PREFIX/etc/apt/sources.list
   apt update && apt upgrade
   ```
最后，执行Shell脚本，等一切完成后执行 `startfedora` ,开始嗨吧:)<br/>
你可以在Fedora的终端执行 `vncserver :1` 并且安装一个 VNC 客户端([点击这里](https://www.realvnc.com/en/connect/download/viewer/)), 来连接到Fedora的VNC服务，就能使用GUI界面了。
