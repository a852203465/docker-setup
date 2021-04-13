#!/bin/bash

set -e

# 获取当前目录
DIR="$(cd "$(dirname "$0")" && pwd)"
source $DIR/common.sh

set +o noglob

function install_docker {

  # 解压文件
  tar -zxvf $DIR/docker-20.10.1.tgz

  # 复制文件
  sudo cp -f $DIR/docker/* /usr/bin/

  # 将docker注册为service
  sudo cp -f $DIR/docker.service /etc/systemd/system/docker.service

  # 修改权限 启动Docker
  chmod +x /etc/systemd/system/docker.service

  # 设置daemon.json
  sudo mkdir -p /etc/docker
  sudo cp -f $DIR/daemon.json  /etc/docker/daemon.json

  systemctl daemon-reload
  systemctl start docker			#启动Docker
  systemctl enable docker.service			#设置开机自启
}

function restart_docker {
  systemctl daemon-reload
  systemctl restart docker
}

function install_dockercompose {
  sudo cp -f $DIR/docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
}

# 安装 docker, docker-compose
install_docker
install_dockercompose

# 验证 docker, docker-compose
check_docker
check_dockercompose

# 重启 docker
restart_docker
































