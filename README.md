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

### pve/pmg on port 443

```bash
$ iptables -F
$ iptables -t nat -F
$ iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 8006
$ apt install iptables-persistent -y
```

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

`r8168` isn't yet compatible with debian 12 it seems like,

to fix the `error: too many arguments to function netif_napi_add` just replace the lines in `r8168-8.051.02/src/r8168.h`

```diff
-#define RTL_NAPI_CONFIG(ndev, priv, function, weight)   netif_napi_add(ndev, &priv->napi, function, weight)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,1,0)
+#define RTL_NAPI_CONFIG(ndev, priv, function, weight)   netif_napi_add(ndev, &priv->napi, function, weight)
+#else
+#define RTL_NAPI_CONFIG(ndev, priv, function, weight)   netif_napi_add_weight(ndev, &priv->napi, function, weight)
+#endif
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

https://www.nvidia.com/Download/index.aspx

```bash
$ wget https://us.download.nvidia.com/XFree86/Linux-x86_64/535.54.03/NVIDIA-Linux-x86_64-535.54.03.run

$ apt install linux-headers-`uname -r` build-essential

$ sh NVIDIA-Linux-x86_64-535.54.03.run
```

then follow: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker

### Samba shares

```
\\192.168.178.75\topi
\\192.168.178.75\media
\\192.168.178.75\share
\\192.168.178.75\bunker
\\192.168.178.75\downloads
```

### Wireguard Allowed IPs Exclude Calculator

https://www.procustodibus.com/blog/2021/03/wireguard-allowedips-calculator/
