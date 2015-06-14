#!/bin/bash -x

mkdir -vm 0700 $HOME/.ssh
touch $HOME/.ssh/authorized_keys
chmod -v 700 $HOME/.ssh/authorized_keys
cat /lae.authorized_key >> $HOME/.ssh/authorized_keys
