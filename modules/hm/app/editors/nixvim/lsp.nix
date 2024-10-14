{...}:

{
	programs.nixvim.plugins = {
		lsp = {
			enable = true;
			servers = {
				nil_ls.enable = true;
				lua_ls.enable = true;
			};
		};
		cmp = {
			autoEnableSources = true;
			settings.sources = [
				{name = "nvim_lsp";}
				{name = "path";}
				{name = "buffer";}
			];
		};
	};
}

