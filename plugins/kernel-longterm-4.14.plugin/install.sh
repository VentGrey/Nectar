#!/bin/bash

apt -q --quiet kernel-devel
kernel_devel_test=$?

if [ $kernel_devel_test == 0 ] ; then
  _devel=kernel-longterm-devel
fi

dnf copr enable kwizart/kernel-longterm-4.14 -y
dnf install kernel-longterm $_devel -y
