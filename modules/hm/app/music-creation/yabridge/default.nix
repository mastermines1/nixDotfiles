{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    yabridge
    yabridgectl
  ];
  home.sessionVariables = {
    WINEFSYNC = "1";
  };
  programs.zsh.sessionVariables = {
    WINEFSYNC = "1";
  };
  programs.bash.sessionVariables = {
    WINEFSYNC = "1";
  };
}
