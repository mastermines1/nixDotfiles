{ config, lib, pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
        thumbfast
        visualizer
        sponsorblock
        quality-menu
        #memo
        reload
        autoload
        mpv-cheatsheet
        mpv-playlistmanager
        #autosubsync-mpv
        webtorrent-mpv-hook
    ];
  };
}
