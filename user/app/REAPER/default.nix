{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    reaper
    cardinal
    yabridge
  ];
  #home.sessionVariables = {
  #  WINEFSYNC = "1";
  #};
  #programs.zsh.sessionVariables = {
  #  WINEFSYNC = "1";
  #};
  #programs.bash.sessionVariables = {
  #  WINEFSYNC = "1";
  #};
}
