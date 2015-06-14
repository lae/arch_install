#!/bin/bash -x

echo koto > /etc/hostname

locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

mkinitcpio -p linux

useradd -M -u 1017 -s /bin/bash -p '$6$L5Uyl3yxbWSiVbYi$uYmN04B.5sOSLcde105YQr.idicq.0ofHtofN5lJ/v0Zbyqe2IGRLo3HxSoSx0XgRq6dfPrFwPGulfCfXfRFC/' lae
systemctl enable sshd.service

su - lae -c "/bin/bash /chroot_as_lae.sh"
