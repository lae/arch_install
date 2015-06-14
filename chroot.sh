#!/bin/bash -x

echo koto > /etc/hostname

locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

mkinitcpio -p linux

useradd -M -u 1017 -s /bin/bash -p '$6$L5Uyl3yxbWSiVbYi$uYmN04B.5sOSLcde105YQr.idicq.0ofHtofN5lJ/v0Zbyqe2IGRLo3HxSoSx0XgRq6dfPrFwPGulfCfXfRFC/' lae
systemctl enable sshd.service

mkdir -m 0700 ~lae/.ssh
touch ~lae/.ssh/authorized_keys
chmod 700 ~lae/.ssh/authorized_keys
cat /lae.authorized_key >> ~lae/.ssh/authorized_keys
chown -R lae: ~lae
