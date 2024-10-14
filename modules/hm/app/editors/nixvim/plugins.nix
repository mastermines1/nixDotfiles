{...}:

{
	programs.nixvim.plugins = {
		bufferline.enable = true;
    web-devicons.enable = true;
		lualine.enable = true;
		nvim-tree = {
			enable = true;
			openOnSetup = true;
		};

		telescope = {
			enable = true;
			settings = {
				defaults = {
					file_ignore_patterns = [ ".git/[^h]" ];
				};
				pickers = {
					find_files = {
						hidden = true;
					};
				};
			};
		};

		oil = {
			enable = true;
			settings = {
				view_options.show_hidden = true;
			};
		};

		tmux-navigator.enable = true;

		treesitter.enable = true;
	};
}
