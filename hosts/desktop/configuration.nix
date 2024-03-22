{ config, pkgs, inputs, settings, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../system/gpu/amd-rx570
      ../common.nix
      ../../system/wm/${settings.user.wm}.nix
      ../../system/style
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos"; # Define your hostname.
    nameservers = [ "100.100.100.100" "100.85.99.93" "1.1.1.1" ];
    networkmanager.dns = "none";
  };
  security.polkit.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
  };
  services.flatpak.enable = true;
  programs.steam.enable = true;

#  programs.alvr = {
#    enable = true;
#    openFirewall = true;
#  };

  system.stateVersion = "23.11"; # Did you read the comment?
}
