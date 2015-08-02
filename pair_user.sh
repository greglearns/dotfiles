#!/bin/sh -xe
USER=$1
GITHUB=$2

sudo useradd -m -G pair ${USER}
sudo sed -i "s/AllowUsers/& ${USER}/" /etc/ssh/sshd_config
sudo /etc/init.d/sshd restart

# Setup ssh authorized_keys
SSHDIR=/home/${USER}/.ssh
mkdir -m 700 $SSHDIR
sudo su ${USER}
curl https://github.com/${GITHUB}.keys > $SSHDIR/authorized_keys
chmod og-rwx $SSHDIR/authorized_keys

#tweemux hubkey ${USER} $2

