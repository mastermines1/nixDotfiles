{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerd-fonts.inconsolata
    powerline
    inconsolata
    iosevka
    font-awesome
    ubuntu_font_family
    terminus_font
    meslo-lgs-nf
    arkpandora_ttf
  ];
}
