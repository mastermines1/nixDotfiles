{ pkgs, ... }:
{
  imports = [
    ./wayland.nix
    ./pipewire.nix
  ];
  services.gnome.gnome-keyring.enable = true;

  programs = {
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };
}
