{
  pkgs,
  settings,
  ...
}: let
  theme = ../../../style/theme/cool.yaml;
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
