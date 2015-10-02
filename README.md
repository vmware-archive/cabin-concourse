# cabin - workstation configuration
The forward operating base of the concourse team!

## Initial Boostrap
1. gdisk /dev/sda
  1. create a new gpt partition (`o`)
  1. create a boot partition (`n`)
    1. partition: \<default\>
    1. first sector: \<default\>
    1. size: `500M`
    1. partition code: `EF00`
   1. create a main partition
    1. partition: \<default\>
    1. first sector: \<default\>
    1. size: \<default\>
    1. partition code: \<default\>
  1. Write changes (`w`)
1. Encrypt, Format, and mount the main partition:
  1. **Note**: Remember the password you give for the following two steps:
  1. Encrypt the partition:
  ```
cryptsetup luksFormat /dev/sda2
  ```
  1. Open the encrypted parition:
  ```
cryptsetup luksOpen /dev/sda2 crypted
  ```
  1. Format a btrfs drive on the encrypted partition:
  ```
mkfs.btrfs -L nixos /dev/mapper/crypted
  ```
  1. Mount the encrypted partition:
  ```
mount /dev/disk/by-label/nixos /mnt
  ```
1. Format/Mount boot partition:
  1. Make it vfat:
  ```
mkfs.vfat /dev/sda1
  ```
  1. Create location for boot to mount:
  ```
mkdir /mnt/boot
  ```
  1. Mount the partition:
  ```
mount /dev/sda1 /mnt/boot
  ```
1. `nixos-generate-config --root /mnt`
1. minimal changes to `/mnt/etc/nixos/configuration.nix` to start things
  1. include `git` as one of the `environment.systemPackages` to get
  1. Add the following lines to the config:
  ```
boot.initrd.luks.devices = [ { device = "/dev/sda2"; name = "crypted"; } ];
  ```
1. `nixos-install`
1. reboot or shutdown/whatever you want, just take out the USB/Disc before the machine starts up.


After restart check this repo out, replace /etc/nixos/configuration.nix with the one in this repo and run `nixos-rebuild switch` and reboot.
