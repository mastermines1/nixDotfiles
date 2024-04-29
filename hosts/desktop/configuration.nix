{ config, pkgs, inputs, settings, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../system/gpu/amd-rx570
      ../common.nix
      ../../system/wm/${settings.user.wm}.nix
      ../../user/style
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

 fileSystems."/run/mount/HHD" = {
   device = "/dev/disk/by-uuid/68932330-21aa-4e00-81c2-1bd38218bf34";
   fsType = "ext4";
 };

 fileSystems."/run/mount/HHD_ntfs" = {
   device = "/dev/disk/by-uuid/783A0F5D3A0F17B0";
   fsType = "ntfs-3g";
 };

  services.mullvad-vpn.enable = true;

  networking = {
    hostName = "nixos"; # Define your hostname.
  };
  security.polkit.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez-experimental;
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
