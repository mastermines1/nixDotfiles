{pkgs, config, lib, settings, ...}:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = settings.username;
  home.homeDirectory = "/home/${settings.username}";
  home.stateVersion = "23.11";

  imports = [
    ../desktop_base/home.nix
  ] ++
  (map (m: ../../modules/hm + m) [
    /app/editors/${settings.editor}
    /app/video/mpv.nix
    /app/programming/vscode
    /app/music-creation/reaper
    /wm/${settings.wm}.nix
    /style

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

		qbittorrent
  ];
}
