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
    theme = "everforest"; # The name of the theme in the ./themes folder.
    wallpaper = ""; #Set as "" to use wallpaper in theme file.
    reThemeWall = false; # Re-theme the colours of the paper with imagemagic
    wm = "hyprland";
    font = "Iosevka Aile";
    fontPkg = "iosevka";
    location = {
      lat = "0";
      lon = "0";
    };
  };
}
