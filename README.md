# docker

Docker compose files for my homeserver


### docker post install
https://docs.docker.com/engine/install/linux-postinstall/


### for Grafana run
```bash
$ sudo chown -R 472:472 data/grafana/
```


### for Lavalink run 
```bash
$ sudo chown -R 322:322 plugins
```

### gpu passthrough
gpu passthrough setup stuff:

```bash
$ wget https://us.download.nvidia.com/XFree86/Linux-x86_64/515.65.01/NVIDIA-Linux-x86_64-515.65.01.run

$ apt install linux-headers-`uname -r` build-essential

$ sh NVIDIA-Linux-x86_64-515.65.01.run
```

then follow: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker

### increase lvm

```bash
$ sudo lvs
```

```bash
sudo lvextend -L <size>G /dev/mapper/<lvm>
```
