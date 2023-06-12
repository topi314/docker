# docker

Docker Compose and other config files for my homelab

## Hosts

### pve

https://github.com/topi314/docker/tree/pve

### pve2

https://github.com/topi314/docker/tree/pve2

### wg

https://github.com/topi314/docker/tree/wg

---

## Other Docs

### remove proxmox no subscription message

#### pve

```sh
$ sed -Ezi.bak "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service
```

#### pmg

```sh
$ sed -Ezi.bak "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pmgproxy.service
```

### realtek lan controller drivers

download from https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-pci-express-software

```bash
$ apt install build-essential
$ apt install pve-headers-$(uname –r)
$ tar -xvf r8168-8.051.02.tar.bz2
$ cd r8168-8.051.02
$ chmod +x autorun.sh
$ ./autorun.sh
```

reboot & should fucking work god

### passwordless sudo

```bash
$ echo -e "\ntopi ALL=(ALL) NOPASSWD: ALL\n" | sudo tee -a /etc/sudoers
```

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

https://www.reddit.com/r/homelab/comments/b5xpua

### nvidia driver stuff

```bash
$ wget https://us.download.nvidia.com/XFree86/Linux-x86_64/525.105.17/NVIDIA-Linux-x86_64-525.105.17.run

$ apt install linux-headers-`uname -r` build-essential

$ sh NVIDIA-Linux-x86_64-515.65.01.run
```

then follow: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker

### Samba shares

```
\\192.168.178.74\topi
\\192.168.178.74\media
\\192.168.178.74\share
\\192.168.178.74\bunker
\\192.168.178.74\downloads
```

### Wireguard Allowed IPs Exclude Calculator

https://www.procustodibus.com/blog/2021/03/wireguard-allowedips-calculator/
