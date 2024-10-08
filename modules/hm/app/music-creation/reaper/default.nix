{ config, lib, pkgs, ... }:

{
  imports = [
    ../yabridge
    ../vsts
  ];
  home.packages = with pkgs; [
    reaper
    hydrogen
  ];
}
