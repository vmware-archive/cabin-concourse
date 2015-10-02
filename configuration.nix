# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the gummiboot efi boot loader.
  boot.loader.gummiboot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    chromium
    cowsay
    ctags
    direnv
    dmenu
    docker
    figlet
    fish
    git
    go
    graphviz
    htop
    jq
    lastpass-cli
    linuxPackages.virtualbox
    mtr
    neovim
    parallel
    phantomjs2
    silver-searcher
    sqlite
    stow
    termite
    tmux
    tree
    vagrant
    wget
  ];

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      corefonts
      inconsolata
      ubuntu_font_family
      proggyfonts
    ];
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";

  # Set sddm as the default displayManager
  services.xserver.displayManager.sddm.enable = true;

  # Set OpenBox as the default windowManager
  services.xserver.windowManager.xmonad.enable = true;
  services.xserver.windowManager.xmonad.enableContribAndExtras = true;
  services.xserver.windowManager.default = "xmonad";

  # Enabling Pulse Audio for sound
  hardware.pulseaudio.enable = true;

  # Enable postgresql for Concourse
  services.postgresql.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.pilot = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "audio" "networkmanager" ];
    shell = "/run/current-system/sw/bin/fish";
  };

  nixpkgs.config = {
    # Enable restricted packages
    allowUnfree = true;

    chromium = {
      enablePepperFlash = true;
      enablePepperPDF = true;
    };
  };


  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";

}
