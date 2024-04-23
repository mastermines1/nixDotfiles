{ pkgs, ... }:
{
  imports = [ 
   ./fonts.nix
  ];

  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
  #security.polkit.enable = true;
}
