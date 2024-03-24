{ config, lib, pkgs, settings, ... }:
let
  themePath = ../../themes/${settings.user.theme};
  theme = "${themePath}/${settings.user.theme}.yaml";

  # If the wallpaper is not set in settings, use the theme wallpaper
  wallfile = if settings.user.wallpaper == "" then "${themePath}/wallpaper.png" else settings.user.wallpaper;
  # If reThemeWall is true, use image magic to change the colours if the image to use the pallet
  wallpaper = if settings.user.reThemeWall then pkgs.runCommand "wallout.png" {} ''
        BASE00="#"$(${pkgs.yq}/bin/yq -r .base00 ${theme})
        BASE01="#"$(${pkgs.yq}/bin/yq -r .base01 ${theme})
        BASE02="#"$(${pkgs.yq}/bin/yq -r .base02 ${theme})
        BASE03="#"$(${pkgs.yq}/bin/yq -r .base03 ${theme})
        BASE04="#"$(${pkgs.yq}/bin/yq -r .base04 ${theme})
        BASE05="#"$(${pkgs.yq}/bin/yq -r .base05 ${theme})
        BASE06="#"$(${pkgs.yq}/bin/yq -r .base06 ${theme})
        BASE07="#"$(${pkgs.yq}/bin/yq -r .base07 ${theme})
        BASE08="#"$(${pkgs.yq}/bin/yq -r .base08 ${theme})
        BASE09="#"$(${pkgs.yq}/bin/yq -r .base09 ${theme})
        BASE0A="#"$(${pkgs.yq}/bin/yq -r .base0A ${theme})
        BASE0B="#"$(${pkgs.yq}/bin/yq -r .base0B ${theme})
        BASE0C="#"$(${pkgs.yq}/bin/yq -r .base0C ${theme})
        BASE0D="#"$(${pkgs.yq}/bin/yq -r .base0D ${theme})
        BASE0E="#"$(${pkgs.yq}/bin/yq -r .base0E ${theme})
        BASE0F="#"$(${pkgs.yq}/bin/yq -r .base0F ${theme})

        ${pkgs.imagemagick}/bin/magick convert -size 1x8 xc:none +antialias -depth 8 -define png:color-type=2 \
        \( +clone -fill "$BASE00" -draw 'color 0,0 point' \) \
        \( +clone -fill "$BASE01" -draw 'color 0,1 point' \) \
        \( +clone -fill "$BASE02" -draw 'color 0,2 point' \) \
        \( +clone -fill "$BASE03" -draw 'color 0,3 point' \) \
        \( +clone -fill "$BASE04" -draw 'color 0,4 point' \) \
        \( +clone -fill "$BASE05" -draw 'color 0,5 point' \) \
        \( +clone -fill "$BASE06" -draw 'color 0,6 point' \) \
        \( +clone -fill "$BASE07" -draw 'color 0,7 point' \) \
        \( +clone -fill "$BASE08" -draw 'color 0,0 point' \) \
        \( +clone -fill "$BASE09" -draw 'color 0,1 point' \) \
        \( +clone -fill "$BASE0A" -draw 'color 0,2 point' \) \
        \( +clone -fill "$BASE0B" -draw 'color 0,3 point' \) \
        \( +clone -fill "$BASE0C" -draw 'color 0,4 point' \) \
        \( +clone -fill "$BASE0D" -draw 'color 0,5 point' \) \
        \( +clone -fill "$BASE0E" -draw 'color 0,6 point' \) \
        \( +clone -fill "$BASE0F" -draw 'color 0,7 point' \) \
        -append palette.png

        ${pkgs.imagemagick}/bin/magick convert "${wallfile}" -dither FloydSteinberg -ordered-dither o4x4 -remap palette.png -type truecolor $out
  ''
    else /. + wallfile;
in
{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${config.stylix.image}
    wallpaper = HDMI-A-1,${config.stylix.image}
    wallpaper = DP-2,${config.stylix.image}
  '';

  stylix = {
    image = wallpaper;
    base16Scheme = theme;
    fonts.sizes = {
      terminal = 12;
      applications = 12;
      popups = 12;
      desktop = 12;
    };
    targets.waybar.enable = true;
    targets.alacritty.enable = true;
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
