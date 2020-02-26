# MegaMaxCorpInc-VMBuilder
MegaMAxCorpInc-VMBuilder is a set of scripts to build and/or install the MegaMaxCorpInc CTF box against it's latest changes from upstream.

## features

### The buildVM script
Script to build the MegaMaxCorpInc image against the latest upstream sources.
* downloads the latest daily live image of Ubuntu Bionic Server
* Runs the installVM script on it inside a chroot environment. 
* * If that fails it starts the installVM script upon first boot.
* Then it packages it back into a virtual disk image to use in a VM.

### the installVM script
Script to change a fresh Ubuntu Bionic Server installation into the MegaMaxCorpInc-VMBuilder
* does stuff [placeholder for now]