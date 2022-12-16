# docker

Docker compose files for my homeserver


### docker post install
https://docs.docker.com/engine/install/linux-postinstall/


### for Grafana run
`sudo chown -R 472:472 .data/grafana/`


### gpu passthrough
gpu passthrough setup stuff:

```bash
$ wget https://us.download.nvidia.com/XFree86/Linux-x86_64/515.65.01/NVIDIA-Linux-x86_64-515.65.01.run
$ apt install linux-headers-`uname -r` build-essential
$ sh NVIDIA-Linux-x86_64-515.65.01.run
```

then follow: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker
