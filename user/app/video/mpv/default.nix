{ config, lib, pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
        thumbfast
        visualizer
        sponsorblock
        quality-menu
      ];
  };
}
