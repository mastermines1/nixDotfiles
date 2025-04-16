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
      #    "/gpu/amd-rx570.nix"
      "/wm/${settings.wm}.nix"
      "/style"
    ]);

  users.users.${settings.name} = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "dialout" "audio"];
  };

  networking = {
    hostName = settings.username + "-desktop";
    firewall = {
    };
    nameservers = [
      "8.8.8.8"
    ];
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

	};

  programs = {
    steam.enable = true;
    nh = {
      enable = true;
      flake = settings.dotDir;
    };
  };

  fileSystems."/run/mount/HHD" = {
    device = "/dev/disk/by-uuid/68932330-21aa-4e00-81c2-1bd38218bf34";
    fsType = "ext4";
  };

	nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";
}
