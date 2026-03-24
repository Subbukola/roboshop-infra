#!/bin/bash
component=$1
environment=$2
dnf install ansible -y
cd /home/ec2-user
git clone https://github.com/Subbukola/ansible_roles.git
cd ansible_roles
git pull
ansible-playbook -e component=$component -e env=$environment roboshop.yaml
