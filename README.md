# cabin - Workstation Configuration
forward operating base of the concourse team!

## Initial boot
1. gdisk /dev/sda
  1. create a new gpt partition
  1. create a boot partition
    1. partition 1
    1. partition code: `EF00`
    1. size: 100mb
   1. create a main partition
    1. partition 2
    1. partition code: whatever the default is
    1. size: whatever the default is
1. `mkfs.vfat /dev/sda1`
1. `mkfs.ext4 /dev/sda2`
1. `mount /dev/disk/by-label/nixos /mnt`
1. `mkdir /mnt/boot`
1. `mount /dev/sda1 /mnt/boot`
1. `nixos-generate-config --root /mnt`
1. minimal changes to `/mnt/etc/nixos/configuration.nix` to start things
  1. include `git` as one of the packages to get
1. `nixos-install`
1. reboot or shutdown/whatever you want, just take out the USB/Disc before the machine starts up.


After restart check this repo out, replace /etc/nixos/configuration.nix with the one in this repo and run `nixos-rebuild switch` and reboot.
