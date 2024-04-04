{ config, lib, pkgs, settings, ... }:
{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${config.stylix.image}
    wallpaper = HDMI-A-1,${config.stylix.image}
    wallpaper = DP-2,${config.stylix.image}
    splash = false
  '';

  stylix = {
    image = ./wallpaper.jpg;
    polarity = "dark";
#    base16Scheme = ../../themes/everforest/everforest.yaml;
    fonts.sizes = {
      terminal = 12;
      applications = 12;
      popups = 12;
      desktop = 12;
    };
    targets.waybar.enable = false;
    targets.alacritty.enable = false;
    fonts = {
      monospace = {
        name = settings.user.font;
        package = pkgs.${settings.user.fontPkg};
      };
      serif = {
        name = settings.user.font;
        package = pkgs.${settings.user.fontPkg};
      };
      sansSerif = {
        name = settings.user.font;
        package = pkgs.${settings.user.fontPkg};
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
  };

  programs.alacritty.settings = {
    colors = {
      primary.background = "#"+config.lib.stylix.colors.base00;
      primary.foreground = "#"+config.lib.stylix.colors.base07;
      cursor.text = "#"+config.lib.stylix.colors.base00;
      cursor.cursor = "#"+config.lib.stylix.colors.base07;
      normal.black = "#"+config.lib.stylix.colors.base00;
      normal.red = "#"+config.lib.stylix.colors.base08;
      normal.green = "#"+config.lib.stylix.colors.base0B;
      normal.yellow = "#"+config.lib.stylix.colors.base0A;
      normal.blue = "#"+config.lib.stylix.colors.base0D;
      normal.magenta = "#"+config.lib.stylix.colors.base0E;
      normal.cyan = "#"+config.lib.stylix.colors.base0B;
      normal.white = "#"+config.lib.stylix.colors.base05;
      bright.black = "#"+config.lib.stylix.colors.base03;
      bright.red = "#"+config.lib.stylix.colors.base09;
      bright.green = "#"+config.lib.stylix.colors.base01;
      bright.yellow = "#"+config.lib.stylix.colors.base02;
      bright.blue = "#"+config.lib.stylix.colors.base04;
      bright.magenta = "#"+config.lib.stylix.colors.base06;
      bright.cyan = "#"+config.lib.stylix.colors.base0F;
      bright.white = "#"+config.lib.stylix.colors.base07;
    };
    font.size = config.stylix.fonts.sizes.terminal;
  };

  home.packages = with pkgs; [
     qt5ct pkgs.libsForQt5.breeze-qt5
  ];
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME="qt5ct";
  };
  programs.zsh.sessionVariables = {
    QT_QPA_PLATFORMTHEME="qt5ct";
  };
  programs.bash.sessionVariables = {
    QT_QPA_PLATFORMTHEME="qt5ct";
  };
  qt = {
    platformTheme = "qtct";
    enable = true;
    style.package = pkgs.libsForQt5.breeze-qt5;
    style.name = "breeze-dark";
  };
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
}
