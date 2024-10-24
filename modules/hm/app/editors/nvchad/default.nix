{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    neovim
    neovim-remote
    neovide
    lua-language-server
    vscode-langservers-extracted
    nixd
    marksman
    bash-language-server
    nmap
    fzf
  ];
  programs.neovim = {
    viAlias = true;
    vimAlias = true;
  };
  home.file.".config/nvim".source = ./.;
  home.file.".config/nvim".recursive = true;
  home.file.".config/nvim/lua/themes/stylix.lua".source = config.lib.stylix.colors {
      template = builtins.readFile ./lua/themes/stylix.lua.mustache;
      extension = ".lua";
  };
}
