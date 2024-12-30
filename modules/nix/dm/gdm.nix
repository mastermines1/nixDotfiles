{
  lib,
  config,
  pkgs,
  settings,
  ...
}: {
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
