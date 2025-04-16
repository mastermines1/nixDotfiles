{pkgs, ...}: {
  imports = map (m: ../app/desktop + m) [
    /mako
		/fuzzel
  ];

  home.packages = with pkgs; [
    hyprpaper
  ];

  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
      hyprland = {
        default = [
          "gtk"
          "kde"
          "hyprland"
        ];
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
