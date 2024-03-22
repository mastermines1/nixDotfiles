{ inputs, pkgs, settings, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports =
  [
    ../user/app/shell
    ../user/app/shell/scripts/update.nix
  ];
  programs.git = {
    enable = true;
    userName = settings.user.gitName;
    userEmail = settings.user.email;
  };
  home.packages = with pkgs; [
    gh
    oh-my-zsh
    alacritty
    firefox
    syncthing
    syncthingtray
    usbutils
    pciutils
    python3
    libressl
  ];

}
