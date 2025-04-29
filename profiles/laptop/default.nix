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
      "/wm/${settings.wm}.nix"
      "/style"
    ]);
  #tets
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

    fprintd = {
      enable = true;
      tod = {
        enable = true;
        driver = pkgs.libfprint-2-tod1-vfs0090;
      };
    };
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
