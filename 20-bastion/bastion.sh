#!/bin/bash

### first installing utils, adding terraform repo here, and installing terraform
yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform

### this is for increasing the disk size in bastion because terraform takes more disk space
## first incrase the 4th partition of nvme0n1 and increased the rootVol to 20GB and homeVol to 10GB
growpart /dev/nvme0n1 4
lvextend -L +20G /dev/RootVG/rootVol
lvextend -L +10G /dev/RootVG/homeVol

#### this we are mounting the disk size for /home and root directory / for new disk spaces
xfs_growfs /
xfs_growfs /home