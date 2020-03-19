# MegaMaxCorpInc
A CTF-box made for new Linux users. 

*Important: This software is in a prerelease state. This readme is a WIP and the image is not finished yet. If you use the image, be prepared for a lot of things not to be working yet or finished.

## Description of MegaMaxCorpInc
MegaMaxCorpInc is a big company that has badly secured IT-facilities. Mr. Hackerman has hacked the main-server of MegaMaxCorpInc and he will confront the player, who is the IT-administrator, to fix various problems out of a pity for the company. He offers various challenges to do so.

## Setup options
- The releases of this repo tab contains pre-installed images. That means an easy open the configuration inside your hypervisor/machine and run setup experience. 
- If you want to create installations yourself (if you want to tweak some parts, for example), you can do so with the instructions below.

## A few important things to know before starting
- For manually installing the VM image, you need to give the VM access to the internet (possible with NAT).
- For accessing the VM from your host machine, you'll need to have networking access to the VM (host-only-adapter with DHCP or NAT).
- Make sure you have enough RAM allocated to the VM. 2GB is sufficient.
- Documentation of the project is findable in the wiki of this repository.

## Manual installation instructions
### 1. Get a fresh installation of Ubuntu (Server) 18.04
URL's to get Ubuntu Server 18.04.4:
- HTTP: [link](http://releases.ubuntu.com/18.04/ubuntu-18.04.4-live-server-amd64.iso)
- Torrent: [link](http://releases.ubuntu.com/18.04/ubuntu-18.04.4-live-server-amd64.iso.torrent)
- WSL2: [link](https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q)

Installation targets can be:
- inside a VM (VirtualBox, VMWare, Hyper-V and the likes)
- inside WSL2 (Windows Subsystem for Linux gen 2, you'll need to install this script: [ubuntu-wsl2-systemd-script](https://github.com/DamionGans/ubuntu-wsl2-systemd-script) before continuing with the next step
- on bare metal (although I do not recommend it)
- elsewhere, be creative and let me know :)

### 2. After installing, login and clone this repo and install it
```sh
git clone https://github.com/DamionGans/MegaMaxCorpInc.git
cd MegaMaxCorpInc/
sudo bash installVM.sh
# enter your password and wait for the installation
```
### 3. Reboot the installation
On WSL2, it is adequate to 'just' re-open the window.

### 4. Enjoy your MegaMaxCorpInc CTF-adventure.
Have fun with Mr. Hackerman :-)
