{
  pkgs,
  inputs,
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
		python3Packages.python-lsp-server
		ruff
		tinymist
		typst
		mypy
  ];

  programs.neovim = {
		enable = true;
		package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    vimAlias = true;
    defaultEditor = true;
  };

  # home.file.".config/nvim" = {
  #   source = ./.;
  #   recursive = true;
  # };

  # home.file.".config/nvim/lua/settings.lua".text = ''
  #   vim.g.dotDir = "${settings.dotDir}"
  #   vim.g.profileName = "${settings.profile}"
  #   vim.g.gdb_path = "${pkgs.gdb}/bin/gdb"
  # '';
}
