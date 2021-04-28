# 安装 docker，docker-compose

 - 将所有文件上传服务器
 - 切换服务器root权限
 - 修改 install.sh 权限，命令：chmod +x install.sh
 - 执行 ./install.sh 即可

## 离线包下载
 - docker: https://download.docker.com/linux/static/stable/x86_64/
 - docker-compose: https://github.com/docker/compose/releases
## 命令补全

### docker 命令补全
 - centos:  yum install -y bash-completion && source /usr/share/bash-completion/bash_completion
 - ubuntu: apt-get install -y bash-completion && source /usr/share/bash-completion/bash_completion

### docker-compose 命令补全
 - curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
















