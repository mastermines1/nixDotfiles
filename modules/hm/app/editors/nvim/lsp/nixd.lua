---@brief
---
--- https://github.com/nix-community/nixd
---
--- Nix language server, based on nix libraries.
---
--- If you are using Nix with Flakes support, run `nix profile install github:nix-community/nixd` to install.
--- Check the repository README for more information.

---@type vim.lsp.Config
return {
	cmd = { 'nixd' },
	filetypes = { 'nix' },
	root_markers = { 'flake.nix', '.git' },
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import (builtins.getFlake (builtins.toString ./.)).inputs.nixpkgs { }",
			},
			formatting = {
				command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
			},
			options = {
				nixos = {
				expr = "(builtins.getFlake (builtins.toString ./.dotfiles)).nixosConfigurations.laptop.options",
				},
			},
		},
	},
}
