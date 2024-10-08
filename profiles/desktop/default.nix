{pkgs, config, lib, settings,...}:

{
  imports = [
    ./hardware-configuation.nix
    ../desktop_base
  ] ++
  (map (m: ../../modules/nix + m) [
    "/gpu/amd-rx570.nix"
    "/wm/${settings.wm}.nix"
    "/style"
  ]);

  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.name;
    extraGroups = [ "networkmanager" "wheel" "dialout" "audio"];
  };

  networking = {
    hostName = settings.userName + "-desktop";
    firewall = {

    };
  }

  services = {
    hardware.openrgb = {
      enable = true;
      package = pkgs.openrgb-with-all-plugins;
    }
  };

  programs = {
    steam.enable = true;
  };

  fileSystems."/run/mount/HHD" = {
   device = "/dev/disk/by-uuid/68932330-21aa-4e00-81c2-1bd38218bf34";
   fsType = "ext4";
  };


  system.stateVersion = "23.11";
}