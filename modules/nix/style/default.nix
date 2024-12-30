{
  lib,
  pkgs,
  stylix,
  config,
  settings,
  ...
}: let
  theme = "${pkgs.base16-schemes}/share/themes/${settings.theme}.yaml";
in {
  stylix = {
    enable = true;
    homeManagerIntegration.autoImport = true;
    base16Scheme = theme;
    image = config.home-manager.users.${settings.username}.stylix.image;
    polarity = "dark";
  };
}
