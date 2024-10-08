{ config, lib, pkgs, inputs, settings, ...}:

{
  imports = [
    ../base/default.nix
  ] ++
  (map (m: ../../modules/nix + m) [
    "/dm/${settings.dm}.nix"
    "/polkit.nix"
  ]);

  networking = {
    hostName = "nixos"; # Define your hostname.
    dns = "none";
  };

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez-experimental;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    openssl
    libressl
    libnotify
    inputs.zen-browser.packages."${system}".default
  ];

  services.gnome.gnome-keyring.enable = true;
  services.gvfs.enable = true;
  services.devmon.enable = true;
  services.udisks2.enable = true;
  environment.localBinInPath = true;
}