{
  pkgs,
  settings,
  ...
}: let
  theme = ../../../style/theme/cool.yaml;
  wallpaper = ../../../style/image + settings.wallpaper;
in {
  stylix = {
    enable = true;
    image = wallpaper;
    base16Scheme = theme;
    polarity = "dark";
    opacity = {
      applications = 0.8;
      terminal = 1.0;
      popups = 0.75;
    };
    targets = {
      neovim.enable = false;
      tmux.enable = false;
    };
    fonts = {
      serif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };

      sansSerif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };

      monospace = {
        name = "Fira Code";
        package = pkgs.fira-code;
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 11;
        desktop = 11;
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 32;
    };
  };
}
