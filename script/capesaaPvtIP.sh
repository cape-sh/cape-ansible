#!/bin/bash 
################
#Author : Ankeit Taksh
#Owner : Biqmind/Cape
#Date: 17 June 2020
# About : A simple script for deployoing the cape from any Github to any RHEL7 or centos 7 machine
#How to use : "sh capesaas-scriptsh"
################


echo `date` >> /tmp/timeflag
setenforce 0
/bin/mv /root/.ssh/id_rsa* /tmp/
ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
###Yum config
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y git ansible #for centos
apt install -y git ansible #for ubuntu
git clone https://github.com/cape-sh/cape-ansible.git
cd cape-ansible/
netx=`ip route| grep default | awk '{print $3}' | cut -f1-3 -d.`   #find linux default network 
PvtIP=`hostname -I | tr " " "\n" | grep $netx`      # allocate default pvt IP to script
PubIP=`curl https://api.ipify.org/`

sed -i  "s#server_master_ip#$PvtIP#g"  inventory/hosts.ini
sed  -i "s#server_master_ip#$PvtIP#g"  roles/cape/tasks/main.yml
ansible-playbook site.yml
echo `date` >> /tmp/timeflag
ansible-playbook site.yml
