{ config, lib, pkgs, ... }:

{
  programs.alacritty.enable = true;
#  home.file.".config/alacritty/alacritty.toml".text = ''
#  ${lib.fileContents ./alacritty.toml}
#  '';
xdg.configFile.alacritty = { source = ./alacritty.toml; recursive = true; };

}
