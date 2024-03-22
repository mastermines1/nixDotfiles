{ pkgs, settings, ... }:
{
  imports = [
    ../../app/desktop/fuzzel
    ../../app/desktop/mako
  ];
  home.packages = with pkgs; [
    hyprpaper
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
  ];
}
