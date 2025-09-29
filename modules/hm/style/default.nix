{
  pkgs,
  ...
}: let
  theme = ../../../style/themes/carburator/regular.yaml;
	wallpaper = ../../../style/image/city-skyline-at-night-pixel-art-3euanvahlpictx46.jpg;
in {
  stylix = {
    enable = true;
		image = wallpaper;
    base16Scheme = theme;
    polarity = "dark";
    opacity = {
      applications = 0.8;
      terminal = 0.75;
      popups = 0.75;
    };
    targets = {
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
