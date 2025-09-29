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
    stateVersion = "23.11";
  };

  imports =
    [
      ../desktop_base/home.nix
    ]
    ++ (map (m: ../../modules/hm + m) [
      /app/editors/${settings.editor}
      /app/media/mpv.nix
			/app/media/mpd.nix
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
    # spotify

    #WINE
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

    nicotine-plus
    kid3

    gimp

		dooit

		networkmanagerapplet

    wineWowPackages.stagingFull  # 32-bit and 64-bit Wine support
    winetricks
    dxvk
    libpulseaudio
    vulkan-tools
    mesa

  ];
}
