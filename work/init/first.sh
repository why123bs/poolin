#!/bin/sh




bash /work/init/sun_install.sh ||
bash /work/init/sun_install.sh &&


sudo -S  bash /work/init/second.sh  &&
bash /work/script/proxy_daemon.sh &&
sudo systemctl daemon-reload &&
sudo systemctl enable proxy_daemon.service &&
sudo systemctl start proxy_daemon.service  &&
sudo systemctl enable proxy_daemon.timer &&
sudo systemctl start proxy_daemon.timer &&


echo "---------------------------------------------------------------------" &&
echo "                   恭喜您，代理安装成功！！！！" &&
echo "---------------------------------------------------------------------"

