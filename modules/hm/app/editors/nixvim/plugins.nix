{...}:

{
	programs.nixvim.plugins = {
		bufferline.enable = true;
    web-devicons.enable = true;
		lualine.enable = true;
		nvim-tree = {
			enable = true;
			openOnSetup = true;
			autoClose = true;
			actions.openFile.quitOnOpen = true;
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
		comment.enable = true;
		treesitter.enable = true;
	};
}
