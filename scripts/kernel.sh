# install the backported kernel
apt-get update
apt-get install -y linux-image-generic linux-headers-generic

secho "Rebooting the machine..."
reboot
sleep 60
