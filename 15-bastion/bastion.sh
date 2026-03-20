#!/bin/bash
#sudo growpart /dev/nvme0n1 4
#sudo lvextend -L +50G /dev/vgname/lvname 


#terraform installation 
yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform