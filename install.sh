#!/bin/bash

set -e

# 获取当前目录
DIR="$(cd "$(dirname "$0")" && pwd)"
source $DIR/common.sh

set +o noglob

function install_docker {
  curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

  # 设置daemon.json
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
  sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
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
































