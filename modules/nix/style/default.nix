{lib, pkgs, stylix, config, settings, ... }:
let
  theme = "${pkgs.base16-schemes}/share/themes/${settings.theme}.yaml";
in
{
  stylix = {
    enable = true;
    homeManagerIntegration.autoImport = true;
    base16Scheme = theme;
    image = pkgs.fetchurl {
      url = "https://wallpapercave.com/wp/wp9218666.jpg";
      sha256 = "2467657648a269a1bf3aa7be4308642d371bf8cc063a7a1b86731c3d81c9508e";
      curlOptsList = ["-HUser-Agent: Wget/1.21.4"];
    };
    polarity = "dark";
  };
}