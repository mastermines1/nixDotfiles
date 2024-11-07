{pkgs, ...}: {
  home.packages = with pkgs; [
    neovim
    nixd
    lua-language-server
    stylua
		statix
		deadnix
    ripgrep
    gcc
    alejandra
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
}
