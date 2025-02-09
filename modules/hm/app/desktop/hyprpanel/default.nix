{
  inputs,
  pkgs,
  settings,
  ...
}: {
  home.packages = [
    inputs.hyprpanel.packages.${pkgs.system}.default
  ];
}
