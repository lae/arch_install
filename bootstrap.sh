#!/bin/bash -x

WORK_DIR=/tmp/installer
INSTALL_DIR=/mnt

pacman -Sy --noconfirm git
git clone --depth=1 https://github.com/lae/arch_install.git $WORK_DIR
if [ $? -ne 0 ]; then
    cd $WORK_DIR && git pull
fi

cp -v $WORK_DIR/mirrorlist /etc/pacman.d/mirrorlist

pacstrap $INSTALL_DIR base openssh python sudo

genfstab -p $INSTALL_DIR >> $INSTALL_DIR/etc/fstab

cp -av $WORK_DIR/chroot.sh $INSTALL_DIR
cp -v $WORK_DIR/chroot_as_lae.sh $INSTALL_DIR
cp -v $WORK_DIR/locale.gen $INSTALL_DIR/etc/locale.gen
cp -v $WORK_DIR/lae.authorized_key $INSTALL_DIR
arch-chroot $INSTALL_DIR /chroot.sh
rm -vf $INSTALL_DIR/{chroot.sh,lae.authorized_key,chroot_as_lae.sh}

cp -v $WORK_DIR/lae.sudo $INSTALL_DIR/etc/sudoers.d/lae
