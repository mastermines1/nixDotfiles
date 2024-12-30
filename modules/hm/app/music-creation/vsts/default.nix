{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    surge-XT
    #   helm
    vital
    cardinal
    drumgizmo
    x42-avldrums
  ];
}
