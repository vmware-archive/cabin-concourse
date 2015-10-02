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
1. Install git:
  ```
  nix-env -i git
  git clone https://github.com/concourse/cabin
  ```
1. Run the install script
  ```
  cabin/scripts/install
  ```

## Post Install
1. After restart you'll need to set the password for the `pilot` user:
  1. Once the login screen comes up, hit `alt` + `shift` + `F1` to open terminal 1
  1. login as root
  1. type `passwd pilot` to set the password for `pilot`
  1. exit and then hit `alt` + `shift` + `F1` to get back to the prompt
1. Checkout cabin and run the post install script:
```
mkdir workspace
git clone https://github.com/concourse/cabin
cd cabin
scripts/post-install
```
