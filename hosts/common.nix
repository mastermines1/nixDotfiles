{ config, pkgs, inputs, settings, ... }:
{

  imports = [
    ../system/polkit
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;
#  networking.firewall = {
#    allowedTCPPorts = [ 8384 22000 ];
#    allowedTCPPortRanges = [ { from = 1714; to = 1764;} ];
#    allowedUDPPorts = [ 22000 21027 ];
#    allowedUDPPortRanges = [ { from = 1714; to = 1764;} ];
#  };

  # Enable tailscale
  services.tailscale.enable = true;
  services.tailscale.useRoutingFeatures = "client";

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  nix.settings.extra-sandbox-paths = [ "/bin/bash=run/current-system/sw/bin/bash" ];
  nix.settings.sandbox = false;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "uk";



  # Enable CUPS to print documents.
  services.printing.enable = true;
 # services.avahi = {
 #   enable = true;
 #   nssmdns4 = true;
 #   openFirewall = true;
 # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${settings.user.username} = {
    isNormalUser = true;
    description = settings.user.name;
    extraGroups = [ "networkmanager" "wheel" "adbusers" "audio" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    efibootmgr
    gnome.gnome-disk-utility
    zsh
    home-manager
    git
    wget
    openssl
    libnotify
    killall
    spotify
    reaper
  ];

  boot.supportedFilesystems = [ "ntfs" ];

  programs.adb.enable = true;

  services.gnome.gnome-keyring.enable = true;  
  services.gvfs.enable = true;
  services.devmon.enable = true;
  services.udisks2.enable = true;
  environment.localBinInPath = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";
  };

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

}
