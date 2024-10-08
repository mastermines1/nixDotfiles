{ inputs, pkgs, settings, ...}:

{
  imports = [
    ../base/home.nix
  ] ++
  (map (m: ../../modules/hm + m) [
    /app/shell/shell.nix
    /app/shell/alacritty.nix
    /app/git
  ]);
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home.packages = with pkgs; [
    
  ];
}