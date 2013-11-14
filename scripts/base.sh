apt-get -y update
apt-get -y upgrade
apt-get -y install gcc build-essential linux-headers-$(uname -r) nfs-kernel-server zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev vim curl puppet ssh wget nfs-common
apt-get clean

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config

date > /etc/vagrant_box_build_time

cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="debian-installer=en_US cgroup_enable=memory swapaccount=1"
EOF

update-grub

