Saucy Docker Base Images
========================

Docker minimal base image for saucy

Built the image from bellow command

```
sudo debootstrap --verbose --variant=minbase --components='main,universe' --include='iproute,iputils-ping,curl,wget' --arch=amd64 saucy /tmp/saucy-ppa/ `curl -s http://mirrors.ubuntu.com/mirrors.txt | head -2 | tail -1`
```
