{...}:

{
	programs.nixvim = {
		keymaps = [
			{
				action = "NvimTreeToggle";
				key = "<C-a";
				options = {
					silent = true;
				};
			}
		];
	};
}
