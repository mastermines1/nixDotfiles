{
  pkgs,
  settings,
  ...
}: {
  home.packages = with pkgs; [
    neovim
    nixd
    lua-language-server
    sourcekit-lsp
    stylua
    statix
    deadnix
    ripgrep
    gcc
    alejandra
    cppcheck
    astyle
    uncrustify
    gdb
    clang-tools
  ];

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  home.file.".config/nvim" = {
    source = ./.;
    recursive = true;
  };

  home.file.".config/nvim/lua/settings.lua".text = ''
    vim.g.dotDir = "${settings.dotDir}"
    vim.g.profileName = "${settings.profile}"
    vim.g.gdb_path = "${pkgs.gdb}/bin/gdb"
  '';
}
