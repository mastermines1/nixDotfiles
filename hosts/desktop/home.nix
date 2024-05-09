{lib, pkgs, settings, config, ... }:

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
#   ../../user/app/programming/vscode

   ../../user/wm/${settings.user.wm}
   ../../user/style   
  ];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${config.stylix.image}
    wallpaper = HDMI-A-1,${config.stylix.image}
    wallpaper = DP-2,${config.stylix.image}
    splash = false
  '';

  programs.alacritty.enable = true;
  services = {
    syncthing.enable = true;
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  home.packages = with pkgs; [
    
    gparted
    baobab
    vscode.fhs

    cbonsai

    cava
    playerctl

    yt-dlp

    spotify
    spotify-cli-linux

    legendary-gl

    libreoffice-fresh
    gnumake

    webcord-vencord
    whatsapp-for-linux

    avalonia-ilspy

    dwarfs
    fuse-overlayfs
    bubblewrap
    wine
    qbittorrent
    mullvad-vpn

  ];
}
