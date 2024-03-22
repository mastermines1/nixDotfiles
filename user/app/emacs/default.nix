{ config, pkgs, settings,... }:
{
  imports = [ 
    ../../lang/plantuml

    # Emacs config files:
    ./config.el.nix
    ./init.el.nix
    ./packages.el.nix
  ];
 
  home.packages = with pkgs; [
    ripgrep
    emacs-all-the-icons-fonts
  ];
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
  };
  services.emacs.enable = true;

  home.file.".config/emacs/themes/doom-stylix-theme.el".source = config.lib.stylix.colors {
      template = builtins.readFile ./themes/doom-stylix-theme.el.mustache;
      extension = ".el";
  };
}
