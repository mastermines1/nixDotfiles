{pkgs, config, lib, ...}:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "${settings.user.username}";
  home.homeDirectory = "/home/${settings.user.username}";
  home.stateVersion = "23.11";

  imports = [
    ../desktop_base/home.nix
  ] ++
  (map (m: ../../modules/hm + m) [
    /app/editors/emacs
    /app/video/mpv.nix
    /app/music-creation/reaper
    /wm/${settings.wm}.nix

    /lang/csharp
    /lang/python
  ]);

  services = {

  };

  home.packages = with pkgs; [
    #files
    baobab
    gnome-disk-utility
    file-roller

    libreoffice-fresh

    yt-dlp
    spotify

    #WINE
    wine
    bottles

    #games
    legendary-gl
    prismlauncher

    #messages
    webcord-vencord
    whatsapp-for-linux
  ];
}