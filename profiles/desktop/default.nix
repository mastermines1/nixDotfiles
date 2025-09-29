{
  pkgs,
  inputs,
  settings,
  ...
}: {
  imports =
    [
      ./hardware-configuration.nix
      ../desktop_base
    ]
    ++ (map (m: ../../modules/nix + m) [
         "/gpu/amd-rx570.nix"
      "/wm/${settings.wm}.nix"
      "/style"
    ]);

  users.users.${settings.name} = {
    isNormalUser = true;
    extraGroups = ["kvm" "networkmanager" "wheel" "dialout" "audio" "adbusers"];
		shell = pkgs.fish;
		ignoreShellProgramCheck = true;
  };

programs.virt-manager.enable = true;

users.groups.libvirtd.members = ["${settings.name}"];

virtualisation.libvirtd.enable = true;

virtualisation.spiceUSBRedirection.enable = true;

  networking = {
    hostName = settings.username + "-desktop";
    firewall = {
    };
    # nameservers = [
    #   "8.8.8.8"
    # ];
  };

  virtualisation = {
    podman.enable = true;
  };

  hardware.enableAllFirmware = true;

  services = {
    hardware.openrgb = {
      enable = true;
      package = pkgs.openrgb-with-all-plugins;
    };

    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
    udev.packages = [ pkgs.android-udev-rules];
		resolved.enable = true;

	};

  programs = {
    steam.enable = true;
    nh = {
      enable = true;
      flake = settings.dotDir;
    };
    adb.enable = true;
  };

  fileSystems."/run/mount/HHD" = {
    device = "/dev/disk/by-uuid/68932330-21aa-4e00-81c2-1bd38218bf34";
    fsType = "ext4";
  };

	nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";
}
