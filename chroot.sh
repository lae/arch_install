#!/bin/bash -x

locale-gen
echo LANG=ja_JP.UTF-8 > /etc/locale.conf
echo LANG=ja_JP.UTF-8 >> /etc/environment.conf
ln -sv /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

mkinitcpio -p linux

useradd -m -u 317 -s /bin/bash -p '$6$9IWJF7oZ24aAPtRl$Nysk6Cv81HVx4OytIWQ/1W0ZKXgg/eMtv33aG6rKs.dW018ZtSxEzDUJ7Fsz4utWwKI291QVKUorATHwlbivH1' lae
systemctl enable sshd.service

su - lae -c "/bin/bash /chroot_as_lae.sh"
