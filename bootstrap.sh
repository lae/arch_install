#!/bin/bash -x

WORK_DIR=/tmp/installer
INSTALL_DIR=/mnt

pacman -Sy --noconfirm git
git clone --depth=1 https://github.com/lae/arch_install.git $WORK_DIR

cp $WORK_DIR/mirrorlist /etc/pacman.d/mirrorlist

pacstrap $INSTALL_DIR base openssh python sudo

genfstab -p $INSTALL_DIR >> $INSTALL_DIR/etc/fstab

cp $WORK_DIR/chroot.sh $INSTALL_DIR
chmod +x $INSTALL_DIR/chroot.sh
cp $WORK_DIR/locale.gen $INSTALL_DIR/etc/locale.gen
cp $WORK_DIR/lae.authorized_key $INSTALL_DIR
arch-chroot $INSTALL_DIR /chroot.sh
rm $INSTALL_DIR/chroot.sh $INSTALL_DIR/lae.authorized_key

cp $WORK_DIR/lae.sudo $INSTALL_DIR/etc/sudoers.d/lae
