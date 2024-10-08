{ lib, config, pkgs, settings, ... }:

{
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
}