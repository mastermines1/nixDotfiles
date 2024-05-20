{ inputs, pkgs, settings, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports =
  [
    ../user/app/shell
    ../user/app/shell/scripts/update.nix
    ../user/app/alacritty
  ];

  programs.git = {
    enable = true;
    userName = settings.user.gitName;
    userEmail = settings.user.email;
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  home.packages = with pkgs; [
    firefox
    usbutils
    pciutils
    python3
    libressl
  ];

}
