{lib, config, pkgs, settings, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "${settings.user.username}";
  home.homeDirectory = "/home/${settings.user.username}";
  home.stateVersion = "22.11";

  imports = [
   ../common-home.nix
   ../../user/app/emacs
   ../../user/app/video/mpv
   ../../user/lang/csharp
   ../../user/lang/phython
#   ../../user/lang/phython/phython-packages
   ../../user/app/desktop/gammastep

   ../../user/wm/${settings.user.wm}
   ../../user/style   
  ];

  programs.alacritty.enable = true;
  services = {
    syncthing.enable = true;
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  home.packages = with pkgs; [

    yt-dlp

    spotify

    libreoffice-fresh

    webcord-vencord
    whatsapp-for-linux

  ];
}
