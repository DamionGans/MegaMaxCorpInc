# MegaMaxCorpInc
A CTF-box made for new Linux users. (this Readme is a WIP and the image is not ready yet)

The releases tab contains pre-installed images. That means an easy copy and open the configuration inside your hypervisor/machine setup experience. If you want to create installations yourself (if you want to tweak some parts, for example), you can do so with the instructions below.
## Installation instructions
### 1. Get a fresh installation of Ubuntu (Server) 18.04
URL's to get Ubuntu Server 18.04.4:
HTTP: [link](http://releases.ubuntu.com/18.04/ubuntu-18.04.4-live-server-amd64.iso)
Torrent: [link](http://releases.ubuntu.com/18.04/ubuntu-18.04.4-live-server-amd64.iso.torrent)

Installation targets can be:
- inside a VM (VirtualBox, VMWare, Hyper-V and the likes)
- inside WSL2 (Windows Subsystem for Linux, you'll need to install this script: [ubuntu-wsl2-systemd-script](https://github.com/DamionGans/ubuntu-wsl2-systemd-script) before continuing with the nextt step
- on bare metal (although I do not recommend it)
Among others, be creative :)

### 2. After installing, login and clone this repo and install it
```sh
git clone https://github.com/DamionGans/MegaMaxCorpInc.git
cd MegaMaxCorpInc/src/
sudo bash installVM.sh
# enter your password and wait for the installation
```
### 3. Reboot the installation
On WSL2, it is adequate to 'just' re-open the window.

### 4. Enjoy your MegaMaxCorpInc CTF-adventure.
