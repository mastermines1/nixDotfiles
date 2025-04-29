{
  pkgs,
  settings,
  ...
}: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
    stateVersion = "24.05";
  };

  imports =
    [
      ../laptop_base/home.nix
    ]
    ++ (map (m: ../../modules/hm + m) [
      /app/editors/${settings.editor}
      /app/mpv/mpv.nix
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
    discord
    whatsapp-for-linux

    qbittorrent
    distrobox
    bubblewrap
    fuse-overlayfs
    dwarfs

    soulseekqt
    kid3

    gimp
dooit
  ];
}
