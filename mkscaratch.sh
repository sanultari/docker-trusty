#!/usr/bin/env bash

VARIANT=buildd
CROOT=trusty
TARBALL=$PWD/${CROOT}.tar.gz

sudo debootstrap --verbose --variant=$VARIANT --components='main,universe' --include='iproute,iputils-ping,curl,wget,ca-certificates' --arch=amd64 trusty $CROOT/ `curl -s http://mirrors.ubuntu.com/mirrors.txt | head -1`

cd $CROOT

echo $'#!/bin/sh\nexit 101' | sudo tee usr/sbin/policy-rc.d > /dev/null
sudo chmod +x usr/sbin/policy-rc.d

sudo chroot . dpkg-divert --local --rename --add /sbin/initctl
sudo ln -sf /bin/true sbin/initctl

sudo chroot . apt-get update
sudo chroot . apt-get clean

touch $TARBALL

sudo tar --numeric-owner -caf $TARBALL .
