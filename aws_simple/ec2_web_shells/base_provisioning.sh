#!/bin/bash

sudo sed -i s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config
sudo setenforce 0
sudo getenforce # Permissive

sudo timedatectl set-timezone Asia/Tokyo
sudo timedatectl

# ntp was not installed (workaround)

sudo yum -y install epel-release
sudo yum -y install bash-completion
sudo yum -y install net-tools
sudo yum -y install wget curl tree
sudo yum -y install zip unzip
sudo yum -y install vim
sudo yum -y install jq
sudo yum -y install lsof htop
sudo yum -y install gcc glibc

# git
sudo yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker
GITVERSION="2.10.1" &&
wget https://www.kernel.org/pub/software/scm/git/git-$GITVERSION.tar.gz &&
tar -zxf git-$GITVERSION.tar.gz &&
cd git-$GITVERSION &&
unset GITVERSION &&
make prefix=/usr/local all &&
sudo make prefix=/usr/local install &&
git --version && cd ..

sudo yum -y install expect

# AWS CLI
sudo yum -y install python-setuptools
sudo easy_install pip
sudo pip install awscli
sudo pip install easy-menu

# AWS ClowdWatch Agent
cd /home/centos
curl -s https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py -O
chmod +x /home/centos/awslogs-agent-setup.py
sudo /home/centos/awslogs-agent-setup.py -n -r ap-northeast-1 -c /home/centos/awslogs.conf
sudo /sbin/chkconfig awslogs on
sudo /sbin/chkconfig --list | grep awslogs
