{
  pkgs,
  config,
  ...
}: let
  inherit (config.lib.stylix) colors;
in {
  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        useSystemClipboard = true;
        lsp = {
          enable = true;
        };
        theme = {
          enable = true;
          name = "base16";
          style = "dark";
          base16-colors = colors;
          transparent = false;
        };
      };
    };
  };
}
