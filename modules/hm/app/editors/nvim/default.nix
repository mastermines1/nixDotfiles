{
  config,
  pkgs,
  settings,
  ...
}: {
  programs.neovim = let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      nixd

      wl-clipboard

      alejandra
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./plugin/lsp.lua;
      }

      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

      neodev-nvim

      nvim-cmp
      {
        plugin = nvim-cmp;
        config = toLuaFile ./plugin/cmp.lua;
      }

      {
        plugin = telescope-nvim;
        config = toLuaFile ./plugin/telescope.lua;
      }

      telescope-fzf-native-nvim

      cmp_luasnip
      cmp-nvim-lsp

      luasnip
      friendly-snippets
      
      {
        plugin = lualine-nvim;
        config = toLua "require(\"lualine\").setup( icons_enabled = true)";
      }
      nvim-web-devicons

      bufferline-nvim
      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
        ]);
        config = toLuaFile ./plugin/treesitter.lua;
      }

      vim-nix
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      
require("lspconfig").nixd.setup({
  cmd = { "nixd" },
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
      },
      options = {
        nixos = {
      		expr = '(builtins.getFlake "${settings.dotDir}").nixosConfigurations.${settings.username}.options',
    		},
    	home_manager = {
    		expr = '(builtins.getFlake "${settings.dotDir}").homeConfigurations.${settings.username}.options',
  		},
  		},
  	},
  },
})
    '';
  };

  home.file.".config/nvim/colors/stylix.lua".source = config.lib.stylix.colors {
    template = builtins.readFile ./themes/stylix.lua.mustache;
    extension = ".lua";
  };
}
