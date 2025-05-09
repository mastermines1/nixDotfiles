{
  pkgs,
  settings,
  ...
}: {
  home.packages = with pkgs; [
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
		typescript-language-server
  ];

  programs.neovim = {
		enable = true;
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
