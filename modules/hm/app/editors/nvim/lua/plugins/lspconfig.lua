return {
	"neovim/nvim-lspconfig",
	dependecies = {
		"saghen/blink.cmp",
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
		local lspconfig = require("lspconfig")

		-- lua_ls for lua
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
							expr = string.format(
								"(builtins.getFlake [%s]).nixosConfigurations.[%s].options",
								vim.g.dotDir,
								vim.g.profileName
							),
						},
					},
				},
			},
		})

		lspconfig.sourcekit.setup({
			capabilities = capabilities,
		})

		-- Keybinds
		local keymap = vim.keymap

		keymap.set("n", "K", vim.lsp.buf.hover, {})
		keymap.set("n", "gd", vim.lsp.buf.definition, {})
		keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
