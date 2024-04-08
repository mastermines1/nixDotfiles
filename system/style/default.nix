{ lib, pkgs, stylix, settings, ... }:
let
  themePath = ../../themes/${settings.user.theme};
  theme = "${themePath}/${settings.user.theme}.yaml";
in
{
  stylix = {
    #base16Scheme = theme;
    polarity = "dark";
  };
  qt.platformTheme = "qt5ct";
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
}
