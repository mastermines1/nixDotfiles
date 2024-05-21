{
  system = {
    system = "x86_64-linux";
    isNixOS = true;
    profile = "desktop";
    displayManager = "gdm";
    dotDir = "/home/milesc/.dotfiles";
  };
  user = {
    name = "Miles Campbell"; # Your name.
    username = "milesc"; #The name of the user account.
    email = "milespatrickcampbell@gmail.com"; # Your email (used for git).
    gitName = "mastermines1";
    wm = "hyprland";
    font = "Iosevka Aile";
    fontPkg = "iosevka";
    location = {
      lat = "0";
      lon = "0";
    };
  };
}
