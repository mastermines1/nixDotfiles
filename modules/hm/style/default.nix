{
  pkgs,
  settings,
  ...
}: let
  theme = "${pkgs.base16-schemes}/share/themes/${settings.theme}.yaml";
  wallpaper = settings.wallpaper;
in {
  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "https://wallpapercave.com/wp/wp9218666.jpg";
      sha256 = "2467657648a269a1bf3aa7be4308642d371bf8cc063a7a1b86731c3d81c9508e";
      curlOptsList = ["-HUser-Agent: Wget/1.21.4"];
    };
    base16Scheme = theme;
    polarity = "dark";
    opacity = {
      applications = 0.8;
      terminal = 0.75;
      popups = 0.75;
    };
    targets = {
      vscode.enable = false;
      alacritty.enable = false;
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
