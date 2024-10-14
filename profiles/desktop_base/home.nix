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
  
  home.packages = with pkgs; [
    
  ];
}