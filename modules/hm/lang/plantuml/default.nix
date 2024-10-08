{ pkgs, ... }:
{
  home.packages = with pkgs; [
    plantuml
    graphviz
  ];
}
