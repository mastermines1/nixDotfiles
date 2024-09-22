# Configuration for Stylix
# https://github.com/danth/stylix

# Atlantis Garbage Worker by Grady Frederick
# https://www.artstation.com/artwork/W2GERJ

{ lib, pkgs, config, ... }:

{
  stylix = {
    image = pkgs.fetchurl {
      #url = "https://4kwallpapers.com/images/wallpapers/stars-in-sky-galaxy-3840x2160-15601.jpg";
      #sha256 = "e57b111b04549957ab57ead3d4cff9017f5173ee3ebec0864de463f462c47c3f";
      url = "https://wallpapercave.com/wp/wp9218666.jpg";
      sha256 = "2467657648a269a1bf3aa7be4308642d371bf8cc063a7a1b86731c3d81c9508e";
      curlOptsList = ["-HUser-Agent: Wget/1.21.4"];
    };
    polarity = "dark";

    opacity = {
      desktop = 1.0; #waybars opacity
      popups = 0.75;
      terminal = 0.9;
    };

    targets = {

    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
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
  };
}
