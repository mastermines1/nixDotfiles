{
  pkgs,
  inputs,
  settings,
  ...
}: {
  imports =
    [
      ../base/default.nix
    ]
    ++ (map (m: ../../modules/nix + m) [
      "/dm/${settings.dm}.nix"
      "/polkit.nix"
    ]);

  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
    };
  };

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez-experimental;
  };

  # Enable CUPS to print documents.
  services = {
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    openssl
    libressl
    libnotify
    inputs.zen-browser.packages."${system}".default
  ];

  environment.localBinInPath = true;
}
