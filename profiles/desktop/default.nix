{pkgs, config, lib, settings, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ../desktop_base
  ] ++
  (map (m: ../../modules/nix + m) [
    "/gpu/amd-rx570.nix"
    "/wm/${settings.wm}.nix"
    "/style"
  ]);

  users.users.${settings.name} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "dialout" "audio"];
  };

  networking = {
    hostName = settings.username + "-desktop";
  };

  services = {
    hardware.openrgb = {
      enable = true;
      package = pkgs.openrgb-with-all-plugins;
    };
  };

  programs = {
    steam.enable = true;
    nh = {
      enable = true;
      flake = settings.dotDir;
    };
  };
  
  security.pam.services.swaylock = {};

  fileSystems."/run/mount/HHD" = {
   device = "/dev/disk/by-uuid/68932330-21aa-4e00-81c2-1bd38218bf34";
   fsType = "ext4";
  };


  system.stateVersion = "23.11";
}