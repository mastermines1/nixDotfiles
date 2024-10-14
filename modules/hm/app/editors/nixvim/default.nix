{...}:

{
	imports = [
		./plugins.nix
		./lsp.nix
	];

	programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };
    
    opts = {
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;

			number = true;
			relativenumber = true;
    };
		
		# Enables wl-copy as clipboard
    clipboard.providers.wl-copy.enable = true;


  };
}
