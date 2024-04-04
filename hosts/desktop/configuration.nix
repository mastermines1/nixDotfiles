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

 fileSystems."/run/mount/HHD" = {
   device = "/dev/disk/by-uuid/68932330-21aa-4e00-81c2-1bd38218bf34";
   fsType = "ext4";
#   options = [ # If you don't have this options attribute, it'll default to "defaults" 
     # boot options for fstab. Search up fstab mount options you can use
#     "users" # Allows any user to mount and unmount
#     "nofail" # Prevent system from failing if this drive doesn't mount
     
#   ];
 };

  networking = {
    hostName = "nixos"; # Define your hostname.
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
