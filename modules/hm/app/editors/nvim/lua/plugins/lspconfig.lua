return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			capabilites = capabilites,
		})
		-- Nixd for Nix	
		lspconfig.nixd.setup({
			capabilites = capabilites,
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
							expr = '(builtins.getFlake \"~/.dotfiles\").nixosConfigurations.desktop.options',
						},
						home_manager = {
							expr = '(builtins.getFlake \"~/.dotfiles\").homeConfigurations.desktop.options',
						},
					},
				},
			},
		})

		-- Keybinds
		local keymap = vim.keymap

		keymap.set('n', 'K', vim.lsp.buf.hover, {})
		keymap.set('n', 'gd', vim.lsp.buf.definition, {})
		keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
	end
}
