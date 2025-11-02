{
  pkgs,
  inputs,
  settings,
  ...
}: {
  imports =
    [
      ./hardware-configuration.nix
      ../laptop_base
    ]
    ++ (map (m: ../../modules/nix + m) [
      # /wm/${settings.wm}.nix
      /style
    ]);
  #tets
  users.users.${settings.name} = {
    isNormalUser = true;
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
    extraGroups = ["networkmanager" "wheel" "dialout" "audio"];
  };

  networking = {
    hostName = settings.username + "-" + settings.profile;
    firewall = {
      allowedTCPPorts = [22000 8384];
      allowedUDPPorts = [22000 21027 41641];
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
    resolved.enable = true;
    hardware.openrgb = {
      enable = true;
      package = pkgs.openrgb-with-all-plugins;
    };

    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };

		tailscale = {
			enable = true;
		};
    syncthing = {
			enable = true;
			user = settings.username;
			configDir = "/home/${settings.username}/.config";
			dataDir = "/home/${settings.username}/sync";
			
		};
  };

	fileSystems."/run/mount/sync" = {
		device = "/dev/disk/by-uuid/ee6e7bb1-d264-47b3-baf3-330c9445cf1c";
		fsType = "ext4";
	};

  programs = {
    steam.enable = true;
    nh = {
      enable = true;
      flake = settings.dotDir;
    };
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05";
}
